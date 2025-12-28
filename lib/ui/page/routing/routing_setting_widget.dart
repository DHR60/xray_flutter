import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/config/app_config_manager.dart';
import 'package:xray_flutter/data/config/routing_item_dto.dart';
import 'package:xray_flutter/data/config/rule_item_dto.dart';
import 'package:xray_flutter/ui/page/routing/routing_setting_notifier.dart';
import 'package:xray_flutter/ui/page/routing/rule_setting_widget.dart';

class RoutingSettingWidget extends ConsumerStatefulWidget {
  const RoutingSettingWidget({
    super.key,
    required this.isNew,
    required this.routingItem,
  });

  final bool isNew;
  final RoutingItemDto routingItem;

  @override
  ConsumerState<RoutingSettingWidget> createState() =>
      _RoutingSettingWidgetState();
}

class _RoutingSettingWidgetState extends ConsumerState<RoutingSettingWidget> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _remarkController;
  bool _allowPop = false;

  @override
  void initState() {
    super.initState();
    _remarkController = TextEditingController(text: widget.routingItem.remark);
    _remarkController.addListener(_onRemarkChanged);
  }

  void _onRemarkChanged() {
    final notifier = ref.read(
      routingSettingProvider(widget.routingItem).notifier,
    );
    notifier.updateRemark(_remarkController.text);
  }

  @override
  void dispose() {
    _remarkController.removeListener(_onRemarkChanged);
    _remarkController.dispose();
    super.dispose();
  }

  String getRuleSummaryInfo(RuleItemDto rule) {
    final buffer = StringBuffer();
    final ip = Utils.normalizeRulesToList(rule.ip);
    final domain = Utils.normalizeRulesToList(rule.domain);
    if (ip.isNotEmpty) {
      buffer.write('IP: ${ip.take(2).join(', ')}; \n');
    }
    if (domain.isNotEmpty) {
      buffer.write('Domain: ${domain.take(2).join(', ')}; \n');
    }
    buffer.write('Outbound: ${rule.outboundTag}');
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    final routingSetting = ref.watch(
      routingSettingProvider(widget.routingItem),
    );
    final routingSettingNotifier = ref.read(
      routingSettingProvider(widget.routingItem).notifier,
    );

    final hasChanges = widget.routingItem != routingSetting;

    return PopScope(
      canPop: _allowPop || !hasChanges,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final shouldDiscard = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('是否丢弃更改?'),
              content: const Text('您有未保存的更改。您想要丢弃它们吗？'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('取消'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('丢弃'),
                ),
              ],
            );
          },
        );

        if (shouldDiscard == true) {
          if (context.mounted) {
            setState(() {
              _allowPop = true;
            });
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                Navigator.pop(context, RuleSettingNone());
              }
            });
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Routing Setting'),
          actions: [
            if (!widget.isNew)
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  Navigator.pop(
                    context,
                    RoutingSettingDelete(widget.routingItem),
                  );
                },
              ),
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;
                Navigator.pop(context, RoutingSettingUpsert(routingSetting));
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _remarkController,
                decoration: const InputDecoration(labelText: '别名'),
                validator: (value) => value?.isEmpty == true ? '请输入配置名称' : null,
              ),
            ),
            Row(
              children: [
                const Text('域名解析策略：'),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: routingSetting.strategy,
                  focusColor: Colors.transparent,
                  items: <String>['', 'AsIs', 'IPIfNonMatch', 'IPOnDemand']
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                      .toList(),
                  onChanged: (String? newValue) {
                    routingSettingNotifier.updateStrategy(newValue ?? '');
                  },
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  '规则列表：',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () async {
                    final intent = await Navigator.push<RuleSettingResult>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RuleSettingWidget(
                          isNew: true,
                          ruleItem: AppConfigManager.generateNewRuleItemStatic(
                            routingSetting.rules,
                          ),
                        ),
                      ),
                    );
                    routingSettingNotifier.handleRuleSettingResult(intent);
                  },
                ),
              ],
            ),
            Divider(),
            Expanded(
              child: ReorderableListView.builder(
                buildDefaultDragHandles: false,
                itemCount: routingSetting.rules.length,
                itemBuilder: (context, index) {
                  final rule = routingSetting.rules[index];
                  return ReorderableDelayedDragStartListener(
                    key: ValueKey(rule.id),
                    index: index,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          ReorderableDragStartListener(
                            index: index,
                            child: const Padding(
                              padding: EdgeInsets.only(right: 16.0),
                              child: Icon(
                                Icons.drag_handle,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  rule.remark,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  getRuleSummaryInfo(rule),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () async {
                                      final intent =
                                          await Navigator.push<
                                            RuleSettingResult
                                          >(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RuleSettingWidget(
                                                    isNew: false,
                                                    ruleItem: rule,
                                                  ),
                                            ),
                                          );
                                      routingSettingNotifier
                                          .handleRuleSettingResult(intent);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      routingSettingNotifier.removeRuleById(
                                        rule.id,
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Switch(
                                value: rule.enabled,
                                onChanged: (value) {
                                  routingSettingNotifier.updateRuleEnabled(
                                    rule.id,
                                    value,
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                onReorder: (oldIndex, newIndex) {
                  routingSettingNotifier.reorderRule(oldIndex, newIndex);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

sealed class RoutingSettingResult {}

class RoutingSettingUpsert extends RoutingSettingResult {
  RoutingSettingUpsert(this.routingItem);
  final RoutingItemDto routingItem;
}

class RoutingSettingDelete extends RoutingSettingResult {
  RoutingSettingDelete(this.routingItem);
  final RoutingItemDto routingItem;
}

class RuleSettingNone extends RoutingSettingResult {}
