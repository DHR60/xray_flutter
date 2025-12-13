import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/data/repo/profile_repo_impl.dart';
import 'package:xray_flutter/di/app_config_provider.dart';
import 'package:xray_flutter/domain/repo/profile_repo.dart';
import 'package:xray_flutter/domain/service/store/store_service.dart';
import 'package:xray_flutter/domain/usecase/export_profile_config_use_case.dart';
import 'package:xray_flutter/domain/usecase/save_profile_use_case.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  return AppDatabase();
}

@Riverpod(keepAlive: true)
ProfileRepo profileRepo(Ref ref) {
  final database = ref.watch(appDatabaseProvider);
  return ProfileRepoImpl(database);
}

@riverpod
SaveProfileUseCase saveProfileUseCase(Ref ref) {
  final repo = ref.watch(profileRepoProvider);
  return SaveProfileUseCase(repo);
}

@riverpod
ExportProfileConfigUseCase exportProfileConfigUseCase(Ref ref, String profileIndexId) {
  return ExportProfileConfigUseCase(profileIndexId);
}

@Riverpod(keepAlive: true)
StoreService storeService(Ref ref) {
  final appConfigNotifier = ref.watch(appConfigProvider.notifier);
  final profileRepo = ref.watch(profileRepoProvider);
  return StoreService(appConfigNotifier, profileRepo);
}

@Riverpod(keepAlive: true)
Future<void> configInitializer(Ref ref) async {
  await ref.read(appConfigProvider.notifier).init();
  await ref.read(storeServiceProvider).init();
  await ref.read(profileRepoProvider).fixOrderIndices();
}
