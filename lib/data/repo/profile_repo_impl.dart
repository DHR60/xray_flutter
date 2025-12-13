import 'package:drift/drift.dart';
import 'package:xray_flutter/data/db/app_database.dart';
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
    )..where((tbl) => tbl.indexId.equals(indexId))).go();
  }

  @override
  Future<int> updateProfile(ProfileItemData data) {
    return (_database.update(
      _database.profileItem,
    )..where((tbl) => tbl.indexId.equals(data.indexId))).write(data);
  }

  @override
  Future<ProfileItemData?> getProfileById(String indexId) {
    return (_database.select(
      _database.profileItem,
    )..where((tbl) => tbl.indexId.equals(indexId))).getSingleOrNull();
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
      final profiles = await (_database.select(_database.profileItem)
            ..orderBy([(tbl) => OrderingTerm(expression: tbl.orderIndex)]))
          .get();

      for (int i = 0; i < profiles.length; i++) {
        final profile = profiles[i];
        if (profile.orderIndex != i) {
          await (_database.update(_database.profileItem)
                ..where((tbl) => tbl.indexId.equals(profile.indexId)))
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
  Future<int> reorderProfile(int oldIndex, int newIndex) async {
    return _database.transaction(() async {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }

      final profiles = await (_database.select(_database.profileItem)
            ..orderBy([(tbl) => OrderingTerm(expression: tbl.orderIndex)]))
          .get();

      if (oldIndex < 0 ||
          oldIndex >= profiles.length ||
          newIndex < 0 ||
          newIndex >= profiles.length) {
        return 0;
      }

      final item = profiles.removeAt(oldIndex);
      profiles.insert(newIndex, item);

      for (int i = 0; i < profiles.length; i++) {
        final profile = profiles[i];
        if (profile.orderIndex != i) {
          await (_database.update(_database.profileItem)
                ..where((tbl) => tbl.indexId.equals(profile.indexId)))
              .write(profile.copyWith(orderIndex: i));
        }
      }
      return 0;
    });
  }
}
