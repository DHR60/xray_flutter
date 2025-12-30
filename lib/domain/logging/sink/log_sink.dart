import 'package:xray_flutter/domain/logging/log_entry.dart';

abstract class LogSink {
  void handle(LogEntry entry);
}
