// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routing_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoutingItemDto _$RoutingItemDtoFromJson(Map<String, dynamic> json) =>
    _RoutingItemDto(
      id: json['id'] as String,
      remark: json['remark'] as String? ?? '',
      orderIndex: (json['orderIndex'] as num?)?.toInt() ?? 0,
      rules:
          (json['rules'] as List<dynamic>?)
              ?.map((e) => RuleItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <RuleItemDto>[],
      enabled: json['enabled'] as bool? ?? true,
      strategy: json['strategy'] as String? ?? '',
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$RoutingItemDtoToJson(_RoutingItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'remark': instance.remark,
      'orderIndex': instance.orderIndex,
      'rules': instance.rules,
      'enabled': instance.enabled,
      'strategy': instance.strategy,
      'url': instance.url,
    };
