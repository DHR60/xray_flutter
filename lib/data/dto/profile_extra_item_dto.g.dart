// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_extra_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileExtraItemDto _$ProfileExtraItemDtoFromJson(Map<String, dynamic> json) =>
    _ProfileExtraItemDto(
      flow: json['flow'] as String?,
      alterId: json['alterId'] as String?,
      vlessEncryption: json['vlessEncryption'] as String?,
      vlessVisionSeed: json['vlessVisionSeed'] as String?,
      shadowsocksV2rayMode: json['shadowsocksV2rayMode'] as bool?,
      obfs: json['obfs'] as String?,
      obfsParam: json['obfsParam'] as String?,
      wireguardLocalAddress: json['wireguardLocalAddress'] as String?,
      wireguardPreSharedKey: json['wireguardPreSharedKey'] as String?,
      wireguardReserved: json['wireguardReserved'] as String?,
      wireguardPublicKey: json['wireguardPublicKey'] as String?,
      wireguardMtu: (json['wireguardMtu'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProfileExtraItemDtoToJson(
  _ProfileExtraItemDto instance,
) => <String, dynamic>{
  'flow': instance.flow,
  'alterId': instance.alterId,
  'vlessEncryption': instance.vlessEncryption,
  'vlessVisionSeed': instance.vlessVisionSeed,
  'shadowsocksV2rayMode': instance.shadowsocksV2rayMode,
  'obfs': instance.obfs,
  'obfsParam': instance.obfsParam,
  'wireguardLocalAddress': instance.wireguardLocalAddress,
  'wireguardPreSharedKey': instance.wireguardPreSharedKey,
  'wireguardReserved': instance.wireguardReserved,
  'wireguardPublicKey': instance.wireguardPublicKey,
  'wireguardMtu': instance.wireguardMtu,
};
