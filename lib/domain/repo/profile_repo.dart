import 'package:xray_flutter/data/db/app_database.dart';

abstract class ProfileRepo {
  Stream<List<ProfileItemData>> watchAllProfiles();
  Stream<List<ProfileItemData>> watchProfiles({String? keyword, String? subId});
  Future<List<ProfileItemData>> getAllProfiles();
  Future<ProfileItemData?> getProfileById(String indexId);
  Future<int> insertProfile(ProfileItemData data);
  Future<int> updateProfile(ProfileItemData data);
  Future<int> deleteProfile(String indexId);
  Future<int> upsertProfile(ProfileItemData data);
  Future<ProfileItemData?> getFirstProfileByRemarks(String remarks);
  Future<int> deleteProfilesBySubId(String subId);
  Future<void> fixOrderIndices();
  Future<int> getMaxOrderIndex();
  Future<int> reorderProfile(int oldIndex, int newIndex);
}
