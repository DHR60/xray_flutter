import 'package:flutter/services.dart';

class VpnPlatform {
  static const _channel = MethodChannel('vpn_control');

  static Future<void> startVpn({
    required String v2rayConfigJson,
    required int socksPort,
  }) async {
    await _channel.invokeMethod('startVpn', {
      'config': v2rayConfigJson,
      'socksPort': socksPort,
    });
  }

  static Future<void> stopVpn() async {
    await _channel.invokeMethod('stopVpn');
  }
}
