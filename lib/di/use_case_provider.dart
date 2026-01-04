import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xray_flutter/core/app_runtime.dart';
import 'package:xray_flutter/di/provider.dart';
import 'package:xray_flutter/domain/usecase/delete_profile_use_case.dart';
import 'package:xray_flutter/domain/usecase/export_multi_uris_use_case.dart';
import 'package:xray_flutter/domain/usecase/export_profile_config_use_case.dart';
import 'package:xray_flutter/domain/usecase/export_uri_use_case.dart';
import 'package:xray_flutter/domain/usecase/get_profile_config_use_case.dart';
import 'package:xray_flutter/domain/usecase/get_profile_outbound_use_case.dart';
import 'package:xray_flutter/domain/usecase/get_uri_by_data_use_case.dart';
import 'package:xray_flutter/domain/usecase/get_uri_use_case.dart';
import 'package:xray_flutter/domain/usecase/import_uri_use_case.dart';
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
GetProfileConfigUseCase getProfileConfigUseCase(Ref ref) {
  final store = ref.watch(storeServiceProvider);
  return GetProfileConfigUseCase(store);
}

@riverpod
ExportProfileConfigUseCase exportProfileConfigUseCase(Ref ref) {
  final getProfileConfigUseCase = ref.watch(getProfileConfigUseCaseProvider);
  return ExportProfileConfigUseCase(getProfileConfigUseCase);
}

@riverpod
GetProfileOutboundUseCase getProfileOutboundUseCase(Ref ref) {
  return GetProfileOutboundUseCase();
}

@riverpod
GetUriByDataUseCase getUriByDataUseCase(Ref ref) {
  return GetUriByDataUseCase();
}

@riverpod
GetUriUseCase getUriUseCase(Ref ref) {
  final store = ref.watch(storeServiceProvider);
  final getUriByDataUseCase = ref.watch(getUriByDataUseCaseProvider);
  return GetUriUseCase(store, getUriByDataUseCase);
}

@riverpod
ExportUriUseCase exportUriUseCase(Ref ref) {
  final getUriUseCase = ref.watch(getUriUseCaseProvider);
  return ExportUriUseCase(getUriUseCase);
}

@riverpod
ExportMultiUrisUseCase exportMultiUrisUseCase(Ref ref) {
  final getUriUseCase = ref.watch(getUriUseCaseProvider);
  return ExportMultiUrisUseCase(getUriUseCase);
}

@riverpod
ImportUriUseCase importUriUseCase(Ref ref) {
  final store = ref.watch(storeServiceProvider);
  return ImportUriUseCase(store);
}
