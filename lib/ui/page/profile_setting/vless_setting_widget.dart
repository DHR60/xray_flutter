import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/core/global_const.dart';
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/data/dto/profile_extra_item_dto.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_listen_controller.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_listen_view.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_setting_scaffold.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_security_controller.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_security_view.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_transport_controller.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_transport_view.dart';

class VlessSettingWidget extends ConsumerStatefulWidget {
  final ProfileItemData profile;
  final bool isNew;
  final String? subId;

  const VlessSettingWidget({
    super.key,
    required this.profile,
    required this.isNew,
    this.subId,
  });

  @override
  ConsumerState<VlessSettingWidget> createState() => _VlessSettingWidgetState();
}

class _VlessSettingWidgetState extends ConsumerState<VlessSettingWidget>
    with ProfileEditorMixin {
  late ProfileExtraItemDto _extraDto;
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
      _extraDto = ProfileExtraItemDto.fromString(widget.profile.jsonData);
    } else {
      _extraDto = const ProfileExtraItemDto();
    }
    _remarkController = TextEditingController(text: widget.profile.remarks);
    _listenController = ProfileListenController.fromData(widget.profile);
    _idController = TextEditingController(text: widget.profile.id);
    _flowController = TextEditingController(text: _extraDto.flow);
    _vlessEncryptionController = TextEditingController(
      text: _extraDto.vlessEncryption?.isNotEmpty == true
          ? _extraDto.vlessEncryption
          : 'none',
    );
    _transportController = ProfileTransportController.fromData(widget.profile);
    _securityController = ProfileSecurityController.fromData(widget.profile);
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

  @override
  ProfileItemData get originalProfile => widget.profile;

  @override
  String? get subId => widget.subId;

  @override
  ProfileItemData buildProfile() {
    final vlessEncryption = _vlessEncryptionController.text;

    _extraDto = _extraDto.copyWith(
      flow: _flowController.text,
      vlessEncryption: vlessEncryption.isNotEmpty ? vlessEncryption : 'none',
    );

    return widget.profile.copyWith(
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
  }

  @override
  Widget buildFormContent(BuildContext context) {
    return Column(
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
          controller: _idController,
          decoration: const InputDecoration(labelText: '用户ID (UUID)'),
          validator: (value) => value?.isEmpty == true ? '请输入用户ID' : null,
        ),
        DropdownButtonFormField<String>(
          initialValue: _flowController.text,
          decoration: const InputDecoration(labelText: '流控 (Flow)'),
          items: GlobalConst.vlessFlowList
              .map(
                (flow) =>
                    DropdownMenuItem<String>(value: flow, child: Text(flow)),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              _flowController.text = value;
            }
          },
        ),
        TextFormField(
          controller: _vlessEncryptionController,
          decoration: const InputDecoration(
            labelText: '加密方式 (VLESS Encryption)',
          ),
        ),
        const Divider(),
        const Text('底层传输方式'),
        ProfileTransportView(controller: _transportController),
        const Divider(),
        const Text('传输层安全设置'),
        ProfileSecurityView(controller: _securityController),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProfileSettingScaffold(
      title: 'VLESS Setting',
      profile: widget.profile,
      isNew: widget.isNew,
      controller: this,
    );
  }
}
