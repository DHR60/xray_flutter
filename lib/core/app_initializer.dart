import 'package:xray_flutter/core/app_runtime.dart';

class AppInitializer {
  static Future<void> ensureDefaults() async {
    final runtime = AppRuntime.instance;
    final config = runtime.appConfigManager.config;
    var newConfig = config;
    bool changed = false;

    if (config.stateItem.profileId.isEmpty) {
      final profiles = await runtime.profileRepo.getAllProfiles();
      if (profiles.isNotEmpty) {
        newConfig = newConfig.copyWith(
          stateItem: newConfig.stateItem.copyWith(
            profileId: profiles.first.indexId,
          ),
        );
        changed = true;
      }
    }

    if (newConfig.stateItem.routingId.isEmpty) {
      final routingItems = newConfig.routingItems;
      if (routingItems.isNotEmpty) {
        newConfig = newConfig.copyWith(
          stateItem: newConfig.stateItem.copyWith(
            routingId: routingItems.first.id,
          ),
        );
        changed = true;
      }
    }

    if (changed) {
      await runtime.appConfigManager.update(newConfig);
    }

    await runtime.profileRepo.fixOrderIndices();
  }
}
