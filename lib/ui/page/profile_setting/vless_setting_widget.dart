import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/data/dto/profile_extra_item_dto.dart';
import 'package:xray_flutter/di/app_config_provider.dart';
import 'package:xray_flutter/ui/page/profile_setting/profile_setting_result.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_listen_controller.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_listen_view.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_security_controller.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_security_view.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_transport_controller.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_transport_view.dart';

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
  late ProfileListenController _listenController;
  late TextEditingController _idController;
  late TextEditingController _flowController;
  late TextEditingController _vlessEncryptionController;
  late ProfileTransportController _transportController;
  late ProfileSecurityController _securityController;

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
    _listenController = ProfileListenController(
      address: widget.profile.address,
      port: widget.profile.port,
    );
    _idController = TextEditingController(text: widget.profile.id);
    _flowController = TextEditingController(text: _extraDto.flow);
    _vlessEncryptionController = TextEditingController(
      text: _extraDto.vlessEncryption?.isNotEmpty == true
          ? _extraDto.vlessEncryption
          : 'none',
    );
    _transportController = ProfileTransportController(
      transport: widget.profile.network,
      subType: widget.profile.headerType,
      host: widget.profile.requestHost,
      path: widget.profile.path,
      xhttpExtra: widget.profile.xhttpExtra,
    );
    _securityController = ProfileSecurityController(
      security: widget.profile.streamSecurity,
      sni: widget.profile.sni,
      utlsFingerprint: widget.profile.fingerprint,
      alpn: widget.profile.alpn,
      allowInsecure: widget.profile.allowInsecure,
      realityPbk: widget.profile.publicKey,
      realityShortId: widget.profile.shortId,
      realitySpdx: widget.profile.spiderX,
      mldsa65Ver: widget.profile.mldsa65Verify,
    );
  }

  @override
  void dispose() {
    _remarkController.dispose();
    _listenController.dispose();
    _idController.dispose();
    _flowController.dispose();
    _vlessEncryptionController.dispose();
    _transportController.dispose();
    _securityController.dispose();
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
      address: _listenController.addressText,
      port: _listenController.portValue,
      id: _idController.text,
      network: _transportController.transport,
      headerType: _transportController.subType,
      requestHost: _transportController.host,
      path: _transportController.path,
      xhttpExtra: _transportController.xhttpExtra,
      streamSecurity: _securityController.security,
      sni: _securityController.sni,
      fingerprint: _securityController.utlsFingerprint,
      alpn: _securityController.alpn,
      allowInsecure: _securityController.allowInsecure,
      publicKey: _securityController.realityPbk,
      shortId: _securityController.realityShortId,
      spiderX: _securityController.realitySpdx,
      mldsa65Verify: _securityController.mldsa65Ver,
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
              ProfileListenView(controller: _listenController),
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
              const Divider(),
              ProfileTransportView(controller: _transportController),
              const Divider(),
              ProfileSecurityView(controller: _securityController),
            ],
          ),
        ),
      ),
    );
  }
}
