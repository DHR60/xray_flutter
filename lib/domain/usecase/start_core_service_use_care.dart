import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/service/store/store_service.dart';

class StartCoreServiceUseCare {
  final StoreService _storeService;
  StartCoreServiceUseCare(this._storeService);

  Future<Result<void>> call() async {
    try {
      final routingItem = _storeService.getCurrentRoutingItem();
      if (routingItem == null) {
        return Failure(ValidationError('当前激活路由集不存在'));
      }
      await Future.delayed(const Duration(milliseconds: 500));
      return const Success(null);
    } catch (e) {
      return Failure(UnexpectedError(e));
    }
  }
}
