import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xray_flutter/core/app_runtime.dart';
import 'package:xray_flutter/di/provider.dart';
import 'package:xray_flutter/domain/usecase/delete_profile_use_case.dart';
import 'package:xray_flutter/domain/usecase/export_profile_config_use_case.dart';
import 'package:xray_flutter/domain/usecase/start_core_service_use_case.dart';
import 'package:xray_flutter/domain/usecase/stop_core_service_use_case.dart';
import 'package:xray_flutter/domain/usecase/upsert_profile_use_case.dart';

part 'use_case_provider.g.dart';

@riverpod
UpsertProfileUseCase upsertProfileUseCase(Ref ref) {
  final store = ref.watch(storeServiceProvider);
  return UpsertProfileUseCase(store);
}

@riverpod
DeleteProfileUseCase deleteProfileUseCase(Ref ref) {
  final store = ref.watch(storeServiceProvider);
  return DeleteProfileUseCase(store);
}

@riverpod
StartCoreServiceUseCase startCoreServiceUseCare(Ref ref) {
  final store = ref.watch(storeServiceProvider);
  final coreManager = AppRuntime.instance.coreManager;
  return StartCoreServiceUseCase(store, coreManager);
}

@riverpod
StopCoreServiceUseCase stopCoreServiceUseCase(Ref ref) {
  final coreManager = AppRuntime.instance.coreManager;
  return StopCoreServiceUseCase(coreManager);
}

@riverpod
ExportProfileConfigUseCase exportProfileConfigUseCase(Ref ref) {
  final store = ref.watch(storeServiceProvider);
  return ExportProfileConfigUseCase(store);
}
