import 'package:xray_flutter/domain/core/core_process.dart';

abstract class StartCoreService {
  Future<CoreProcess> startCore(Map<String, Object> config);
  Future<void> stopCore();
}
