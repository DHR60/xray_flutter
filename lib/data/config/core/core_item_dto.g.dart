// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoreItemDto _$CoreItemDtoFromJson(Map<String, dynamic> json) => _CoreItemDto(
  inbound: json['inbound'] == null
      ? const InboundItemDto()
      : InboundItemDto.fromJson(json['inbound'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CoreItemDtoToJson(_CoreItemDto instance) =>
    <String, dynamic>{'inbound': instance.inbound};
