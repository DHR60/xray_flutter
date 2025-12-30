import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/model/profile_context.dart';
import 'package:xray_flutter/domain/service/core_config/xray/xray_config_service.dart';
import 'package:xray_flutter/domain/service/store/store_service.dart';

class GetProfileConfigUseCase {
  final StoreService _storeService;
  GetProfileConfigUseCase(this._storeService);

  Future<Result<String>> call(String profileIndexId) async {
    try {
      final routingItem = _storeService.getCurrentRoutingItem();
      if (routingItem == null) {
        return Failure(ValidationError('当前激活路由集不存在'));
      }
      final profile = await _storeService.profileRepo.getProfileById(
        profileIndexId,
      );
      if (profile == null) {
        return Failure(ValidationError('指定的配置文件不存在'));
      }
      final profileContext = ProfileContext(
        profile: profile,
        routingItem: routingItem,
        coreItem: _storeService.currentConfig.coreItem,
      );
      final xrayConfigService = XrayConfigService(profileContext);
      final configString = xrayConfigService.genConfig();
      return Success(configString);
    } catch (e) {
      return Failure(UnexpectedError(e));
    }
  }
}
