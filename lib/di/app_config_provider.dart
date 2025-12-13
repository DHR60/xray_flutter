import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xray_flutter/data/config/app_config.dart';
import 'package:xray_flutter/data/config/app_config_manager.dart';

part 'app_config_provider.g.dart';

@Riverpod(keepAlive: true)
class AppConfigNotifier extends _$AppConfigNotifier {
  final AppConfigManager _manager = AppConfigManager();

  // ignore: avoid_public_notifier_properties
  AppConfigManager get manager => _manager;

  @override
  AppConfig build() {
    return _manager.config;
  }

  Future<void> init() async {
    await _manager.init();
    state = _manager.config;
  }

  Future<void> update(AppConfig newConfig) async {
    await _manager.update(newConfig);
    state = newConfig;
  }

  Future<void> reorderSubItems(int oldIndex, int newIndex) async {
    final newSubItems = AppConfigManager.reorderSubItems(
      state.subItems,
      oldIndex,
      newIndex,
    );
    final newConfig = state.copyWith(subItems: newSubItems);
    await update(newConfig);
  }

  Future<void> reorderRoutingItems(int oldIndex, int newIndex) async {
    final newRoutingItems = AppConfigManager.reorderRoutingItems(
      state.routingItems,
      oldIndex,
      newIndex,
    );
    final newConfig = state.copyWith(routingItems: newRoutingItems);
    await update(newConfig);
  }

  Future<void> reorderRuleItems(
    String routingId,
    int oldIndex,
    int newIndex,
  ) async {
    final routingItem = state.routingItems.firstWhere(
      (routing) => routing.id == routingId,
    );
    final newRules = AppConfigManager.reorderRules(
      routingItem.rules,
      oldIndex,
      newIndex,
    );
    final newRoutingItem = routingItem.copyWith(rules: newRules);
    final newRoutingItems = state.routingItems.map((routing) {
      if (routing.id == routingId) {
        return newRoutingItem;
      }
      return routing;
    }).toList();
    final newConfig = state.copyWith(routingItems: newRoutingItems);
    await update(newConfig);
  }
}
