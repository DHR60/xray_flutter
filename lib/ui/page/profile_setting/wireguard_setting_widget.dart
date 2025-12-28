import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/data/dto/profile_extra_item_dto.dart';
import 'package:xray_flutter/ui/page/profile_setting/profile_setting_result.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_listen_controller.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_listen_view.dart';

class WireguardSettingWidget extends ConsumerStatefulWidget {
  final ProfileItemData profile;
  final bool isNew;
  final String? subId;

  const WireguardSettingWidget({
    super.key,
    required this.profile,
    required this.isNew,
    this.subId,
  });

  @override
  ConsumerState<WireguardSettingWidget> createState() =>
      _WireguardSettingWidgetState();
}

class _WireguardSettingWidgetState
    extends ConsumerState<WireguardSettingWidget> {
  late ProfileExtraItemDto _extraDto;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _remarkController;
  late ProfileListenController _listenController;
  late TextEditingController _localAddressController;
  late TextEditingController _secretKeyController;
  late TextEditingController _publicKeyController;
  late TextEditingController _preSharedKeyController;
  late TextEditingController _mtuController;
  late TextEditingController _reservedController;

  @override
  void initState() {
    super.initState();
    if (widget.profile.jsonData.isNotEmpty) {
      _extraDto = ProfileExtraItemDto.fromString(widget.profile.jsonData);
    } else {
      _extraDto = const ProfileExtraItemDto();
    }
    _remarkController = TextEditingController(text: widget.profile.remarks);
    _listenController = ProfileListenController.fromData(widget.profile);
    _localAddressController = TextEditingController(
      text: _extraDto.wireguardLocalAddress ?? '',
    );
    _secretKeyController = TextEditingController(text: widget.profile.id);
    _publicKeyController = TextEditingController(
      text: _extraDto.wireguardPublicKey ?? '',
    );
    _preSharedKeyController = TextEditingController(
      text: _extraDto.wireguardPreSharedKey ?? '',
    );
    _mtuController = TextEditingController(
      text: _extraDto.wireguardMtu?.toString() ?? '',
    );
    _reservedController = TextEditingController(
      text: _extraDto.wireguardReserved?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _remarkController.dispose();
    _listenController.dispose();
    _localAddressController.dispose();
    _secretKeyController.dispose();
    _publicKeyController.dispose();
    _preSharedKeyController.dispose();
    _mtuController.dispose();
    _reservedController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (!_formKey.currentState!.validate()) return;

    _extraDto = _extraDto.copyWith(
      wireguardLocalAddress: _localAddressController.text,
      wireguardPublicKey: _publicKeyController.text,
      wireguardPreSharedKey: _preSharedKeyController.text,
      wireguardMtu: int.tryParse(_mtuController.text) ?? 0,
      wireguardReserved: _reservedController.text,
    );

    var profile = widget.profile.copyWith(
      remarks: _remarkController.text,
      address: _listenController.addressText,
      port: _listenController.portValue,
      id: _secretKeyController.text,
      jsonData: _extraDto.toString(),
    );

    if (widget.subId != null) {
      profile = profile.copyWith(subid: widget.subId);
    }

    Navigator.of(context).pop(ProfileSettingUpsert(profile));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wireguard Setting'),
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
              ProfileListenView(controller: _listenController),
              const Divider(),
              TextFormField(
                controller: _localAddressController,
                decoration: const InputDecoration(
                  labelText: '本地地址 (Local Address)',
                ),
                validator: (value) => value?.isEmpty == true ? '请输入本地地址' : null,
              ),
              TextFormField(
                controller: _secretKeyController,
                decoration: const InputDecoration(
                  labelText: '私钥 (Private Key)',
                ),
                validator: (value) => value?.isEmpty == true ? '请输入私钥' : null,
              ),
              TextFormField(
                controller: _publicKeyController,
                decoration: const InputDecoration(labelText: '公钥 (Public Key)'),
                validator: (value) => value?.isEmpty == true ? '请输入公钥' : null,
              ),
              TextFormField(
                controller: _preSharedKeyController,
                decoration: const InputDecoration(
                  labelText: '预共享密钥 (Pre-Shared Key)',
                ),
              ),
              TextFormField(
                controller: _mtuController,
                decoration: const InputDecoration(labelText: 'MTU'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return null;
                  final mtu = int.tryParse(value);
                  if (mtu == null || mtu <= 0) {
                    return '请输入有效的MTU值';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _reservedController,
                decoration: const InputDecoration(labelText: 'Reserved'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
