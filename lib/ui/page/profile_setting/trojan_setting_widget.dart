import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/data/dto/profile_extra_item_dto.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_listen_controller.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_listen_view.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_setting_widget.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_security_controller.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_security_view.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_transport_controller.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_transport_view.dart';

class TrojanSettingWidget extends ConsumerStatefulWidget {
  final ProfileItemData profile;
  final bool isNew;
  final String? subId;

  const TrojanSettingWidget({
    super.key,
    required this.profile,
    required this.isNew,
    this.subId,
  });

  @override
  ConsumerState<TrojanSettingWidget> createState() =>
      _TrojanSettingWidgetState();
}

class _TrojanSettingWidgetState extends ConsumerState<TrojanSettingWidget>
    with ProfileEditorMixin {
  late ProfileExtraItemDto _extraDto;
  late TextEditingController _remarkController;
  late ProfileListenController _listenController;
  late TextEditingController _passwordController;
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
    _passwordController = TextEditingController(text: widget.profile.id);
    _transportController = ProfileTransportController.fromData(widget.profile);
    _securityController = ProfileSecurityController.fromData(widget.profile);
  }

  @override
  void dispose() {
    _remarkController.dispose();
    _listenController.dispose();
    _passwordController.dispose();
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
    return widget.profile.copyWith(
      remarks: _remarkController.text,
      address: _listenController.addressText,
      port: _listenController.portValue,
      id: _passwordController.text,
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
          controller: _passwordController,
          decoration: const InputDecoration(labelText: '密码 (Password)'),
          validator: (value) => value?.isEmpty == true ? '请输入密码' : null,
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
    return ProfileSettingWidget(
      title: 'Trojan Setting',
      profile: widget.profile,
      isNew: widget.isNew,
      controller: this,
    );
  }
}
