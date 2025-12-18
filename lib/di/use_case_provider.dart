import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xray_flutter/di/provider.dart';
import 'package:xray_flutter/domain/usecase/delete_profile_use_case.dart';
import 'package:xray_flutter/domain/usecase/export_profile_config_use_case.dart';
import 'package:xray_flutter/domain/usecase/start_core_service_use_care.dart';
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
StartCoreServiceUseCare startCoreServiceUseCare(Ref ref) {
  final store = ref.watch(storeServiceProvider);
  return StartCoreServiceUseCare(store);
}

@riverpod
ExportProfileConfigUseCase exportProfileConfigUseCase(Ref ref) {
  final store = ref.watch(storeServiceProvider);
  return ExportProfileConfigUseCase(store);
}
