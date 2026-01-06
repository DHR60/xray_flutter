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
      ssPluginEnabled: json['ssPluginEnabled'] as bool?,
      ssPlugin: json['ssPlugin'] as String?,
      ssPluginParam: json['ssPluginParam'] as String?,
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
  'ssPluginEnabled': instance.ssPluginEnabled,
  'ssPlugin': instance.ssPlugin,
  'ssPluginParam': instance.ssPluginParam,
  'wireguardLocalAddress': instance.wireguardLocalAddress,
  'wireguardPreSharedKey': instance.wireguardPreSharedKey,
  'wireguardReserved': instance.wireguardReserved,
  'wireguardPublicKey': instance.wireguardPublicKey,
  'wireguardMtu': instance.wireguardMtu,
};
