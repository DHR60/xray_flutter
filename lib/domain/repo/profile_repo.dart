import 'package:xray_flutter/data/db/app_database.dart';

abstract class ProfileRepo {
  Stream<List<ProfileItemData>> watchAllProfiles();
  Stream<List<ProfileItemData>> watchProfiles({String? keyword, String? subId});
  Future<List<ProfileItemData>> getProfiles({String? keyword, String? subId});
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
  Future<int> reorderProfile(
    int oldIndex,
    int newIndex, {
    String? keyword,
    String? subId,
  });

  /// Update subscription profiles. Provide the new profile list [newProfiles] and the subscription ID [subId].
  ///
  /// Returns the updated list of profiles.
  ///
  /// Compares old and new profiles and preserves the indexId of unchanged profiles.
  /// Then deletes all profiles where `isSub` is true and `subId` equals [subId].
  /// Finally inserts the new profiles; `orderIndex` is regenerated according to the provided order.
  Future<List<ProfileItemData>> updateProfilesFromSubscription(
    List<ProfileItemData> newProfiles,
    String subId,
  );
}
