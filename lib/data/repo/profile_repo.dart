import 'package:xray_flutter/data/db/app_database.dart';

class ProfileRepo {
  final AppDatabase _database;

  ProfileRepo(this._database);

  Stream<List<ProfileItemData>> watchAllProfiles() {
    return _database.select(_database.profileItem).watch();
  }

  Future<List<ProfileItemData>> getAllProfiles() {
    return _database.select(_database.profileItem).get();
  }

  Future<int> insertProfile(ProfileItemData data) {
    return _database.into(_database.profileItem).insert(data);
  }

  Future<int> deleteProfile(String indexId) {
    return (_database.delete(_database.profileItem)
          ..where((tbl) => tbl.indexId.equals(indexId)))
        .go();
  }

  Future<int> updateProfile(ProfileItemData data) {
    return (_database.update(_database.profileItem)
          ..where((tbl) => tbl.indexId.equals(data.indexId)))
        .write(data);
  }
}