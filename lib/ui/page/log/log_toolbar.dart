import 'package:flutter/material.dart';

class LogToolbar extends StatelessWidget {
  final bool paused;
  final VoidCallback onTogglePause;

  const LogToolbar({
    required this.paused,
    required this.onTogglePause,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(paused ? Icons.play_arrow : Icons.pause),
          onPressed: onTogglePause,
          tooltip: paused ? '继续' : '暂停',
        ),
      ],
    );
  }
}
