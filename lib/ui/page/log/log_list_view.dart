import 'package:flutter/material.dart';
import 'package:xray_flutter/domain/logging/log_entry.dart';
import 'package:xray_flutter/ui/page/log/log_line.dart';

class LogListView extends StatefulWidget {
  final List<LogEntry> logs;
  final bool autoScroll;

  const LogListView({required this.logs, required this.autoScroll, super.key});

  @override
  State<LogListView> createState() => _LogListViewState();
}

class _LogListViewState extends State<LogListView> {
  final _controller = ScrollController();

  @override
  void didUpdateWidget(LogListView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.autoScroll && widget.logs.length != oldWidget.logs.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_controller.hasClients) {
          _controller.jumpTo(_controller.position.maxScrollExtent);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      itemCount: widget.logs.length,
      itemBuilder: (_, i) => LogLine(widget.logs[i]),
    );
  }
}
