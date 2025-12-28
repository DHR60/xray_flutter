import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/core/global_const.dart';
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/config/rule_item_dto.dart';

class RuleSettingWidget extends ConsumerStatefulWidget {
  const RuleSettingWidget({
    super.key,
    required this.isNew,
    required this.ruleItem,
  });

  final bool isNew;
  final RuleItemDto ruleItem;

  @override
  ConsumerState<RuleSettingWidget> createState() => _RuleSettingWidgetState();
}

class _RuleSettingWidgetState extends ConsumerState<RuleSettingWidget> {
  late RuleItemDto _ruleItem;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _remarkController;
  late TextEditingController _outboundTagController;
  late TextEditingController _inboundTagController;
  late TextEditingController _ipController;
  late TextEditingController _domainController;
  late TextEditingController _portController;
  late TextEditingController _networkController;
  late TextEditingController _protocolController;
  bool _allowPop = false;
  bool _setStateScheduled = false;

  @override
  void initState() {
    super.initState();
    _ruleItem = widget.ruleItem;
    _remarkController = TextEditingController(text: _ruleItem.remark);
    _outboundTagController = TextEditingController(
      text: GlobalConst.ruleOutTags.contains(_ruleItem.outboundTag)
          ? _ruleItem.outboundTag
          : GlobalConst.ruleOutTags.first,
    );
    _inboundTagController = TextEditingController(text: _ruleItem.inboundTag);
    _ipController = TextEditingController(text: _ruleItem.ip);
    _domainController = TextEditingController(text: _ruleItem.domain);
    _portController = TextEditingController(text: _ruleItem.port);
    _networkController = TextEditingController(text: _ruleItem.network);
    _protocolController = TextEditingController(text: _ruleItem.protocol);
    
    _remarkController.addListener(_onControllerChanged);
    _outboundTagController.addListener(_onControllerChanged);
    _inboundTagController.addListener(_onControllerChanged);
    _ipController.addListener(_onControllerChanged);
    _domainController.addListener(_onControllerChanged);
    _portController.addListener(_onControllerChanged);
    _networkController.addListener(_onControllerChanged);
    _protocolController.addListener(_onControllerChanged);
  }
  
  void _onControllerChanged() {
    _requestRebuild();
  }

  void _requestRebuild() {
    if (!mounted) return;
    if (_setStateScheduled) return;
    _setStateScheduled = true;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _setStateScheduled = false;
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _remarkController.removeListener(_onControllerChanged);
    _outboundTagController.removeListener(_onControllerChanged);
    _inboundTagController.removeListener(_onControllerChanged);
    _ipController.removeListener(_onControllerChanged);
    _domainController.removeListener(_onControllerChanged);
    _portController.removeListener(_onControllerChanged);
    _networkController.removeListener(_onControllerChanged);
    _protocolController.removeListener(_onControllerChanged);
    
    _remarkController.dispose();
    _outboundTagController.dispose();
    _inboundTagController.dispose();
    _ipController.dispose();
    _domainController.dispose();
    _portController.dispose();
    _networkController.dispose();
    _protocolController.dispose();
    super.dispose();
  }

  RuleItemDto _updateRuleItem() {
    return _ruleItem.copyWith(
      remark: _remarkController.text,
      outboundTag: _outboundTagController.text,
      inboundTag: Utils.convert2Comma(_inboundTagController.text),
      ip: Utils.convert2Comma(_ipController.text),
      domain: Utils.convert2Comma(_domainController.text),
      port: Utils.convert2Comma(_portController.text),
      network: Utils.convert2Comma(_networkController.text),
      protocol: Utils.convert2Comma(_protocolController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentRuleItem = _updateRuleItem();
    final hasChanges = widget.ruleItem != currentRuleItem;

    return PopScope(
      canPop: _allowPop || !hasChanges,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final shouldDiscard = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('是否丢弃更改?'),
              content: const Text(
                '您有未保存的更改。您想要丢弃它们吗？',
              ),
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
          title: Text('Rule Setting'),
          actions: [
            if (!widget.isNew)
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  Navigator.pop(context, RuleSettingDelete(_updateRuleItem()));
                },
              ),
            IconButton(
              onPressed: () {
                Navigator.pop(context, RuleSettingUpsert(_updateRuleItem()));
              },
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _remarkController,
                  decoration: InputDecoration(labelText: 'Remark'),
                ),
                DropdownButtonFormField<String>(
                  initialValue: _outboundTagController.text,
                  decoration: InputDecoration(labelText: 'Outbound Tag'),
                  items: GlobalConst.ruleOutTags
                      .map(
                        (tag) => DropdownMenuItem<String>(
                          value: tag,
                          child: Text(tag),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      _outboundTagController.text = value;
                    }
                  },
                ),
                // TextFormField(
                //   controller: _inboundTagController,
                //   decoration: InputDecoration(labelText: 'Inbound Tag'),
                // ),
                TextFormField(
                  controller: _ipController,
                  decoration: InputDecoration(labelText: 'IP'),
                ),
                TextFormField(
                  controller: _domainController,
                  decoration: InputDecoration(labelText: 'Domain'),
                ),
                TextFormField(
                  controller: _portController,
                  decoration: InputDecoration(labelText: 'Port'),
                ),
                TextFormField(
                  controller: _networkController,
                  decoration: InputDecoration(labelText: 'Network'),
                ),
                TextFormField(
                  controller: _protocolController,
                  decoration: InputDecoration(labelText: 'Protocol'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

sealed class RuleSettingResult {}

class RuleSettingUpsert extends RuleSettingResult {
  RuleSettingUpsert(this.ruleItem);
  final RuleItemDto ruleItem;
}

class RuleSettingDelete extends RuleSettingResult {
  RuleSettingDelete(this.ruleItem);
  final RuleItemDto ruleItem;
}

class RuleSettingNone extends RuleSettingResult {
  RuleSettingNone();
}
