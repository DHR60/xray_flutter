import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/domain/core/result.dart';

abstract class Fmtable {
  Result<ProfileItemData> parse(String uriStr, ProfileItemData base);
  String build(ProfileItemData data);
}
