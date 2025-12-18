// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_extra_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileExtraItemDto _$ProfileExtraItemDtoFromJson(Map<String, dynamic> json) =>
    _ProfileExtraItemDto(
      flow: json['flow'] as String? ?? null,
      alterId: json['alterId'] as String? ?? null,
      vlessEncryption: json['vlessEncryption'] as String? ?? null,
      vlessVisionSeed: json['vlessVisionSeed'] as String? ?? null,
    );

Map<String, dynamic> _$ProfileExtraItemDtoToJson(
  _ProfileExtraItemDto instance,
) => <String, dynamic>{
  'flow': instance.flow,
  'alterId': instance.alterId,
  'vlessEncryption': instance.vlessEncryption,
  'vlessVisionSeed': instance.vlessVisionSeed,
};
