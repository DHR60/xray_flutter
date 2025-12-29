import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/ui/page/profile_setting/profile_setting_result.dart';

abstract class ProfileEditorController {
  GlobalKey<FormState> get formKey;

  Widget buildFormContent(BuildContext context);

  ProfileItemData? saveAndGetProfile();
}

class ProfileSettingScaffold extends ConsumerWidget {
  final String title;
  final ProfileItemData profile;
  final bool isNew;
  final ProfileEditorController controller;

  const ProfileSettingScaffold({
    super.key,
    required this.title,
    required this.profile,
    required this.isNew,
    required this.controller,
  });

  void _saveProfile(BuildContext context) {
    final savedProfile = controller.saveAndGetProfile();
    if (savedProfile != null) {
      Navigator.of(context).pop(ProfileSettingUpsert(savedProfile));
    }
  }

  void _deleteProfile(BuildContext context) {
    Navigator.of(context).pop(ProfileSettingDelete(profile));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget content = SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: controller.formKey,
        child: controller.buildFormContent(context),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          if (!isNew)
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
            final aspect = width / constraints.maxHeight.clamp(0.01, double.infinity);
            // return SingleChildScrollView(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Form(
            //     key: controller.formKey,
            //     child: controller.buildFormContent(context),
            //   ),
            // );
            if (aspect < 1.2) {
              return content;
            } else {
              // TODO: On the right side of the page, QR code, outbound config json and other information are displayed
              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: content,
                ),
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
