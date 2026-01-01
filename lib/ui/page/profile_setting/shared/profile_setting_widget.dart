import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/core/enum/config_type.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/ui/page/profile_setting/profile_setting_result.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_preview_view.dart';
import 'package:xray_flutter/ui/page/shared/json_edit_widget.dart';

abstract class ProfileEditorController {
  GlobalKey<FormState> get formKey;

  Widget buildFormContent(BuildContext context);

  ProfileItemData? saveAndGetProfile();
}

class ProfileSettingWidget extends ConsumerStatefulWidget {
  final String title;
  final ProfileItemData profile;
  final bool isNew;
  final ProfileEditorController controller;

  const ProfileSettingWidget({
    super.key,
    required this.title,
    required this.profile,
    required this.isNew,
    required this.controller,
  });

  @override
  ConsumerState<ProfileSettingWidget> createState() =>
      _ProfileSettingWidgetState();
}

class _ProfileSettingWidgetState extends ConsumerState<ProfileSettingWidget> {
  late final StreamController<ProfileItemData> _profileStreamController;
  late String _customOutboundJson;
  late String _customConfigJson;

  @override
  void initState() {
    super.initState();
    _profileStreamController = StreamController<ProfileItemData>.broadcast();
    _profileStreamController.add(widget.profile);
    _customOutboundJson = widget.profile.customOutbound;
    _customConfigJson = widget.profile.customConfig;
  }

  @override
  void didUpdateWidget(covariant ProfileSettingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.profile != widget.profile) {
      _profileStreamController.add(widget.profile);
    }
  }

  @override
  void dispose() {
    _profileStreamController.close();
    super.dispose();
  }

  void _saveProfile(BuildContext context) {
    final savedProfile = widget.controller.saveAndGetProfile();
    if (savedProfile != null) {
      Navigator.of(context).pop(ProfileSettingUpsert(_currentProfile));
    }
  }

  void _deleteProfile(BuildContext context) {
    Navigator.of(context).pop(ProfileSettingDelete(widget.profile));
  }

  ProfileItemData get _currentProfile {
    final ProfileItemData profileFromForm =
        widget.controller.saveAndGetProfile() ?? widget.profile;
    if (profileFromForm.configType == EConfigType.custom) {
      return profileFromForm;
    }
    return profileFromForm.copyWith(
      customOutbound: _customOutboundJson,
      customConfig: _customConfigJson,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          if (!widget.isNew)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _deleteProfile(context),
            ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () => _saveProfile(context),
          ),
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == 'preview') {
                final updatedProfile = _currentProfile;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(title: const Text('配置预览')),
                      body: SafeArea(
                        child: SingleChildScrollView(
                          child: ProfilePreviewView(
                            initialProfile: updatedProfile,
                            profileStream: _profileStreamController.stream,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else if (value == 'custom_outbound') {
                final result = await Navigator.of(context).push<String>(
                  MaterialPageRoute(
                    builder: (context) => JsonEditWidget(
                      title: '自定义出站 JSON 配置',
                      initialJson: _customOutboundJson,
                    ),
                  ),
                );
                if (result != null) {
                  setState(() {
                    _customOutboundJson = result;
                  });
                }
              } else if (value == 'custom_config') {
                final result = await Navigator.of(context).push<String>(
                  MaterialPageRoute(
                    builder: (context) => JsonEditWidget(
                      title: '自定义完整 JSON 配置',
                      initialJson: _customConfigJson,
                    ),
                  ),
                );
                if (result != null) {
                  setState(() {
                    _customConfigJson = result;
                  });
                }
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'preview',
                child: Text('预览当前配置效果'),
              ),
              if (widget.profile.configType != EConfigType.custom) ...[
                const PopupMenuDivider(),
                const PopupMenuItem(
                  enabled: false,
                  height: 40,
                  child: Center(
                    child: Text(
                      '自定义配置',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'custom_outbound',
                  child: Text('自定义出站'),
                ),
                const PopupMenuItem<String>(
                  value: 'custom_config',
                  child: Text('自定义完整配置'),
                ),
              ],
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final aspect =
                width / constraints.maxHeight.clamp(0.01, double.infinity);
            if (aspect < 1.2 || width < 800) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: widget.controller.formKey,
                    child: widget.controller.buildFormContent(context),
                  ),
                ),
              );
            } else {
              return Row(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: widget.controller.formKey,
                          child: widget.controller.buildFormContent(context),
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(width: 1.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              _profileStreamController.add(_currentProfile);
                            },
                            child: const Text('更新预览'),
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: SingleChildScrollView(
                              child: ProfilePreviewView(
                                initialProfile: widget.profile,
                                profileStream: _profileStreamController.stream,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

mixin ProfileEditorMixin<T extends ConsumerStatefulWidget> on ConsumerState<T>
    implements ProfileEditorController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  GlobalKey<FormState> get formKey => _formKey;

  ProfileItemData get originalProfile;

  String? get subId;

  ProfileItemData buildProfile();

  @override
  ProfileItemData? saveAndGetProfile() {
    if (!_formKey.currentState!.validate()) return null;

    var profile = buildProfile();
    if (subId != null) {
      profile = profile.copyWith(subid: subId);
    }
    return profile;
  }
}
