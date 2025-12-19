import 'package:flutter/services.dart';

class VpnPlatform {
  static const _channel = MethodChannel('vpn_control');

  static Future<void> startVpn({required Map<String, Object> config}) async {
    await _channel.invokeMethod('startVpn', config);
  }

  static Future<void> stopVpn() async {
    await _channel.invokeMethod('stopVpn');
  }
}
