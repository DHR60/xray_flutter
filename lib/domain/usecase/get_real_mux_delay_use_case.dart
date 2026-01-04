import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/service/network/network_manager.dart';

class GetRealMuxDelayUseCase {
  final NetworkManager _networkManager;

  GetRealMuxDelayUseCase(this._networkManager);

  Future<Result<int>> call() async {
    try {
      final result = await _networkManager.getRealMuxDelay();
      if (result < 0) {
        return Failure(UnexpectedError('无法获取真实的多路复用延迟'));
      }
      return Success(result);
    } catch (e) {
      return Failure(UnexpectedError(e));
    }
  }
}
