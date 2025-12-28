import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/core/enum/transport.dart';
import 'package:xray_flutter/core/global_const.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/ray_like/profile_transport_controller.dart';

class ProfileTransportView extends ConsumerStatefulWidget {
  final ProfileTransportController controller;
  const ProfileTransportView({super.key, required this.controller});

  @override
  ConsumerState<ProfileTransportView> createState() =>
      _ProfileTransportViewState();
}

class _ProfileTransportViewState extends ConsumerState<ProfileTransportView> {
  bool _isEnsuringValid = false;
  bool _setStateScheduled = false;

  @override
  void initState() {
    super.initState();
    _attachListeners(widget.controller);
    _ensureValid();
  }

  @override
  void didUpdateWidget(covariant ProfileTransportView oldWidget) {
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

  void _attachListeners(ProfileTransportController controller) {
    controller.transportController.addListener(_onAnyControllerChanged);
    controller.subTypeController.addListener(_onAnyControllerChanged);
  }

  void _detachListeners(ProfileTransportController controller) {
    controller.transportController.removeListener(_onAnyControllerChanged);
    controller.subTypeController.removeListener(_onAnyControllerChanged);
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

      final transportKey = controller.transportController.text;
      if (!GlobalConst.transportMap.containsKey(transportKey)) {
        final fallback = GlobalConst.transportMap.keys.first;
        if (transportKey != fallback) {
          controller.transportController.text = fallback;
        }
      }

      final resolvedKey = controller.transportController.text;
      final transport = GlobalConst.transportMap[resolvedKey] ?? ETransport.raw;
      final subTypeList =
          GlobalConst.transportTypeMap[transport] ?? GlobalConst.noneTypes;
      final subTypeText = controller.subTypeController.text;
      if (!subTypeList.contains(subTypeText)) {
        final fallback = subTypeList.first;
        if (subTypeText != fallback) {
          controller.subTypeController.text = fallback;
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
    return Column(
      children: [
        DropdownButtonFormField<String>(
          initialValue: widget.controller.transportController.text.isEmpty
              ? null
              : widget.controller.transportController.text,
          decoration: const InputDecoration(labelText: "传输协议"),
          items: GlobalConst.transportMap.keys
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              widget.controller.transportController.text = value;
            }
          },
        ),
        DropdownButtonFormField<String>(
          initialValue: widget.controller.subTypeController.text.isEmpty
              ? null
              : widget.controller.subTypeController.text,
          decoration: const InputDecoration(labelText: "类型"),
          items: GlobalConst
              .transportTypeMap[GlobalConst.transportMap[widget
                  .controller
                  .transportController
                  .text]!]!
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              widget.controller.subTypeController.text = value;
            }
          },
        ),
        if (!(GlobalConst.transportMap[widget
                    .controller
                    .transportController
                    .text] ==
                ETransport.raw &&
            widget.controller.subTypeController.text == 'none'))
          Column(
            children: [
              TextFormField(
                controller: widget.controller.hostController,
                decoration: const InputDecoration(labelText: "Host"),
              ),
              TextFormField(
                controller: widget.controller.pathController,
                decoration: const InputDecoration(labelText: "Path"),
              ),
            ],
          ),
        if (widget.controller.transportController.text == ETransport.xhttp.name)
          TextFormField(
            controller: widget.controller.xhttpExtraController,
            decoration: const InputDecoration(labelText: "XHTTP 额外配置"),
          ),
      ],
    );
  }
}
