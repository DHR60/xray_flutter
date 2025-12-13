import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/di/app_config_provider.dart';
import 'package:xray_flutter/ui/page/setting/setting_notifier.dart';

class SettingWidget extends ConsumerStatefulWidget {
  const SettingWidget({super.key});

  @override
  ConsumerState<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends ConsumerState<SettingWidget> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _inboundPortController;

  @override
  void initState() {
    super.initState();
    final coreItem = ref.read(appConfigProvider).coreItem;
    _inboundPortController = TextEditingController(text: coreItem.inboundPort.toString());
  }

  @override
  void dispose() {
    _inboundPortController.dispose();
    super.dispose();
  }

  void _handleFormUpdate() {
    if (!_formKey.currentState!.validate()) return;

    final newInboundPort = int.tryParse(_inboundPortController.text) ?? 0;
    final currentCoreItem = ref.read(appConfigProvider).coreItem;

    final updatedCoreItem = currentCoreItem.copyWith(
      inboundPort: newInboundPort.toString(),
    );

    ref.read(settingProvider.notifier).updateCoreItem(updatedCoreItem);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            onChanged: _handleFormUpdate,
            child: Column(
              children: [
                TextFormField(
                  controller: _inboundPortController,
                  decoration: const InputDecoration(labelText: '入站端口'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) return '请输入端口';
                    final port = int.tryParse(value);
                    if (port == null || port <= 0 || port > 65535) {
                      return '端口号无效';
                    }
                    return null;
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
