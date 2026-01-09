import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xray_flutter/data/config/core/core_item_dto.dart';
import 'package:xray_flutter/data/config/routing_item_dto.dart';
import 'package:xray_flutter/data/config/state_item_dto.dart';
import 'package:xray_flutter/data/config/sub_item_dto.dart';
import 'package:xray_flutter/data/config/ui_item_dto.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

@freezed
abstract class AppConfig with _$AppConfig {
  const factory AppConfig({
    @Default(UiItemDto()) UiItemDto uiItem,
    @Default(StateItemDto()) StateItemDto stateItem,
    @Default(<SubItemDto>[]) List<SubItemDto> subItems,
    @Default(<RoutingItemDto>[]) List<RoutingItemDto> routingItems,
    @Default(CoreItemDto()) CoreItemDto coreItem,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
}
