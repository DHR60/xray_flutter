import 'dart:async';

import 'package:xray_flutter/domain/core/core_process.dart';
import 'package:xray_flutter/domain/infra/start_core_service.dart';

enum CoreStatus { stopped, starting, running, error }

class CoreManager {
  final StartCoreService _startCoreService;

  final StreamController<CoreStatus> _statusController =
      StreamController<CoreStatus>.broadcast();
  StreamSubscription<int>? _mainExitSubscription;

  // Stable log buses (do NOT change across restarts)
  final StreamController<String> _stdoutController =
      StreamController<String>.broadcast();
  final StreamController<String> _stderrController =
      StreamController<String>.broadcast();

  StreamSubscription<String>? _stdoutSub;
  StreamSubscription<String>? _stderrSub;

  CoreStatus _currentStatus = CoreStatus.stopped;
  CoreStatus get status => _currentStatus;

  /// Public stream:
  /// Emits the current status immediately to each new subscriber, then
  /// forwards subsequent status change events.
  Stream<CoreStatus> get statusStream => Stream<CoreStatus>.multi((multi) {
    multi.add(_currentStatus);

    final sub = _statusController.stream.listen(
      multi.add,
      onError: multi.addError,
      onDone: multi.close,
    );
    multi.onCancel = sub.cancel;
  });

  // Active core processes
  final Map<String, CoreProcess> _activeProcesses = {};
  static const String _mainCoreId = 'main';

  CoreManager(this._startCoreService);

  // Expose stable streams instead of snapshot streams
  Stream<String> get mainLogOut => _stdoutController.stream;
  Stream<String> get mainLogErr => _stderrController.stream;

  Future<void> start(String config, int port) async {
    if (_currentStatus == CoreStatus.running) {
      await stop();
    }

    _updateStatus(CoreStatus.starting);
    try {
      final process = await _startCoreService.startCore({
        'config': config,
        'socksPort': port,
      });
      _activeProcesses[_mainCoreId] = process;

      // (Re)bind stdout/stderr piping for the new process
      await _stdoutSub?.cancel();
      await _stderrSub?.cancel();
      _stdoutSub = process.out.listen(
        _stdoutController.add,
        onError: _stdoutController.addError,
      );
      _stderrSub = process.err.listen(
        _stderrController.add,
        onError: _stderrController.addError,
      );

      // Link process exit -> status updates.
      await _mainExitSubscription?.cancel();
      _mainExitSubscription = process.exitCode.listen((code) {
        if (!identical(_activeProcesses[_mainCoreId], process)) {
          return;
        }

        _activeProcesses.remove(_mainCoreId);

        // stop piping when process exits
        _stdoutSub?.cancel();
        _stderrSub?.cancel();
        _stdoutSub = null;
        _stderrSub = null;

        if (code == 0) {
          _updateStatus(CoreStatus.stopped);
        } else {
          _updateStatus(CoreStatus.error);
        }
      });

      _updateStatus(CoreStatus.running);
    } catch (e) {
      _updateStatus(CoreStatus.error);
      rethrow;
    }
  }

  Future<void> stop() async {
    // Prevent exit callback from racing with manual stop.
    await _mainExitSubscription?.cancel();
    _mainExitSubscription = null;

    // stop piping first to avoid writing to logs after stop()
    await _stdoutSub?.cancel();
    await _stderrSub?.cancel();
    _stdoutSub = null;
    _stderrSub = null;

    await _startCoreService.stopCore();

    final mainProcess = _activeProcesses.remove(_mainCoreId);
    if (mainProcess != null) {
      try {
        await mainProcess.stop();
      } catch (_) {}
    }

    _updateStatus(CoreStatus.stopped);
  }

  void _updateStatus(CoreStatus status) {
    if (_currentStatus == status) return;

    _currentStatus = status;
    if (_statusController.isClosed) return;
    _statusController.add(status);
  }

  Future<void> dispose() async {
    await stop();
    await _statusController.close();
    await _stdoutController.close();
    await _stderrController.close();
  }
}
