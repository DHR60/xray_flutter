import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xray_flutter/domain/infra/start_core_service.dart';
import 'package:xray_flutter/infra/start_core_service_impl.dart';

part 'core_manager.g.dart';

@Riverpod(keepAlive: true)
StartCoreService startCoreService(Ref ref) {
  return StartCoreServiceImpl();
}

@Riverpod(keepAlive: true)
CoreManager coreManager(Ref ref) {
  final startCoreService = ref.watch(startCoreServiceProvider);
  return CoreManager(startCoreService);
}

@Riverpod(keepAlive: true)
Stream<CoreStatus> coreStatus(Ref ref) async* {
  final manager = ref.watch(coreManagerProvider);
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

  CoreManager(this._startCoreService);

  Future<void> start(String config, int port) async {
    if (_currentStatus == CoreStatus.running) {
      await stop();
    }
    
    _updateStatus(CoreStatus.starting);
    try {
      await _startCoreService.startCore({
        'config': config,
        'socksPort': port,
      });
      _updateStatus(CoreStatus.running);
    } catch (e) {
      _updateStatus(CoreStatus.error);
      rethrow;
    }
  }

  Future<void> stop() async {
    try {
      await _startCoreService.stopCore();
    } finally {
      _updateStatus(CoreStatus.stopped);
    }
  }

  Future<void> restart(String config, int port) async {
    await stop();
    await start(config, port);
  }

  void _updateStatus(CoreStatus status) {
    _currentStatus = status;
    _statusController.add(status);
  }
}
