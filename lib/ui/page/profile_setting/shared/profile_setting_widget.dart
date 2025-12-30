import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/ui/page/profile_setting/profile_setting_result.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_preview_view.dart';

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

  @override
  void initState() {
    super.initState();
    _profileStreamController = StreamController<ProfileItemData>.broadcast();
    _profileStreamController.add(widget.profile);
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
      Navigator.of(context).pop(ProfileSettingUpsert(savedProfile));
    }
  }

  void _deleteProfile(BuildContext context) {
    Navigator.of(context).pop(ProfileSettingDelete(widget.profile));
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
                  child: Column(
                    children: [
                      Form(
                        key: widget.controller.formKey,
                        child: widget.controller.buildFormContent(context),
                      ),
                      const SizedBox(height: 24),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Scaffold(
                                appBar: AppBar(title: const Text('配置预览')),
                                body: SafeArea(
                                  child: SingleChildScrollView(
                                    child: ProfilePreviewView(
                                      initialProfile: widget.profile,
                                      profileStream:
                                          _profileStreamController.stream,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Text('显示预览'),
                      ),
                    ],
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
                              final updatedProfile =
                                  widget.controller.saveAndGetProfile() ??
                                  widget.profile;
                              _profileStreamController.add(updatedProfile);
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
