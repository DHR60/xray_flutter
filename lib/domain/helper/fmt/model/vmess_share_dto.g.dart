// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vmess_share_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VmessShareDto _$VmessShareDtoFromJson(Map<String, dynamic> json) =>
    _VmessShareDto(
      v: json['v'] as String?,
      ps: json['ps'] as String?,
      add: json['add'] as String?,
      port: json['port'] as String?,
      id: json['id'] as String?,
      aid: json['aid'] as String?,
      scy: json['scy'] as String?,
      net: json['net'] as String?,
      type: json['type'] as String?,
      host: json['host'] as String?,
      path: json['path'] as String?,
      tls: json['tls'] as String?,
      sni: json['sni'] as String?,
      alpn: json['alpn'] as String?,
      fp: json['fp'] as String?,
    );

Map<String, dynamic> _$VmessShareDtoToJson(_VmessShareDto instance) =>
    <String, dynamic>{
      'v': instance.v,
      'ps': instance.ps,
      'add': instance.add,
      'port': instance.port,
      'id': instance.id,
      'aid': instance.aid,
      'scy': instance.scy,
      'net': instance.net,
      'type': instance.type,
      'host': instance.host,
      'path': instance.path,
      'tls': instance.tls,
      'sni': instance.sni,
      'alpn': instance.alpn,
      'fp': instance.fp,
    };
