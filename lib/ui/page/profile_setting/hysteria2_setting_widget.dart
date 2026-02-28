import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

class Hysteria2SettingWidget extends ConsumerStatefulWidget {
  final ProfileItemData profile;
  final bool isNew;
  final String? subId;

  const Hysteria2SettingWidget({
    super.key,
    required this.profile,
    required this.isNew,
    this.subId,
  });

  @override
  ConsumerState<Hysteria2SettingWidget> createState() =>
      _Hysteria2SettingWidgetState();
}

class _Hysteria2SettingWidgetState extends ConsumerState<Hysteria2SettingWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ProfileExtraItemDto _extraDto;
  late TextEditingController _remarkController;
  late ProfileListenController _listenController;
  late TextEditingController _passController;
  late TextEditingController _obfsPassController;
  late TextEditingController _hopPortsController;
  late TextEditingController _hopIntervalController;
  late TextEditingController _brutalUpController;
  late TextEditingController _brutalDownController;
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
    _passController = TextEditingController(text: widget.profile.id);
    _obfsPassController = TextEditingController(
      text: _extraDto.hy2ObfsPass ?? '',
    );
    _hopPortsController = TextEditingController(
      text: _extraDto.hy2HopPorts ?? '',
    );
    _hopIntervalController = TextEditingController(
      text: _extraDto.hy2HopInterval ?? '',
    );
    _brutalUpController = TextEditingController(text: _extraDto.hy2Up ?? '');
    _brutalDownController = TextEditingController(
      text: _extraDto.hy2Down ?? '',
    );
    _securityController = ProfileSecurityController.fromData(widget.profile);
    _securityController.alpnController.text = 'h3';
    _securityController.utlsFingerprintController.text = '';
    _finalmaskController = ProfileFinalmaskController.fromData(widget.profile);
  }

  @override
  void dispose() {
    _remarkController.dispose();
    _listenController.dispose();
    _passController.dispose();
    _obfsPassController.dispose();
    _hopPortsController.dispose();
    _hopIntervalController.dispose();
    _brutalUpController.dispose();
    _brutalDownController.dispose();
    _securityController.dispose();
    _finalmaskController.dispose();
    super.dispose();
  }

  ProfileItemData _buildProfile() {
    _extraDto = _extraDto.copyWith(
      hy2ObfsPass: _obfsPassController.text,
      hy2HopPorts: _hopPortsController.text,
      hy2HopInterval: _hopIntervalController.text,
      hy2Up: _brutalUpController.text,
      hy2Down: _brutalDownController.text,
    );

    return widget.profile.copyWith(
      remarks: _remarkController.text,
      address: _listenController.addressText,
      port: _listenController.portValue,
      id: _passController.text,
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

  Widget _buildFormContent(BuildContext context) {
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
          controller: _passController,
          decoration: const InputDecoration(labelText: '密码 (Password)'),
          validator: (value) => value?.isEmpty == true ? '请输入密码' : null,
        ),
        TextFormField(
          controller: _obfsPassController,
          decoration: const InputDecoration(labelText: '混淆密码 (Obfs Password)'),
        ),
        const Divider(),
        TextFormField(
          controller: _hopPortsController,
          decoration: const InputDecoration(
            labelText: '端口跳跃 (Hop Ports)',
            hintText: '格式如 1000-2000,3000,4000-5000',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return null;
            }
            final regex = RegExp(r'^(\d+-\d+|\d+)(,(\d+-\d+|\d+))*$');
            if (regex.hasMatch(value) &&
                (value.contains(',') || value.contains('-'))) {
              return null;
            }
            return '端口跳跃格式不正确';
          },
        ),
        TextFormField(
          controller: _hopIntervalController,
          decoration: const InputDecoration(
            labelText: '跳跃间隔 (Hop Interval)',
            hintText: '格式如 5s, 500ms',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return null;
            }
            final regex = RegExp(r'^\d+(ms|s|m|h)$');
            if (regex.hasMatch(value)) {
              return null;
            }
            return '跳跃间隔格式不正确';
          },
        ),
        const Divider(),
        TextFormField(
          controller: _brutalUpController,
          decoration: const InputDecoration(
            labelText: 'Brutal 上传速度 (Brutal Up)',
            hintText: '无单位时默认为 bps',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return null;
            }
            // check if it too small and not has unit
            final tryParse = int.tryParse(value) ?? 0;
            if (tryParse > 0 && tryParse < 1000000) {
              return '上传速度过小，请检查单位';
            }
            final regex = RegExp(r'^\d+(bps|kbps|mbps|gbps)?$');
            if (regex.hasMatch(value)) {
              return null;
            }
            return '上传速度格式不正确';
          },
        ),
        TextFormField(
          controller: _brutalDownController,
          decoration: const InputDecoration(
            labelText: 'Brutal 下载速度 (Brutal Down)',
            hintText: '无单位时默认为 bps',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return null;
            }
            // check if it too small and not has unit
            final tryParse = int.tryParse(value) ?? 0;
            if (tryParse > 0 && tryParse < 1000000) {
              return '下载速度过小，请检查单位';
            }
            final regex = RegExp(r'^\d+(bps|kbps|mbps|gbps)?$');
            if (regex.hasMatch(value)) {
              return null;
            }
            return '下载速度格式不正确';
          },
        ),
        const Divider(),
        const Text('传输层安全设置'),
        ProfileSecurityView(
          controller: _securityController,
          tlsOnly: true,
          alpnEnabled: false,
          fingerprintEnabled: false,
        ),
        const Divider(),
        const Text('最终伪装层'),
        ProfileFinalmaskView(controller: _finalmaskController),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProfileSettingWidget(
      title: 'Hysteria2 Setting',
      profile: widget.profile,
      isNew: widget.isNew,
      formKey: _formKey,
      formContent: _buildFormContent(context),
      onBuildProfile: _buildProfile,
      subId: widget.subId,
    );
  }
}
