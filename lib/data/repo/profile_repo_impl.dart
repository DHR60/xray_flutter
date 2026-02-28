import 'package:drift/drift.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/data/db/converter/uuid_blob_converter.dart';
import 'package:xray_flutter/data/model/profile_item_factory.dart';
import 'package:xray_flutter/domain/repo/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final AppDatabase _database;

  ProfileRepoImpl(this._database);

  @override
  Stream<List<ProfileItemData>> watchAllProfiles() {
    return (_database.select(
      _database.profileItem,
    )..orderBy([(tbl) => OrderingTerm(expression: tbl.orderIndex)])).watch();
  }

  @override
  Stream<List<ProfileItemData>> watchProfiles({
    String? keyword,
    String? subId,
  }) {
    return (_database.select(_database.profileItem)
          ..orderBy([(tbl) => OrderingTerm(expression: tbl.orderIndex)])
          ..where((tbl) {
            final List<Expression<bool>> expressions = [];
            if (subId != null && subId.isNotEmpty) {
              expressions.add(tbl.subid.equals(subId));
            }
            if (keyword != null && keyword.isNotEmpty) {
              expressions.add(tbl.remarks.like('%$keyword%'));
            }

            if (expressions.isEmpty) return const Constant(true);
            return expressions.reduce((a, b) => a & b);
          }))
        .watch();
  }

  @override
  Future<List<ProfileItemData>> getProfiles({String? keyword, String? subId}) {
    return (_database.select(_database.profileItem)
          ..orderBy([(tbl) => OrderingTerm(expression: tbl.orderIndex)])
          ..where((tbl) {
            final List<Expression<bool>> expressions = [];
            if (subId != null && subId.isNotEmpty) {
              expressions.add(tbl.subid.equals(subId));
            }
            if (keyword != null && keyword.isNotEmpty) {
              expressions.add(tbl.remarks.like('%$keyword%'));
            }

            if (expressions.isEmpty) return const Constant(true);
            return expressions.reduce((a, b) => a & b);
          }))
        .get();
  }

  @override
  Future<List<ProfileItemData>> getAllProfiles() {
    return _database.select(_database.profileItem).get();
  }

  @override
  Future<int> insertProfile(ProfileItemData data) {
    return _database.into(_database.profileItem).insert(data);
  }

  @override
  Future<int> deleteProfile(String indexId) {
    return (_database.delete(
      _database.profileItem,
    )..where((tbl) => tbl.indexId.equalsValue(indexId))).go();
  }

  @override
  Future<int> updateProfile(ProfileItemData data) {
    return (_database.update(
      _database.profileItem,
    )..where((tbl) => tbl.indexId.equalsValue(data.indexId))).write(data);
  }

  @override
  Future<ProfileItemData?> getProfileById(String indexId) {
    return (_database.select(
      _database.profileItem,
    )..where((tbl) => tbl.indexId.equalsValue(indexId))).getSingleOrNull();
  }

  @override
  Future<int> upsertProfile(ProfileItemData data) async {
    final existing = await getProfileById(data.indexId);
    if (existing == null) {
      return insertProfile(data);
    } else {
      return updateProfile(data);
    }
  }

  @override
  Future<ProfileItemData?> getFirstProfileByRemarks(String remarks) {
    return (_database.select(
      _database.profileItem,
    )..where((tbl) => tbl.remarks.equals(remarks))).getSingleOrNull();
  }

  @override
  Future<int> deleteProfilesBySubId(String subId) {
    return (_database.delete(
      _database.profileItem,
    )..where((tbl) => tbl.subid.equals(subId))).go();
  }

  @override
  Future<void> fixOrderIndices() async {
    await _database.transaction(() async {
      final profiles = await (_database.select(
        _database.profileItem,
      )..orderBy([(tbl) => OrderingTerm(expression: tbl.orderIndex)])).get();

      for (int i = 0; i < profiles.length; i++) {
        final profile = profiles[i];
        if (profile.orderIndex != i) {
          await (_database.update(_database.profileItem)
                ..where((tbl) => tbl.indexId.equalsValue(profile.indexId)))
              .write(profile.copyWith(orderIndex: i));
        }
      }
    });
  }

  @override
  Future<int> getMaxOrderIndex() async {
    final query = _database.selectOnly(_database.profileItem)
      ..addColumns([_database.profileItem.orderIndex.max()]);
    final result = await query.getSingle();
    return result.read(_database.profileItem.orderIndex.max()) ?? 0;
  }

  @override
  Future<int> reorderProfile(
    int oldIndex,
    int newIndex, {
    String? keyword,
    String? subId,
  }) async {
    return _database.transaction(() async {
      // Only read the fields needed for reordering.
      final query = _database.selectOnly(_database.profileItem)
        ..addColumns([
          _database.profileItem.indexId,
          _database.profileItem.orderIndex,
        ])
        ..orderBy([OrderingTerm(expression: _database.profileItem.orderIndex)]);

      final List<Expression<bool>> expressions = [];
      if (subId != null && subId.isNotEmpty) {
        expressions.add(_database.profileItem.subid.equals(subId));
      }
      if (keyword != null && keyword.isNotEmpty) {
        expressions.add(_database.profileItem.remarks.like('%$keyword%'));
      }
      if (expressions.isNotEmpty) {
        query.where(expressions.reduce((a, b) => a & b));
      }

      final rows = await query.get();
      if (rows.isEmpty) return 0;

      if (oldIndex < 0 ||
          oldIndex >= rows.length ||
          newIndex < 0 ||
          newIndex >= rows.length) {
        return 0;
      }

      final items = rows
          .map(
            (r) => (
              id: r.readWithConverter(_database.profileItem.indexId)!,
              orderIndex: r.read(_database.profileItem.orderIndex)!,
            ),
          )
          .toList();

      // Keep other (non-filtered) profiles fixed by only reusing the existing
      // orderIndex "slots" of the filtered set.
      final orderSlots = items.map((e) => e.orderIndex).toList();

      final reordered = [...items];
      final moved = reordered.removeAt(oldIndex);
      reordered.insert(newIndex, moved);

      final updates = <(String id, int desiredOrderIndex)>[];
      for (int i = 0; i < reordered.length; i++) {
        final item = reordered[i];
        final desiredOrderIndex = orderSlots[i];
        if (item.orderIndex != desiredOrderIndex) {
          updates.add((item.id, desiredOrderIndex));
        }
      }
      if (updates.isEmpty) return 0;

      await _database.batch((batch) {
        for (final (id, desiredOrderIndex) in updates) {
          batch.update(
            _database.profileItem,
            ProfileItemCompanion(orderIndex: Value(desiredOrderIndex)),
            where: (tbl) => tbl.indexId.equalsValue(id),
          );
        }
      });

      return updates.length;
    });
  }

  @override
  Future<List<ProfileItemData>> updateProfilesFromSubscription(
    List<ProfileItemData> newProfiles,
    String subId,
  ) async {
    return _database.transaction(() async {
      final existingProfiles =
          await (_database.select(_database.profileItem)
                ..where(
                  (tbl) => tbl.isSub.equals(true) & tbl.subid.equals(subId),
                )
                ..orderBy([(tbl) => OrderingTerm(expression: tbl.orderIndex)]))
              .get();

      final updatedProfiles = <ProfileItemData>[];
      for (final newProfile in newProfiles) {
        final match = existingProfiles.firstWhere(
          (e) => ProfileItemFactory.isRemoteEqual(e, newProfile),
          orElse: () => ProfileItemFactory.createDefault('', 0),
        );

        if (match.indexId.isNotEmpty) {
          updatedProfiles.add(newProfile.copyWith(indexId: match.indexId));
        } else {
          updatedProfiles.add(newProfile);
        }
      }

      await (_database.delete(
        _database.profileItem,
      )..where((tbl) => tbl.isSub.equals(true) & tbl.subid.equals(subId))).go();

      var orderIndex = await getMaxOrderIndex() + 1;
      await _database.batch((batch) {
        for (final profile in updatedProfiles) {
          final toInsert = profile.copyWith(
            isSub: true,
            subid: subId,
            orderIndex: orderIndex++,
          );
          batch.insert(_database.profileItem, toInsert);
        }
      });

      final inserted =
          await (_database.select(_database.profileItem)
                ..where(
                  (tbl) => tbl.isSub.equals(true) & tbl.subid.equals(subId),
                )
                ..orderBy([(tbl) => OrderingTerm(expression: tbl.orderIndex)]))
              .get();

      return inserted;
    });
  }
}
