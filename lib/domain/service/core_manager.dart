import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xray_flutter/core/app_runtime.dart';
import 'package:xray_flutter/domain/core/core_process.dart';
import 'package:xray_flutter/domain/infra/start_core_service.dart';

part 'core_manager.g.dart';

@Riverpod(keepAlive: true)
Stream<CoreStatus> coreStatus(Ref ref) {
  final manager = AppRuntime.instance.coreManager;
  return manager.statusStream;
}

enum CoreStatus { stopped, starting, running, error }

class CoreManager {
  final StartCoreService _startCoreService;
  final StreamController<CoreStatus> _statusController =
      StreamController<CoreStatus>.broadcast();
  StreamSubscription<int>? _mainExitSubscription;

  CoreStatus _currentStatus = CoreStatus.stopped;
  CoreStatus get status => _currentStatus;

  /// Public stream:
  /// Emits the current status immediately to each new subscriber, then
  /// forwards subsequent status change events.
  Stream<CoreStatus> get statusStream => Stream<CoreStatus>.multi((multi) {
    // Push current snapshot first to avoid missing fast transitions.
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

  Stream<String> get mainLogOut =>
      _activeProcesses[_mainCoreId]?.out ?? const Stream.empty();
  Stream<String> get mainLogErr =>
      _activeProcesses[_mainCoreId]?.err ?? const Stream.empty();

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

      // Link process exit -> status updates.
      await _mainExitSubscription?.cancel();
      _mainExitSubscription = process.exitCode.listen((code) {
        // Ignore if this is no longer the active main process.
        if (!identical(_activeProcesses[_mainCoreId], process)) {
          return;
        }

        // If it exits while we still consider it active, update status.
        if (code == 0) {
          _activeProcesses.remove(_mainCoreId);
          _updateStatus(CoreStatus.stopped);
        } else {
          _activeProcesses.remove(_mainCoreId);
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

    await _startCoreService.stopCore();

    // Also stop the tracked process if it exists
    final mainProcess = _activeProcesses.remove(_mainCoreId);
    // Note: _startCoreService.stopCore() might have already killed it,
    // but we ensure cleanup here.
    if (mainProcess != null) {
      // We don't await here strictly if the process is already dead,
      // but it's safe to call stop() on our wrapper.
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
}
