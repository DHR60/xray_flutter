// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => _AppConfig(
  uiItem: UiItemDto.fromJson(json['uiItem'] as Map<String, dynamic>),
  stateItem: StateItemDto.fromJson(json['stateItem'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AppConfigToJson(_AppConfig instance) =>
    <String, dynamic>{
      'uiItem': instance.uiItem,
      'stateItem': instance.stateItem,
    };
