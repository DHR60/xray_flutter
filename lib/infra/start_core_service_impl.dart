import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/domain/infra/start_core_service.dart';
import 'package:xray_flutter/infra/android/vpn_platform.dart';

class StartCoreServiceImpl implements StartCoreService {
  Process? _xrayProcess;

  @override
  Future<void> startCore(Map<String, Object> config) async {
    if (Platform.isAndroid) {
      await VpnPlatform.startVpn(config: config);
      return;
    }
    var xrayProcessPath = p.join((await Utils.getBinDirectory()).path, 'xray');
    if (Platform.isWindows) {
      xrayProcessPath += '.exe';
    }
    if (!await File(xrayProcessPath).exists()) {
      throw Exception('Xray binary not found at $xrayProcessPath');
    }
    final xrayConfigFile = p.join(
      (await Utils.getBinConfigDirectory()).path,
      'config.json',
    );
    await File(
      xrayConfigFile,
    ).writeAsString(config['config'] as String, flush: true);
    _xrayProcess = await Process.start(xrayProcessPath, [
      'run',
      '-c',
      xrayConfigFile,
    ], mode: ProcessStartMode.normal);
    _xrayProcess?.stdout.transform(SystemEncoding().decoder).listen((data) {
      debugPrint('OUT: $data');
    });
    _xrayProcess?.stderr.transform(SystemEncoding().decoder).listen((data) {
      debugPrint('ERR: $data');
    });
  }

  @override
  Future<void> stopCore() async {
    if (Platform.isAndroid) {
      await VpnPlatform.stopVpn();
      return;
    }
    _xrayProcess?.kill();
    _xrayProcess = null;
  }
}
