import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/core/global_const.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_security_controller.dart';

class ProfileSecurityView extends ConsumerStatefulWidget {
  final ProfileSecurityController controller;
  const ProfileSecurityView({super.key, required this.controller});

  @override
  ConsumerState<ProfileSecurityView> createState() =>
      _ProfileSecurityViewState();
}

class _ProfileSecurityViewState extends ConsumerState<ProfileSecurityView> {
  bool _isEnsuringValid = false;
  bool _setStateScheduled = false;

  @override
  void initState() {
    super.initState();
    _attachListeners(widget.controller);
    _ensureValid();
  }

  @override
  void didUpdateWidget(covariant ProfileSecurityView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller == widget.controller) return;
    _detachListeners(oldWidget.controller);
    _attachListeners(widget.controller);
    _ensureValid();
    _requestRebuild();
  }

  @override
  void dispose() {
    _detachListeners(widget.controller);
    super.dispose();
  }

  void _attachListeners(ProfileSecurityController controller) {
    controller.securityController.addListener(_onAnyControllerChanged);
    controller.utlsFingerprintController.addListener(_onAnyControllerChanged);
    controller.alpnController.addListener(_onAnyControllerChanged);
    controller.allowInsecureController.addListener(_onAnyControllerChanged);
  }

  void _detachListeners(ProfileSecurityController controller) {
    controller.securityController.removeListener(_onAnyControllerChanged);
    controller.utlsFingerprintController.removeListener(
      _onAnyControllerChanged,
    );
    controller.alpnController.removeListener(_onAnyControllerChanged);
    controller.allowInsecureController.removeListener(_onAnyControllerChanged);
  }

  void _onAnyControllerChanged() {
    if (_isEnsuringValid) return;
    _ensureValid();
    _requestRebuild();
  }

  void _ensureValid() {
    _isEnsuringValid = true;
    try {
      final controller = widget.controller;

      final securityText = controller.securityController.text;
      if (!GlobalConst.transportSecurityList.contains(securityText)) {
        final fallback = GlobalConst.transportSecurityList.first;
        if (securityText != fallback) {
          controller.securityController.text = fallback;
        }
      }

      final utlsText = controller.utlsFingerprintController.text;
      if (!GlobalConst.utlsFingerprintList.contains(utlsText)) {
        final fallback = GlobalConst.utlsFingerprintList.first;
        if (utlsText != fallback) {
          controller.utlsFingerprintController.text = fallback;
        }
      }

      final alpnText = controller.alpnController.text;
      if (!GlobalConst.alpnList.contains(alpnText)) {
        final fallback = GlobalConst.alpnList.first;
        if (alpnText != fallback) controller.alpnController.text = fallback;
      }

      final insecureText = controller.allowInsecureController.text;
      if (!GlobalConst.allowInsecureList.contains(insecureText)) {
        final fallback = GlobalConst.allowInsecureList.first;
        if (insecureText != fallback) {
          controller.allowInsecureController.text = fallback;
        }
      }
    } finally {
      _isEnsuringValid = false;
    }
  }

  void _requestRebuild() {
    if (!mounted) return;
    if (_setStateScheduled) return;
    _setStateScheduled = true;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _setStateScheduled = false;
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final isTls =
        widget.controller.securityController.text ==
        GlobalConst.transportSecurityTls;
    final isReality =
        widget.controller.securityController.text ==
        GlobalConst.transportSecurityReality;
    final hasSecurity = isTls || isReality;
    return Column(
      children: [
        DropdownButtonFormField<String>(
          initialValue: widget.controller.securityController.text.isEmpty
              ? null
              : widget.controller.securityController.text,
          decoration: const InputDecoration(labelText: "安全设置"),
          items: GlobalConst.transportSecurityList
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              widget.controller.securityController.text = value;
            }
          },
        ),
        if (hasSecurity)
          Column(
            children: [
              TextFormField(
                controller: widget.controller.sniController,
                decoration: const InputDecoration(labelText: "SNI"),
              ),
              DropdownButtonFormField<String>(
                initialValue: widget.controller.utlsFingerprintController.text.isEmpty
                    ? null
                    : widget.controller.utlsFingerprintController.text,
                decoration: const InputDecoration(labelText: "uTLS 指纹"),
                items: GlobalConst.utlsFingerprintList
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    widget.controller.utlsFingerprintController.text = value;
                  }
                },
              ),
            ],
          ),
        if (isTls)
          Column(
            children: [
              DropdownButtonFormField<String>(
                initialValue: widget.controller.alpnController.text.isEmpty
                    ? null
                    : widget.controller.alpnController.text,
                decoration: const InputDecoration(labelText: "ALPN"),
                items: GlobalConst.alpnList
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    widget.controller.alpnController.text = value;
                  }
                },
              ),
              DropdownButtonFormField<String>(
                initialValue: widget.controller.allowInsecureController.text.isEmpty
                    ? null
                    : widget.controller.allowInsecureController.text,
                decoration: const InputDecoration(labelText: "允许不安全"),
                items: GlobalConst.allowInsecureList
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    widget.controller.allowInsecureController.text = value;
                  }
                },
              ),
            ],
          ),
        if (isReality)
          Column(
            children: [
              TextFormField(
                controller: widget.controller.realityPbkController,
                decoration: const InputDecoration(
                  labelText: "Password (Public Key)",
                ),
              ),
              TextFormField(
                controller: widget.controller.realityShortIdController,
                decoration: const InputDecoration(labelText: "Short ID"),
              ),
              TextFormField(
                controller: widget.controller.realitySpdxController,
                decoration: const InputDecoration(labelText: "SpiderX"),
              ),
              TextFormField(
                controller: widget.controller.mldsa65VerController,
                decoration: const InputDecoration(labelText: "Mldsa65 验证"),
              ),
            ],
          ),
      ],
    );
  }
}
