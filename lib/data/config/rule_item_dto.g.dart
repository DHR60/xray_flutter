// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RuleItemDto _$RuleItemDtoFromJson(Map<String, dynamic> json) => _RuleItemDto(
  id: json['id'] as String,
  orderIndex: (json['orderIndex'] as num?)?.toInt() ?? 0,
  ruleType: json['ruleType'] as String? ?? 'all',
  outboundTag: json['outboundTag'] as String? ?? '',
  inboundTag: json['inboundTag'] as String? ?? '',
  ip: json['ip'] as String? ?? '',
  domain: json['domain'] as String? ?? '',
  port: json['port'] as String? ?? '',
  network: json['network'] as String? ?? '',
  protocol: json['protocol'] as String? ?? '',
  remark: json['remark'] as String? ?? '',
  enabled: json['enabled'] as bool? ?? true,
);

Map<String, dynamic> _$RuleItemDtoToJson(_RuleItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderIndex': instance.orderIndex,
      'ruleType': instance.ruleType,
      'outboundTag': instance.outboundTag,
      'inboundTag': instance.inboundTag,
      'ip': instance.ip,
      'domain': instance.domain,
      'port': instance.port,
      'network': instance.network,
      'protocol': instance.protocol,
      'remark': instance.remark,
      'enabled': instance.enabled,
    };
