import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_field_editor/json_field_editor.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_finalmask_controller.dart';

class ProfileFinalmaskView extends ConsumerStatefulWidget {
  final ProfileFinalmaskController controller;
  const ProfileFinalmaskView({super.key, required this.controller});

  @override
  ConsumerState<ProfileFinalmaskView> createState() =>
      _ProfileFinalmaskViewState();
}

class _ProfileFinalmaskViewState extends ConsumerState<ProfileFinalmaskView> {
  // bool _isEnsuringValid = false;
  // bool _setStateScheduled = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _attachListeners(widget.controller);
  //   _ensureValid();
  // }

  // @override
  // void didUpdateWidget(covariant ProfileFinalmaskView oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (oldWidget.controller == widget.controller) return;
  //   _detachListeners(oldWidget.controller);
  //   _attachListeners(widget.controller);
  //   _ensureValid();
  //   _requestRebuild();
  // }

  // @override
  // void dispose() {
  //   _detachListeners(widget.controller);
  //   super.dispose();
  // }

  // void _attachListeners(ProfileFinalmaskController controller) {
  //   controller.finalmaskController.addListener(_onAnyControllerChanged);
  // }

  // void _detachListeners(ProfileFinalmaskController controller) {
  //   controller.finalmaskController.removeListener(_onAnyControllerChanged);
  // }

  // void _onAnyControllerChanged() {
  //   if (_isEnsuringValid) return;
  //   _ensureValid();
  //   _requestRebuild();
  // }

  // void _ensureValid() {
  //   _isEnsuringValid = true;
  //   try {
  //   } finally {
  //     _isEnsuringValid = false;
  //   }
  // }

  // void _requestRebuild() {
  //   if (!mounted) return;
  //   if (_setStateScheduled) return;
  //   _setStateScheduled = true;
  //   SchedulerBinding.instance.addPostFrameCallback((_) {
  //     _setStateScheduled = false;
  //     if (mounted) setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JsonField(
          controller: widget.controller.finalmaskController,
          decoration: const InputDecoration(labelText: "FinalMask 最终伪装层"),
          isFormatting: true,
          showErrorMessage: false,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          minLines: 3,
        ),
      ],
    );
  }
}
