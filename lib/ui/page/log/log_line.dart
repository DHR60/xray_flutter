import 'package:flutter/material.dart';
import 'package:xray_flutter/domain/logging/log_entry.dart';
import 'package:xray_flutter/domain/logging/log_level.dart';

class LogLine extends StatelessWidget {
  final LogEntry entry;

  const LogLine(this.entry, {super.key});

  @override
  Widget build(BuildContext context) {
    final color = switch (entry.level) {
      ELogLevel.error => Colors.redAccent,
      ELogLevel.warning => Colors.orangeAccent,
      _ => Colors.grey,
    };

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Text(
        '[${_fmt(entry.time)}] '
        '[${entry.source.name}] '
        '${entry.message}',
        style: TextStyle(fontSize: 12, color: color),
      ),
    );
  }

  String _fmt(DateTime t) =>
      '${t.hour.toString().padLeft(2, '0')}:'
      '${t.minute.toString().padLeft(2, '0')}:'
      '${t.second.toString().padLeft(2, '0')}';
}
