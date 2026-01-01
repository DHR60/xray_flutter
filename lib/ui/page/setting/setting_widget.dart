import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/ui/page/setting/setting_notifier.dart';
import 'package:xray_flutter/ui/page/shared/dialog_utils.dart';

class SettingWidget extends ConsumerStatefulWidget {
  const SettingWidget({super.key});

  @override
  ConsumerState<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends ConsumerState<SettingWidget> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        appBar: AppBar(title: const Text('设置')),
        body: ListView(
          children: [
            ExpansionTile(
              tilePadding: EdgeInsets.symmetric(horizontal: 16),
              childrenPadding: EdgeInsets.only(left: 32),
              initiallyExpanded: true,
              title: Text(
                '入站设置',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              children: [
                ListTile(
                  title: const Text('入站端口'),
                  subtitle: Text(ref.watch(settingProvider).inbound.port),
                  onTap: () async {
                    final newPort = await DialogUtils.showModernInputDialog(
                      context,
                      title: '设置入站端口',
                      hint: '请输入端口号',
                      initialValue: ref.watch(settingProvider).inbound.port,
                    );
                    if (newPort != null && newPort.isNotEmpty) {
                      final currentSetting = ref.read(settingProvider);
                      final newSetting = currentSetting.copyWith(
                        inbound: currentSetting.inbound.copyWith(port: newPort),
                      );
                      await ref
                          .read(settingProvider.notifier)
                          .updateCoreItem(newSetting);
                    }
                  },
                ),
                SwitchListTile(
                  title: const Text('启用嗅探'),
                  subtitle: const Text('允许根据流量类型自动识别目标地址'),
                  value: ref.watch(settingProvider).inbound.sniff,
                  onChanged: (value) async {
                    final currentSetting = ref.read(settingProvider);
                    final newSetting = currentSetting.copyWith(
                      inbound: currentSetting.inbound.copyWith(sniff: value),
                    );
                    await ref
                        .read(settingProvider.notifier)
                        .updateCoreItem(newSetting);
                  },
                ),
                SwitchListTile(
                  title: const Text('覆盖目标地址'),
                  subtitle: const Text('强制使用嗅探到的目标地址，忽略应用层指定的地址'),
                  value: ref.watch(settingProvider).inbound.overrideTarget,
                  onChanged: (value) async {
                    final currentSetting = ref.read(settingProvider);
                    final newSetting = currentSetting.copyWith(
                      inbound: currentSetting.inbound.copyWith(
                        overrideTarget: value,
                      ),
                    );
                    await ref
                        .read(settingProvider.notifier)
                        .updateCoreItem(newSetting);
                  },
                ),
                SwitchListTile(
                  title: const Text('公共监听'),
                  subtitle: const Text('允许来自非本机的连接请求'),
                  value: ref.watch(settingProvider).inbound.publicListen,
                  onChanged: (value) async {
                    final currentSetting = ref.read(settingProvider);
                    final newSetting = currentSetting.copyWith(
                      inbound: currentSetting.inbound.copyWith(
                        publicListen: value,
                      ),
                    );
                    await ref
                        .read(settingProvider.notifier)
                        .updateCoreItem(newSetting);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
