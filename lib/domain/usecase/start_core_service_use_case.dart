import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/model/profile_context.dart';
import 'package:xray_flutter/domain/service/core/core_manager.dart';
import 'package:xray_flutter/domain/service/core_config/xray/xray_config_service.dart';
import 'package:xray_flutter/domain/service/store/store_service.dart';

class StartCoreServiceUseCase {
  final StoreService _storeService;
  final CoreManager _coreManager;
  StartCoreServiceUseCase(this._storeService, this._coreManager);

  Future<Result<void>> call() async {
    try {
      final routingItem = _storeService.getCurrentRoutingItem();
      if (routingItem == null) {
        return Failure(ValidationError('当前激活路由集不存在'));
      }
      final profile = await _storeService.getCurrentProfile();
      if (profile == null) {
        return Failure(ValidationError('当前激活配置文件不存在'));
      }
      final profileContext = ProfileContext(
        profile: profile,
        routingItem: routingItem,
        coreItem: _storeService.currentConfig.coreItem,
      );
      final xrayConfigService = XrayConfigService(profileContext);
      final configStringResult = xrayConfigService.genConfig();
      if (configStringResult is Failure<String>) {
        return Failure.from(configStringResult);
      }
      final configString = (configStringResult as Success<String>).data;

      final socksPort =
          int.tryParse(_storeService.currentConfig.coreItem.inbound.port) ??
          10808;

      await _coreManager.start(configString, socksPort);

      return const Success(null);
    } catch (e) {
      return Failure(UnexpectedError(e));
    }
  }
}
