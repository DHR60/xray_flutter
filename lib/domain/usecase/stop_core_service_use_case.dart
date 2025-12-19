import 'package:xray_flutter/domain/service/core_manager.dart';

class StopCoreServiceUseCase {
  final CoreManager _coreManager;
  StopCoreServiceUseCase(this._coreManager);

  Future<void> call() async {
    await _coreManager.stop();
  }
}