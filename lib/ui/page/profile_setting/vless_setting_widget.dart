import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/data/dto/profile_extra_item_dto.dart';
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
  late ProfileExtraItemDto _extraDto;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _remarkController;
  late TextEditingController _addressController;
  late TextEditingController _portController;
  late TextEditingController _idController;
  late TextEditingController _flowController;
  late TextEditingController _vlessEncryptionController;
  late TextEditingController _networkController;
  late TextEditingController _streamSecurityController;
  late TextEditingController _sniController;
  late TextEditingController _allowInsecureController;

  @override
  void initState() {
    super.initState();
    if (widget.profile.jsonData.isNotEmpty) {
      _extraDto = ProfileExtraItemDto.fromJson(
        Utils.fromJsonString(widget.profile.jsonData),
      );
    } else {
      _extraDto = const ProfileExtraItemDto();
    }
    _remarkController = TextEditingController(text: widget.profile.remarks);
    _addressController = TextEditingController(text: widget.profile.address);
    _portController = TextEditingController(
      text: widget.profile.port.toString(),
    );
    _idController = TextEditingController(text: widget.profile.id);
    _flowController = TextEditingController(text: _extraDto.flow);
    _vlessEncryptionController = TextEditingController(
      text: _extraDto.vlessEncryption?.isNotEmpty == true ? _extraDto.vlessEncryption : 'none',
    );
    _networkController = TextEditingController(text: widget.profile.network);
    _streamSecurityController = TextEditingController(
      text: widget.profile.streamSecurity,
    );
    _sniController = TextEditingController(text: widget.profile.sni);
    _allowInsecureController = TextEditingController(
      text: widget.profile.allowInsecure,
    );
  }

  @override
  void dispose() {
    _remarkController.dispose();
    _addressController.dispose();
    _portController.dispose();
    _idController.dispose();
    _flowController.dispose();
    _vlessEncryptionController.dispose();
    _networkController.dispose();
    _streamSecurityController.dispose();
    _sniController.dispose();
    _allowInsecureController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (!_formKey.currentState!.validate()) return;

    final vlessEncryption = _vlessEncryptionController.text;

    _extraDto = _extraDto.copyWith(
      flow: _flowController.text,
      vlessEncryption: vlessEncryption.isNotEmpty ? vlessEncryption : 'none',
    );

    var profile = widget.profile.copyWith(
      remarks: _remarkController.text,
      address: _addressController.text,
      port: int.tryParse(_portController.text) ?? 0,
      id: _idController.text,
      network: _networkController.text,
      streamSecurity: _streamSecurityController.text,
      sni: _sniController.text,
      allowInsecure: _allowInsecureController.text,
      jsonData: Utils.toJsonString(_extraDto.toJson()),
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
              const Divider(),
              // Additional VLESS-specific settings can be added here
              TextFormField(
                controller: _idController,
                decoration: const InputDecoration(labelText: '用户ID (UUID)'),
                validator: (value) => value?.isEmpty == true ? '请输入用户ID' : null,
              ),
              TextFormField(
                controller: _flowController,
                decoration: const InputDecoration(labelText: '流控 (Flow)'),
              ),
              TextFormField(
                controller: _vlessEncryptionController,
                decoration: const InputDecoration(
                  labelText: '加密方式 (VLESS Encryption)',
                ),
              ),
              TextFormField(
                controller: _networkController,
                decoration: const InputDecoration(labelText: '网络类型 (Network)'),
              ),
              TextFormField(
                controller: _streamSecurityController,
                decoration: const InputDecoration(
                  labelText: '传输安全 (Stream Security)',
                ),
              ),
              TextFormField(
                controller: _sniController,
                decoration: const InputDecoration(labelText: 'SNI'),
              ),
              TextFormField(
                controller: _allowInsecureController,
                decoration: const InputDecoration(
                  labelText: '允许不安全 (Allow Insecure)',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
