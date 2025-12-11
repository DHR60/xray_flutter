import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xray_flutter/data/settings/state_item_dto.dart';
import 'package:xray_flutter/data/settings/ui_item_dto.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

@freezed
abstract class AppConfig with _$AppConfig {
  const factory AppConfig({
    required UiItemDto uiItem,
    required StateItemDto stateItem,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
}