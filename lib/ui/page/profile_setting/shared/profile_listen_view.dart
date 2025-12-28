import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_listen_controller.dart';

class ProfileListenView extends ConsumerWidget {
  final ProfileListenController controller;
  const ProfileListenView({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TextFormField(
          controller: controller.addressController,
          decoration: const InputDecoration(labelText: '服务器地址'),
          validator: (value) => value?.isEmpty == true ? '请输入地址' : null,
        ),
        TextFormField(
          controller: controller.portController,
          decoration: const InputDecoration(labelText: '服务器端口'),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) return '请输入端口';
            final port = int.tryParse(value);
            if (port == null || port <= 0 || port > 65535) {
              return '端口号无效';
            }
            return null;
          },
        ),
      ],
    );
  }
}
