import 'package:xray_flutter/data/config/app_config_manager.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/data/repo/profile_repo_impl.dart';
import 'package:xray_flutter/domain/adapter/core_logger.dart';
import 'package:xray_flutter/domain/infra/start_core_service.dart';
import 'package:xray_flutter/domain/logging/log_center.dart';
import 'package:xray_flutter/domain/repo/profile_repo.dart';
import 'package:xray_flutter/domain/service/core/core_manager.dart';
import 'package:xray_flutter/infra/start_core_service_impl.dart';

class AppRuntime {
  final AppConfigManager appConfigManager;
  final ProfileRepo profileRepo;
  final AppDatabase appDatabase;
  final StartCoreService startCoreService;
  final CoreManager coreManager;
  final LogCenter logCenter;

  static late final AppRuntime _instance;
  static AppRuntime get instance => _instance;

  AppRuntime._({
    required this.appConfigManager,
    required this.profileRepo,
    required this.appDatabase,
    required this.startCoreService,
    required this.coreManager,
    required this.logCenter,
  });

  static Future<void> init() async {
    final appConfigManager = AppConfigManager();
    await appConfigManager.init();

    final appDatabase = AppDatabase();
    final profileRepo = ProfileRepoImpl(appDatabase);

    final startCoreService = StartCoreServiceImpl();
    final coreManager = CoreManager(startCoreService);
    final logCenter = LogCenter();

    CoreLogger(
      logCenter: logCenter,
      stdout: coreManager.mainLogOut,
      stderr: coreManager.mainLogErr,
    );

    _instance = AppRuntime._(
      appConfigManager: appConfigManager,
      profileRepo: profileRepo,
      appDatabase: appDatabase,
      startCoreService: startCoreService,
      coreManager: coreManager,
      logCenter: logCenter,
    );
  }
}
