import 'dart:async';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/domain/core/core_process.dart';
import 'package:xray_flutter/domain/infra/start_core_service.dart';
import 'package:xray_flutter/infra/android/vpn_platform.dart';

class _ProcessCore implements CoreProcess {
  final Process _process;
  final Stream<String> _out;
  final Stream<String> _err;
  final Stream<int> _exitCode;

  _ProcessCore(this._process)
    : _out = _process.stdout
          .transform(SystemEncoding().decoder)
          .asBroadcastStream(),
      _err = _process.stderr
          .transform(SystemEncoding().decoder)
          .asBroadcastStream(),
      _exitCode = _process.exitCode.asStream().asBroadcastStream();

  @override
  Stream<String> get out => _out;

  @override
  Stream<String> get err => _err;

  @override
  Stream<int> get exitCode => _exitCode;

  @override
  Future<void> stop() async {
    _process.kill();
  }
}

class _AndroidCore implements CoreProcess {
  @override
  Stream<String> get out => const Stream.empty();

  @override
  Stream<String> get err => const Stream.empty();

  @override
  Stream<int> get exitCode => const Stream.empty();

  @override
  Future<void> stop() async {
    await VpnPlatform.stopVpn();
  }
}

class StartCoreServiceImpl implements StartCoreService {
  Process? _xrayProcess;

  @override
  Future<CoreProcess> startCore(Map<String, Object> config) async {
    if (Platform.isAndroid) {
      await VpnPlatform.startVpn(config: config);
      return _AndroidCore();
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

    final core = _ProcessCore(_xrayProcess!);

    return core;
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
