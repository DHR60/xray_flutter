// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StateItemDto _$StateItemDtoFromJson(Map<String, dynamic> json) =>
    _StateItemDto(
      subId: json['subId'] as String? ?? '',
      profileId: json['profileId'] as String? ?? '',
      routingId: json['routingId'] as String? ?? '',
    );

Map<String, dynamic> _$StateItemDtoToJson(_StateItemDto instance) =>
    <String, dynamic>{
      'subId': instance.subId,
      'profileId': instance.profileId,
      'routingId': instance.routingId,
    };
