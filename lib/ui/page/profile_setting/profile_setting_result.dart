import 'package:xray_flutter/data/db/app_database.dart';

sealed class ProfileSettingResult {
  const ProfileSettingResult();
}

class ProfileSettingUpsert extends ProfileSettingResult {
  const ProfileSettingUpsert(this.profile);
  final ProfileItemData profile;
}

class ProfileSettingDelete extends ProfileSettingResult {
  const ProfileSettingDelete(this.profile);
  final ProfileItemData profile;
}

class ProfileSettingNone extends ProfileSettingResult {
  const ProfileSettingNone();
}