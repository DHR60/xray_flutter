// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UiItemDto _$UiItemDtoFromJson(Map<String, dynamic> json) => _UiItemDto(
  fontSize: (json['fontSize'] as num?)?.toInt(),
  fontFamily: json['fontFamily'] as String?,
  isDarkMode: (json['isDarkMode'] as num?)?.toInt(),
);

Map<String, dynamic> _$UiItemDtoToJson(_UiItemDto instance) =>
    <String, dynamic>{
      'fontSize': instance.fontSize,
      'fontFamily': instance.fontFamily,
      'isDarkMode': instance.isDarkMode,
    };
