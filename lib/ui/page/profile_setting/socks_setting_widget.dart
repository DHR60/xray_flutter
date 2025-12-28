import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/data/dto/profile_extra_item_dto.dart';
import 'package:xray_flutter/ui/page/profile_setting/profile_setting_result.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_listen_controller.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_listen_view.dart';

class SocksSettingWidget extends ConsumerStatefulWidget {
  final ProfileItemData profile;
  final bool isNew;
  final String? subId;

  const SocksSettingWidget({
    super.key,
    required this.profile,
    required this.isNew,
    this.subId,
  });

  @override
  ConsumerState<SocksSettingWidget> createState() => _SocksSettingWidgetState();
}

class _SocksSettingWidgetState extends ConsumerState<SocksSettingWidget> {
  late ProfileExtraItemDto _extraDto;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _remarkController;
  late ProfileListenController _listenController;
  late TextEditingController _userController;
  late TextEditingController _passController;
  
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
  }

  @override
  void dispose() {
    _remarkController.dispose();
    _listenController.dispose();
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (!_formKey.currentState!.validate()) return;

    var profile = widget.profile.copyWith(
      remarks: _remarkController.text,
      address: _listenController.addressText,
      port: _listenController.portValue,
      id: _passController.text,
      security: _userController.text,
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
        title: const Text('Socks Setting'),
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
                controller: _userController,
                decoration: const InputDecoration(labelText: '用户名 (Username)'),
              ),
              TextFormField(
                controller: _passController,
                decoration: const InputDecoration(labelText: '密码 (Password)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
