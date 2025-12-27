import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xray_flutter/core/app_runtime.dart';
import 'package:xray_flutter/domain/core/core_process.dart';
import 'package:xray_flutter/domain/infra/start_core_service.dart';

part 'core_manager.g.dart';

@Riverpod(keepAlive: true)
Stream<CoreStatus> coreStatus(Ref ref) async* {
  final manager = AppRuntime.instance.coreManager;
  yield manager.status;
  yield* manager.statusStream;
}

enum CoreStatus {
  stopped,
  starting,
  running,
  error,
}

class CoreManager {
  final StartCoreService _startCoreService;
  final _statusController = StreamController<CoreStatus>.broadcast();
  
  CoreStatus _currentStatus = CoreStatus.stopped;
  CoreStatus get status => _currentStatus;
  Stream<CoreStatus> get statusStream => _statusController.stream;

  // Active core processes
  final Map<String, CoreProcess> _activeProcesses = {};
  static const String _mainCoreId = 'main';

  CoreManager(this._startCoreService);

  Stream<String> get mainLogOut => _activeProcesses[_mainCoreId]?.out ?? const Stream.empty();
  Stream<String> get mainLogErr => _activeProcesses[_mainCoreId]?.err ?? const Stream.empty();

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
      _updateStatus(CoreStatus.running);
    } catch (e) {
      _updateStatus(CoreStatus.error);
      rethrow;
    }
  }

  Future<void> stop() async {
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
    _currentStatus = status;
    _statusController.add(status);
  }
}
