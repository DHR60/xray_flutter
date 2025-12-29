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

class ShadowsocksSettingWidget extends ConsumerStatefulWidget {
  final ProfileItemData profile;
  final bool isNew;
  final String? subId;

  const ShadowsocksSettingWidget({
    super.key,
    required this.profile,
    required this.isNew,
    this.subId,
  });

  @override
  ConsumerState<ShadowsocksSettingWidget> createState() =>
      _ShadowsocksSettingWidgetState();
}

class _ShadowsocksSettingWidgetState
    extends ConsumerState<ShadowsocksSettingWidget>
    with ProfileEditorMixin {
  late ProfileExtraItemDto _extraDto;
  late TextEditingController _remarkController;
  late ProfileListenController _listenController;
  late TextEditingController _methodController;
  late TextEditingController _passwordController;
  late bool _v2rayMode;
  late TextEditingController _obfsController;
  late TextEditingController _obfsParamController;
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
    _methodController = TextEditingController(text: widget.profile.security);
    _passwordController = TextEditingController(text: widget.profile.id);
    _v2rayMode = _extraDto.shadowsocksV2rayMode ?? true;
    _obfsController = TextEditingController(text: _extraDto.obfs ?? '');
    _obfsParamController = TextEditingController(
      text: _extraDto.obfsParam ?? '',
    );
    _transportController = ProfileTransportController.fromData(widget.profile);
    _securityController = ProfileSecurityController.fromData(widget.profile);
  }

  @override
  void dispose() {
    _remarkController.dispose();
    _listenController.dispose();
    _methodController.dispose();
    _passwordController.dispose();
    _obfsController.dispose();
    _obfsParamController.dispose();
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
    _extraDto = _extraDto.copyWith(
      shadowsocksV2rayMode: _v2rayMode,
      obfs: _obfsController.text,
      obfsParam: _obfsParamController.text,
    );

    return widget.profile.copyWith(
      remarks: _remarkController.text,
      address: _listenController.addressText,
      port: _listenController.portValue,
      id: _passwordController.text,
      security: _methodController.text,
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
        DropdownButtonFormField<String>(
          initialValue: _methodController.text.isNotEmpty
              ? _methodController.text
              : null,
          decoration: const InputDecoration(labelText: '加密方法 (Method)'),
          items: GlobalConst.shadowsocksMethodList
              .map(
                (flow) =>
                    DropdownMenuItem<String>(value: flow, child: Text(flow)),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              _methodController.text = value;
            }
          },
        ),
        const Divider(),
        SwitchListTile(
          title: const Text('V2Ray 模式'),
          value: _v2rayMode,
          // onChanged: (value) {
          //   setState(() {
          //     _v2rayMode = value;
          //   });
          // },
          onChanged: null,
        ),
        const Divider(),
        if (!_v2rayMode) ...[
          TextFormField(
            controller: _obfsController,
            decoration: const InputDecoration(labelText: '混淆 (Obfs)'),
          ),
          TextFormField(
            controller: _obfsParamController,
            decoration: const InputDecoration(labelText: '混淆参数 (Obfs Param)'),
          ),
        ],
        if (_v2rayMode) ...[
          const Text('底层传输方式'),
          ProfileTransportView(controller: _transportController),
          const Divider(),
          const Text('传输层安全设置'),
          ProfileSecurityView(controller: _securityController),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProfileSettingScaffold(
      title: 'Shadowsocks Setting',
      profile: widget.profile,
      isNew: widget.isNew,
      controller: this,
    );
  }
}
