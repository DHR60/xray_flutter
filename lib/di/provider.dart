import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/data/repo/profile_repo.dart';
import 'package:xray_flutter/data/settings/app_config_manager.dart';

part 'provider.g.dart';

@riverpod
AppDatabase appDatabase(Ref ref) {
  return AppDatabase();
}

@riverpod
ProfileRepo profileRepo(Ref ref) {
  final database = ref.watch(appDatabaseProvider);
  return ProfileRepo(database);
}

@Riverpod(keepAlive: true)
AppConfigManager appConfigManager(Ref ref) {
  return AppConfigManager();
}

@Riverpod(keepAlive: true)
Future<void> configInitializer(Ref ref) async {
  final manager = ref.watch(appConfigManagerProvider);
  await manager.loadConfig();
}