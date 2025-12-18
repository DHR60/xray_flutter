import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/infra/clipboard_service.dart';
import 'package:xray_flutter/domain/model/profile_context.dart';
import 'package:xray_flutter/domain/service/core_config/xray/xray_config_service.dart';
import 'package:xray_flutter/domain/service/store/store_service.dart';
import 'package:xray_flutter/infra/clipboard_service_impl.dart';

class ExportProfileConfigUseCase {
  final StoreService _storeService;
  ExportProfileConfigUseCase(this._storeService);

  Future<Result<void>> call(String profileIndexId) async {
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
      ClipboardService clipboardService = ClipboardServiceImpl();
      await clipboardService.copyToClipboard(configString);
      return const Success(null);
    } catch (e) {
      return Failure(UnexpectedError(e));
    }
  }
}
