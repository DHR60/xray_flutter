import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/di/app_config_provider.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_setting_result.dart';

class VlessSettingWidget extends ConsumerStatefulWidget {
  const VlessSettingWidget({
    super.key,
    required this.profile,
    required this.isNew,
  });

  final ProfileItemData profile;
  final bool isNew;

  @override
  ConsumerState<VlessSettingWidget> createState() => _VlessSettingWidgetState();
}

class _VlessSettingWidgetState extends ConsumerState<VlessSettingWidget> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _remarkController;
  late TextEditingController _addressController;
  late TextEditingController _portController;

  @override
  void initState() {
    super.initState();
    _remarkController = TextEditingController(text: widget.profile.remarks);
    _addressController = TextEditingController(text: widget.profile.address);
    _portController = TextEditingController(
      text: widget.profile.port.toString(),
    );
  }

  @override
  void dispose() {
    _remarkController.dispose();
    _addressController.dispose();
    _portController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (!_formKey.currentState!.validate()) return;

    var profile = widget.profile.copyWith(
      remarks: _remarkController.text,
      address: _addressController.text,
      port: int.tryParse(_portController.text) ?? 0,
    );

    if (widget.isNew) {
      final currentSubId = ref.read(appConfigProvider).stateItem.subId;
      profile = profile.copyWith(subid: currentSubId);
    }

    Navigator.of(context).pop(ProfileSettingUpsert(profile));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VLESS Setting'),
        actions: [
          if (!widget.isNew)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                Navigator.of(context).pop(ProfileSettingDelete(widget.profile));
              },
            ),
          IconButton(icon: const Icon(Icons.save), onPressed: _saveProfile),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text('配置项'),
              TextFormField(
                controller: _remarkController,
                decoration: const InputDecoration(labelText: '配置名称'),
                validator: (value) => value?.isEmpty == true ? '请输入配置名称' : null,
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: '服务器地址'),
                validator: (value) => value?.isEmpty == true ? '请输入地址' : null,
              ),
              TextFormField(
                controller: _portController,
                decoration: const InputDecoration(labelText: '服务器端口'),
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
    );
  }
}
