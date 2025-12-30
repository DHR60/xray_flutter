import 'package:flutter/foundation.dart';
import 'package:xray_flutter/domain/logging/log_entry.dart';
import 'package:xray_flutter/domain/logging/log_source.dart';
import 'package:xray_flutter/domain/logging/sink/log_sink.dart';

class AppLogSink extends LogSink {
  @override
  void handle(LogEntry entry) {
    if (entry.source != ELogSource.app) return;
    debugPrint(
      'app: [${entry.time.toIso8601String()}] [${entry.level}] ${entry.message}',
    );
  }
}
