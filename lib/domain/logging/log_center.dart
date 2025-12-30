import 'dart:async';

import 'package:xray_flutter/domain/logging/log_entry.dart';
import 'package:xray_flutter/domain/logging/log_level.dart';
import 'package:xray_flutter/domain/logging/log_ring_buffer.dart';
import 'package:xray_flutter/domain/logging/log_source.dart';
import 'package:xray_flutter/domain/logging/sink/app_log_sink.dart';
import 'package:xray_flutter/domain/logging/sink/core_log_sink.dart';
import 'package:xray_flutter/domain/logging/sink/log_sink.dart';

class LogCenter {
  final LogRingBuffer<LogEntry> buffer;
  final _controller = StreamController<LogEntry>.broadcast();

  late final List<LogSink> _sinks;
  late final AppLogSink _appSink = AppLogSink();
  late final CoreLogSink _coreSink = CoreLogSink();

  LogCenter({int capacity = 2000, List<LogSink> sinks = const []})
    : buffer = LogRingBuffer(capacity) {
    _sinks = sinks.isEmpty ? [_appSink, _coreSink] : sinks;
  }

  void add(LogEntry entry) {
    buffer.add(entry);
    _controller.add(entry);

    for (final sink in _sinks) {
      sink.handle(entry);
    }
  }

  void log(
    String message, {
    ELogLevel level = ELogLevel.info,
    ELogSource source = ELogSource.app,
  }) {
    add(
      LogEntry(
        time: DateTime.now(),
        message: message,
        level: level,
        source: source,
      ),
    );
  }

  Stream<LogEntry> get stream => _controller.stream;
}
