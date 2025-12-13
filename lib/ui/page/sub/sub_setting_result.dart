import 'package:xray_flutter/data/config/sub_item_dto.dart';

sealed class SubSettingResult {
  const SubSettingResult();
}

class SubSettingUpsert extends SubSettingResult {
  const SubSettingUpsert(this.item);
  final SubItemDto item;
}

class SubSettingDelete extends SubSettingResult {
  const SubSettingDelete(this.item);
  final SubItemDto item;
}

class SubSettingNone extends SubSettingResult {
  const SubSettingNone();
}
