// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dns_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DnsItemDto _$DnsItemDtoFromJson(Map<String, dynamic> json) => _DnsItemDto(
  remoteDns: json['remoteDns'] as String? ?? GlobalConst.defaultRemoteDns,
  localDns: json['localDns'] as String? ?? GlobalConst.defaultLocalDns,
  enableFakeDns: json['enableFakeDns'] as bool? ?? false,
  additionalHosts: json['additionalHosts'] as String? ?? '',
  serveStale: json['serveStale'] as bool? ?? false,
  parallelQuery: json['parallelQuery'] as bool? ?? false,
);

Map<String, dynamic> _$DnsItemDtoToJson(_DnsItemDto instance) =>
    <String, dynamic>{
      'remoteDns': instance.remoteDns,
      'localDns': instance.localDns,
      'enableFakeDns': instance.enableFakeDns,
      'additionalHosts': instance.additionalHosts,
      'serveStale': instance.serveStale,
      'parallelQuery': instance.parallelQuery,
    };
