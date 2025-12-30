import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xray_flutter/domain/logging/log_level.dart';
import 'package:xray_flutter/domain/logging/log_source.dart';

part 'log_entry.freezed.dart';
part 'log_entry.g.dart';

@freezed
abstract class LogEntry with _$LogEntry {
  factory LogEntry({
    required DateTime time,
    required String message,
    required ELogLevel level,
    required ELogSource source,
  }) = _LogEntry;

  factory LogEntry.fromJson(Map<String, dynamic> json) =>
      _$LogEntryFromJson(json);
}
