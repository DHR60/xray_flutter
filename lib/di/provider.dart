import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xray_flutter/core/app_runtime.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/di/app_config_provider.dart';
import 'package:xray_flutter/domain/repo/profile_repo.dart';
import 'package:xray_flutter/domain/service/store/store_service.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  return AppRuntime.instance.appDatabase;
}

@Riverpod(keepAlive: true)
ProfileRepo profileRepo(Ref ref) {
  return AppRuntime.instance.profileRepo;
}

@Riverpod(keepAlive: true)
StoreService storeService(Ref ref) {
  final appConfigNotifier = ref.watch(appConfigProvider.notifier);
  final profileRepo = ref.watch(profileRepoProvider);
  return StoreService(appConfigNotifier, profileRepo);
}
