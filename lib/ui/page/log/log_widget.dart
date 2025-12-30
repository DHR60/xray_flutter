import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/core/app_runtime.dart';
import 'package:xray_flutter/di/provider.dart';
import 'package:xray_flutter/domain/logging/log_entry.dart';
import 'package:xray_flutter/ui/page/log/log_list_view.dart';
import 'package:xray_flutter/ui/page/log/log_toolbar.dart';

class LogPage extends ConsumerStatefulWidget {
  const LogPage({super.key});

  @override
  ConsumerState<LogPage> createState() => _LogPageState();
}

class _LogPageState extends ConsumerState<LogPage> {
  bool _paused = false;
  final List<LogEntry> _visibleLogs = [];

  @override
  void initState() {
    super.initState();

    _visibleLogs.addAll(AppRuntime.instance.logCenter.buffer.values);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<LogEntry>>(logStreamProvider, (prev, next) {
      next.whenData((entry) {
        if (_paused) return;
        setState(() {
          _visibleLogs.add(entry);
        });
      });
    });

    return Scaffold(
      appBar: AppBar(title: const Text('日志')),
      body: Column(
        children: [
          LogToolbar(
            paused: _paused,
            onTogglePause: () => setState(() => _paused = !_paused),
          ),
          Expanded(
            child: LogListView(logs: _visibleLogs, autoScroll: !_paused),
          ),
        ],
      ),
    );
  }
}
