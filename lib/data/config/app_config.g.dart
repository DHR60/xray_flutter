// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => _AppConfig(
  uiItem: json['uiItem'] == null
      ? const UiItemDto()
      : UiItemDto.fromJson(json['uiItem'] as Map<String, dynamic>),
  stateItem: json['stateItem'] == null
      ? const StateItemDto()
      : StateItemDto.fromJson(json['stateItem'] as Map<String, dynamic>),
  subItems:
      (json['subItems'] as List<dynamic>?)
          ?.map((e) => SubItemDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SubItemDto>[],
  routingItems:
      (json['routingItems'] as List<dynamic>?)
          ?.map((e) => RoutingItemDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <RoutingItemDto>[],
  coreItem: json['coreItem'] == null
      ? const CoreItemDto()
      : CoreItemDto.fromJson(json['coreItem'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AppConfigToJson(_AppConfig instance) =>
    <String, dynamic>{
      'uiItem': instance.uiItem,
      'stateItem': instance.stateItem,
      'subItems': instance.subItems,
      'routingItems': instance.routingItems,
      'coreItem': instance.coreItem,
    };
