import 'dart:io';

import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/model/profile_context.dart';
import 'package:xray_flutter/domain/service/core_config/xray/xray_config_service.dart';
import 'package:xray_flutter/domain/service/store/store_service.dart';
import 'package:xray_flutter/infra/android/vpn_platform.dart';

class StartCoreServiceUseCare {
  final StoreService _storeService;
  StartCoreServiceUseCare(this._storeService);

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
      final configString = xrayConfigService.genConfig();

      final socksPort =
          int.tryParse(_storeService.currentConfig.coreItem.inboundPort) ??
          10808;

      if (Platform.isAndroid) {
        await VpnPlatform.startVpn(
          v2rayConfigJson: configString,
          socksPort: socksPort,
        );
      }

      return const Success(null);
    } catch (e) {
      return Failure(UnexpectedError(e));
    }
  }
}
