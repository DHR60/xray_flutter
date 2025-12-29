import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/data/dto/profile_extra_item_dto.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_listen_controller.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_listen_view.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_setting_scaffold.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_security_controller.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_security_view.dart';

class HttpSettingWidget extends ConsumerStatefulWidget {
  final ProfileItemData profile;
  final bool isNew;
  final String? subId;

  const HttpSettingWidget({
    super.key,
    required this.profile,
    required this.isNew,
    this.subId,
  });

  @override
  ConsumerState<HttpSettingWidget> createState() => _HttpSettingWidgetState();
}

class _HttpSettingWidgetState extends ConsumerState<HttpSettingWidget>
    with ProfileEditorMixin {
  late ProfileExtraItemDto _extraDto;
  late TextEditingController _remarkController;
  late ProfileListenController _listenController;
  late TextEditingController _userController;
  late TextEditingController _passController;
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
    _userController = TextEditingController(text: widget.profile.security);
    _passController = TextEditingController(text: widget.profile.id);
    _securityController = ProfileSecurityController.fromData(widget.profile);
  }

  @override
  void dispose() {
    _remarkController.dispose();
    _listenController.dispose();
    _userController.dispose();
    _passController.dispose();
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
      id: _passController.text,
      security: _userController.text,
      streamSecurity: _securityController.security,
      sni: _securityController.sni,
      fingerprint: _securityController.utlsFingerprint,
      alpn: _securityController.alpn,
      allowInsecure: _securityController.allowInsecure,
      publicKey: _securityController.realityPbk,
      shortId: _securityController.realityShortId,
      spiderX: _securityController.realitySpdx,
      mldsa65Verify: _securityController.mldsa65Ver,
      jsonData: _extraDto.toString(),
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
          controller: _userController,
          decoration: const InputDecoration(labelText: '用户名 (Username)'),
        ),
        TextFormField(
          controller: _passController,
          decoration: const InputDecoration(labelText: '密码 (Password)'),
        ),
        const Divider(),
        ProfileSecurityView(controller: _securityController),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProfileSettingScaffold(
      title: 'Http Setting',
      profile: widget.profile,
      isNew: widget.isNew,
      controller: this,
    );
  }
}
