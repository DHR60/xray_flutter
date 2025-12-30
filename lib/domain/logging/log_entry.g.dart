// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LogEntry _$LogEntryFromJson(Map<String, dynamic> json) => _LogEntry(
  time: DateTime.parse(json['time'] as String),
  message: json['message'] as String,
  level: $enumDecode(_$ELogLevelEnumMap, json['level']),
  source: $enumDecode(_$ELogSourceEnumMap, json['source']),
);

Map<String, dynamic> _$LogEntryToJson(_LogEntry instance) => <String, dynamic>{
  'time': instance.time.toIso8601String(),
  'message': instance.message,
  'level': _$ELogLevelEnumMap[instance.level]!,
  'source': _$ELogSourceEnumMap[instance.source]!,
};

const _$ELogLevelEnumMap = {
  ELogLevel.debug: 'debug',
  ELogLevel.info: 'info',
  ELogLevel.warning: 'warning',
  ELogLevel.error: 'error',
};

const _$ELogSourceEnumMap = {
  ELogSource.app: 'app',
  ELogSource.core: 'core',
  ELogSource.network: 'network',
  ELogSource.database: 'database',
};
