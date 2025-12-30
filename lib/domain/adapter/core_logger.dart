import 'package:xray_flutter/domain/logging/log_center.dart';
import 'package:xray_flutter/domain/logging/log_level.dart';
import 'package:xray_flutter/domain/logging/log_source.dart';

class CoreLogger {
  CoreLogger({
    required LogCenter logCenter,
    required Stream<String> stdout,
    required Stream<String> stderr,
  }) {
    stdout.listen((line) {
      logCenter.log(line, level: ELogLevel.info, source: ELogSource.core);
    });

    stderr.listen((line) {
      logCenter.log(line, level: ELogLevel.warning, source: ELogSource.core);
    });
  }
}
