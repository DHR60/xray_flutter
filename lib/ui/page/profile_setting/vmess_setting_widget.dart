import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/core/global_const.dart';
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/data/dto/profile_extra_item_dto.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_listen_controller.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_listen_view.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_setting_widget.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_finalmask_controller.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_finalmask_view.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_security_controller.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_security_view.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_transport_controller.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_transport_view.dart';

class VmessSettingWidget extends ConsumerStatefulWidget {
  final ProfileItemData profile;
  final bool isNew;
  final String? subId;

  const VmessSettingWidget({
    super.key,
    required this.profile,
    required this.isNew,
    this.subId,
  });

  @override
  ConsumerState<VmessSettingWidget> createState() => _VmessSettingWidgetState();
}

class _VmessSettingWidgetState extends ConsumerState<VmessSettingWidget>
    with ProfileEditorMixin {
  late ProfileExtraItemDto _extraDto;
  late TextEditingController _remarkController;
  late ProfileListenController _listenController;
  late TextEditingController _idController;
  late TextEditingController _alterIdController;
  late TextEditingController _vmessSecurityController;
  late ProfileTransportController _transportController;
  late ProfileSecurityController _securityController;
  late ProfileFinalmaskController _finalmaskController;

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
    _alterIdController = TextEditingController(
      text: _extraDto.alterId?.toString() ?? '0',
    );
    _vmessSecurityController = TextEditingController(
      text: widget.profile.security.isNotEmpty == true
          ? widget.profile.security
          : 'auto',
    );
    _transportController = ProfileTransportController.fromData(widget.profile);
    _securityController = ProfileSecurityController.fromData(widget.profile);
    _finalmaskController = ProfileFinalmaskController.fromData(widget.profile);
  }

  @override
  void dispose() {
    _remarkController.dispose();
    _listenController.dispose();
    _idController.dispose();
    _alterIdController.dispose();
    _vmessSecurityController.dispose();
    _transportController.dispose();
    _securityController.dispose();
    _finalmaskController.dispose();
    super.dispose();
  }

  @override
  ProfileItemData get originalProfile => widget.profile;

  @override
  String? get subId => widget.subId;

  @override
  ProfileItemData buildProfile() {
    final vmessAlterId = int.tryParse(_alterIdController.text) ?? 0;

    _extraDto = _extraDto.copyWith(alterId: vmessAlterId.toString());

    return widget.profile.copyWith(
      remarks: _remarkController.text,
      address: _listenController.addressText,
      port: _listenController.portValue,
      id: _idController.text,
      security: _vmessSecurityController.text,
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
      finalmask: _finalmaskController.finalmask,
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
        TextFormField(
          controller: _alterIdController,
          decoration: const InputDecoration(labelText: 'Alter ID'),
        ),
        DropdownButtonFormField<String>(
          initialValue: _vmessSecurityController.text.isEmpty
              ? null
              : _vmessSecurityController.text,
          decoration: const InputDecoration(labelText: '加密方式'),
          items: GlobalConst.vmessSecurityList
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              _vmessSecurityController.text = value;
            }
          },
        ),
        const Divider(),
        const Text('底层传输方式'),
        ProfileTransportView(controller: _transportController),
        const Divider(),
        const Text('传输层安全设置'),
        ProfileSecurityView(controller: _securityController),
        const Divider(),
        const Text('最终伪装层'),
        ProfileFinalmaskView(controller: _finalmaskController),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProfileSettingWidget(
      title: 'VMess Setting',
      profile: widget.profile,
      isNew: widget.isNew,
      controller: this,
    );
  }
}
