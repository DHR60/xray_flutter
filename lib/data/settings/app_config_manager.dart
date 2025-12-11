import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/settings/app_config.dart';

class AppConfigManager {
  AppConfig? _appConfig;

  AppConfig? get appConfig => _appConfig;

  Future<void> updateConfig(AppConfig newConfig) async {
    _appConfig = newConfig;
    await saveConfig();
  }

  Future loadConfig() async {
    var dataPath = await Utils.getDataDirectory();
    var configFile = File(p.join(dataPath.path, 'config.json'));
    if (await configFile.exists()) {
      var jsonString = await configFile.readAsString();
      if (jsonString.isNotEmpty) {
        var jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
        _appConfig = AppConfig.fromJson(jsonMap);
      }
    }
  }

  Future saveConfig() async {
    if (_appConfig == null) return;
    var dataPath = await Utils.getDataDirectory();
    var configFile = File(p.join(dataPath.path, 'config.json'));
    var jsonString = jsonEncode(_appConfig!.toJson());

    if (!await configFile.exists()) {
      await configFile.create(recursive: true);
    }
    await configFile.writeAsString(jsonString);
  }
}