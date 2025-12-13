import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  @override
  void initState() {
    super.initState();
    _ruleItem = widget.ruleItem;
    _remarkController = TextEditingController(text: _ruleItem.remark);
    _outboundTagController = TextEditingController(text: _ruleItem.outboundTag);
    _inboundTagController = TextEditingController(text: _ruleItem.inboundTag);
    _ipController = TextEditingController(text: _ruleItem.ip);
    _domainController = TextEditingController(text: _ruleItem.domain);
    _portController = TextEditingController(text: _ruleItem.port);
    _networkController = TextEditingController(text: _ruleItem.network);
    _protocolController = TextEditingController(text: _ruleItem.protocol);
  }

  @override
  void dispose() {
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
      inboundTag: _inboundTagController.text,
      ip: _ipController.text,
      domain: _domainController.text,
      port: _portController.text,
      network: _networkController.text,
      protocol: _protocolController.text,
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
                  onChanged: (value) {
                    setState(() {
                      _ruleItem = _ruleItem.copyWith(remark: value);
                    });
                  },
                ),
                TextFormField(
                  controller: _outboundTagController,
                  decoration: InputDecoration(labelText: 'Outbound Tag'),
                  onChanged: (value) {
                    setState(() {
                      _ruleItem = _ruleItem.copyWith(outboundTag: value);
                    });
                  },
                ),
                TextFormField(
                  controller: _inboundTagController,
                  decoration: InputDecoration(labelText: 'Inbound Tag'),
                  onChanged: (value) {
                    setState(() {
                      _ruleItem = _ruleItem.copyWith(inboundTag: value);
                    });
                  },
                ),
                TextFormField(
                  controller: _ipController,
                  decoration: InputDecoration(labelText: 'IP'),
                  onChanged: (value) {
                    setState(() {
                      _ruleItem = _ruleItem.copyWith(ip: value);
                    });
                  },
                ),
                TextFormField(
                  controller: _domainController,
                  decoration: InputDecoration(labelText: 'Domain'),
                  onChanged: (value) {
                    setState(() {
                      _ruleItem = _ruleItem.copyWith(domain: value);
                    });
                  },
                ),
                TextFormField(
                  controller: _portController,
                  decoration: InputDecoration(labelText: 'Port'),
                  onChanged: (value) {
                    setState(() {
                      _ruleItem = _ruleItem.copyWith(port: value);
                    });
                  },
                ),
                TextFormField(
                  controller: _networkController,
                  decoration: InputDecoration(labelText: 'Network'),
                  onChanged: (value) {
                    setState(() {
                      _ruleItem = _ruleItem.copyWith(network: value);
                    });
                  },
                ),
                TextFormField(
                  controller: _protocolController,
                  decoration: InputDecoration(labelText: 'Protocol'),
                  onChanged: (value) {
                    setState(() {
                      _ruleItem = _ruleItem.copyWith(protocol: value);
                    });
                  },
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
