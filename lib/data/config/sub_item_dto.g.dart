// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubItemDto _$SubItemDtoFromJson(Map<String, dynamic> json) => _SubItemDto(
  subId: json['subId'] as String,
  subName: json['subName'] as String? ?? '',
  orderIndex: (json['orderIndex'] as num?)?.toInt() ?? 0,
  subUrl: json['subUrl'] as String?,
  lastUpdated: json['lastUpdated'] == null
      ? null
      : DateTime.parse(json['lastUpdated'] as String),
  userAgent: json['userAgent'] as String?,
  filterRegex: json['filterRegex'] as String?,
);

Map<String, dynamic> _$SubItemDtoToJson(_SubItemDto instance) =>
    <String, dynamic>{
      'subId': instance.subId,
      'subName': instance.subName,
      'orderIndex': instance.orderIndex,
      'subUrl': instance.subUrl,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'userAgent': instance.userAgent,
      'filterRegex': instance.filterRegex,
    };
