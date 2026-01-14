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
      hy2HopPorts: json['hy2HopPorts'] as String?,
      hy2HopInterval: json['hy2HopInterval'] as String?,
      hy2Up: json['hy2Up'] as String?,
      hy2Down: json['hy2Down'] as String?,
      hy2ObfsPass: json['hy2ObfsPass'] as String?,
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
  'hy2HopPorts': instance.hy2HopPorts,
  'hy2HopInterval': instance.hy2HopInterval,
  'hy2Up': instance.hy2Up,
  'hy2Down': instance.hy2Down,
  'hy2ObfsPass': instance.hy2ObfsPass,
};
