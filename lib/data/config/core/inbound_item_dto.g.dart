// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbound_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InboundItemDto _$InboundItemDtoFromJson(Map<String, dynamic> json) =>
    _InboundItemDto(
      port: json['port'] as String? ?? '10808',
      sniff: json['sniff'] as bool? ?? true,
      overrideTarget: json['overrideTarget'] as bool? ?? false,
      publicListen: json['publicListen'] as bool? ?? false,
    );

Map<String, dynamic> _$InboundItemDtoToJson(_InboundItemDto instance) =>
    <String, dynamic>{
      'port': instance.port,
      'sniff': instance.sniff,
      'overrideTarget': instance.overrideTarget,
      'publicListen': instance.publicListen,
    };
