import 'package:flutter/foundation.dart';
import 'package:xray_flutter/domain/logging/log_entry.dart';
import 'package:xray_flutter/domain/logging/log_source.dart';
import 'package:xray_flutter/domain/logging/sink/log_sink.dart';

class CoreLogSink implements LogSink {
  LogEntry? _last;

  @override
  void handle(LogEntry entry) {
    if (entry.source != ELogSource.core) return;
    _last = entry;
    debugPrint(
      'core: [${entry.time.toIso8601String()}] [${entry.level}] ${entry.message}',
    );
  }

  LogEntry? get last => _last;
}
