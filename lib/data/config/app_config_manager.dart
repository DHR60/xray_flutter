import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/config/app_config.dart';
import 'package:xray_flutter/data/config/routing_item_dto.dart';
import 'package:xray_flutter/data/config/rule_item_dto.dart';
import 'package:xray_flutter/data/config/state_item_dto.dart';
import 'package:xray_flutter/data/config/sub_item_dto.dart';
import 'package:xray_flutter/data/config/ui_item_dto.dart';

class AppConfigManager {
  AppConfig _config = AppConfigManager.defaultConfig();

  AppConfig get config => _config;

  Future<void> init() async {
    final dataPath = await Utils.getDataDirectory();
    final file = File(p.join(dataPath.path, 'config.json'));

    if (await file.exists()) {
      final jsonString = await file.readAsString();
      if (jsonString.isNotEmpty) {
        final map = jsonDecode(jsonString) as Map<String, dynamic>;
        _config = AppConfig.fromJson(map);
        _config = _config.copyWith(
          subItems: fixOrderIndicesForSubItems(_config.subItems),
          routingItems: fixOrderIndicesForRoutingItems(_config.routingItems),
        );
        return;
      }
    } else {
      final defaultConfig = AppConfigManager.defaultConfig();
      await update(defaultConfig);
      _config = defaultConfig;
    }
  }

  Future<void> update(AppConfig newConfig) async {
    _config = newConfig;

    final dataPath = await Utils.getDataDirectory();
    final file = File(p.join(dataPath.path, 'config.json'));
    final jsonString = jsonEncode(newConfig.toJson());

    if (!await file.exists()) {
      await file.create(recursive: true);
    }
    await file.writeAsString(jsonString);
  }

  static AppConfig defaultConfig() {
    return AppConfig(
      stateItem: StateItemDto(profileId: '', subId: ''),
      subItems: [SubItemDto(subName: 'All', subId: '')],
      uiItem: UiItemDto(),
      routingItems: [
        RoutingItemDto(
          id: Utils.generateUUID(),
          remark: 'Default Remark',
          rules: [],
          enabled: true,
          strategy: '',
          url: '',
        ),
      ],
    );
  }

  SubItemDto generateNewSubItem() {
    final newIndex = _config.subItems.isEmpty
        ? 0
        : _config.subItems
                  .map((e) => e.orderIndex)
                  .reduce((a, b) => a > b ? a : b) +
              1;
    return SubItemDto(
      subName: 'New Sub',
      subId: Utils.generateUUID(),
      orderIndex: newIndex,
    );
  }

  static List<SubItemDto> fixOrderIndicesForSubItems(List<SubItemDto> items) {
    return items
        .asMap()
        .entries
        .map((e) => e.value.copyWith(orderIndex: e.key))
        .toList();
  }

  static List<SubItemDto> reorderSubItems(
    List<SubItemDto> items,
    int oldIndex,
    int newIndex,
  ) {
    final newItems = List<SubItemDto>.from(items);
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = newItems.removeAt(oldIndex);
    newItems.insert(newIndex, item);
    return fixOrderIndicesForSubItems(newItems);
  }

  RoutingItemDto generateNewRoutingItem() {
    final newIndex = _config.routingItems.isEmpty
        ? 0
        : _config.routingItems
                  .map((e) => e.orderIndex)
                  .reduce((a, b) => a > b ? a : b) +
              1;
    return RoutingItemDto(
      id: Utils.generateUUID(),
      remark: 'New Routing',
      orderIndex: newIndex,
    );
  }

  static List<RoutingItemDto> fixOrderIndicesForRoutingItems(
    List<RoutingItemDto> items,
  ) {
    return items.asMap().entries.map((e) {
      var item = e.value.copyWith(orderIndex: e.key);
      item = item.copyWith(rules: fixOrderIndicesForRules(item.rules));
      return item;
    }).toList();
  }

  static List<RoutingItemDto> reorderRoutingItems(
    List<RoutingItemDto> items,
    int oldIndex,
    int newIndex,
  ) {
    final newItems = List<RoutingItemDto>.from(items);
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = newItems.removeAt(oldIndex);
    newItems.insert(newIndex, item);
    return fixOrderIndicesForRoutingItems(newItems);
  }

  RuleItemDto generateNewRuleItem(String routingItemId) {
    try {
      final routingItem = _config.routingItems.firstWhere(
        (element) => element.id == routingItemId,
      );
      final existingRules = routingItem.rules;
      return generateNewRuleItemStatic(existingRules);
    } catch (e) {
      return RuleItemDto(id: Utils.generateUUID(), orderIndex: 0);
    }
  }

  static RuleItemDto generateNewRuleItemStatic(
    List<RuleItemDto> existingRules,
  ) {
    final newIndex = existingRules.isEmpty
        ? 0
        : existingRules
                  .map((e) => e.orderIndex)
                  .reduce((a, b) => a > b ? a : b) +
              1;
    return RuleItemDto(id: Utils.generateUUID(), orderIndex: newIndex);
  }

  static List<RuleItemDto> fixOrderIndicesForRules(List<RuleItemDto> rules) {
    return rules
        .asMap()
        .entries
        .map((e) => e.value.copyWith(orderIndex: e.key))
        .toList();
  }

  static List<RuleItemDto> reorderRules(
    List<RuleItemDto> rules,
    int oldIndex,
    int newIndex,
  ) {
    final newRules = List<RuleItemDto>.from(rules);
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = newRules.removeAt(oldIndex);
    newRules.insert(newIndex, item);
    return fixOrderIndicesForRules(newRules);
  }
}
