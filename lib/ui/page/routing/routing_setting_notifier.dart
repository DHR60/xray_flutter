import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/data/config/app_config_manager.dart';
import 'package:xray_flutter/data/config/routing_item_dto.dart';
import 'package:xray_flutter/data/config/rule_item_dto.dart';
import 'package:xray_flutter/ui/page/routing/rule_setting_widget.dart';

class RoutingSettingNotifier extends Notifier<RoutingItemDto> {
  final RoutingItemDto _routingItemDto;
  RoutingSettingNotifier(this._routingItemDto);

  @override
  RoutingItemDto build() {
    return _routingItemDto;
  }

  void updateRemark(String remark) {
    state = state.copyWith(remark: remark);
  }

  void updateStrategy(String strategy) {
    state = state.copyWith(strategy: strategy);
  }

  void upsertRule(RuleItemDto rule) {
    final rules = List<RuleItemDto>.from(state.rules);
    final index = rules.indexWhere((r) => r.id == rule.id);
    if (index >= 0) {
      rules[index] = rule;
      state = state.copyWith(rules: rules);
    } else {
      rules.add(rule);
      // specially, set new rule to the first
      var newRules = AppConfigManager.reorderRules(rules, rule.orderIndex, 0);
      state = state.copyWith(rules: newRules);
    }
  }

  void updateRuleEnabled(String ruleId, bool enabled) {
    final rules = state.rules.map((r) {
      if (r.id == ruleId) {
        return r.copyWith(enabled: enabled);
      }
      return r;
    }).toList();
    state = state.copyWith(rules: rules);
  }

  void handleRuleSettingResult(RuleSettingResult? intent) {
    if (intent is RuleSettingUpsert) {
      upsertRule(intent.ruleItem);
    } else if (intent is RuleSettingDelete) {
      final rules = List<RuleItemDto>.from(state.rules)
        ..removeWhere((r) => r.id == intent.ruleItem.id);
      state = state.copyWith(rules: rules);
    }
  }

  void removeRuleAt(int index) {
    final rules = List<RuleItemDto>.from(state.rules)..removeAt(index);
    state = state.copyWith(rules: rules);
  }

  void removeAllRules() {
    state = state.copyWith(rules: []);
  }

  void removeRuleById(String ruleId) {
    final rules = List<RuleItemDto>.from(state.rules)
      ..removeWhere((r) => r.id == ruleId);
    state = state.copyWith(rules: rules);
  }

  void reorderRule(int oldIndex, int newIndex) {
    final newRules = AppConfigManager.reorderRules(
      state.rules,
      oldIndex,
      newIndex,
    );
    state = state.copyWith(rules: newRules);
  }
}

final routingSettingProvider = NotifierProvider.family
    .autoDispose<RoutingSettingNotifier, RoutingItemDto, RoutingItemDto>(
      RoutingSettingNotifier.new,
    );
