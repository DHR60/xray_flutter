import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    );
                    if (newPort != null && newPort.isNotEmpty) {
                      final port = int.tryParse(newPort.trim());
                      if (port == null || port < 1 || port > 65535) {
                        return;
                      }
                      final currentSetting = ref.read(settingProvider);
                      final newSetting = currentSetting.copyWith(
                        inbound: currentSetting.inbound.copyWith(
                          port: port.toString(),
                        ),
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
            ExpansionTile(
              tilePadding: EdgeInsets.symmetric(horizontal: 16),
              childrenPadding: EdgeInsets.only(left: 32),
              initiallyExpanded: true,
              title: Text(
                'DNS 设置',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              children: [
                ListTile(
                  title: const Text('远程 DNS'),
                  subtitle: Text(ref.watch(settingProvider).dns.remoteDns),
                  onTap: () async {
                    final newRemoteDns =
                        await DialogUtils.showModernInputDialog(
                          context,
                          title: '设置远程 DNS，多个地址用逗号分隔',
                          hint: '请输入远程 DNS 地址',
                          initialValue: ref
                              .watch(settingProvider)
                              .dns
                              .remoteDns,
                        );
                    if (newRemoteDns != null && newRemoteDns.isNotEmpty) {
                      final currentSetting = ref.read(settingProvider);
                      final newSetting = currentSetting.copyWith(
                        dns: currentSetting.dns.copyWith(
                          remoteDns: newRemoteDns.trim().replaceAll('，', ','),
                        ),
                      );
                      await ref
                          .read(settingProvider.notifier)
                          .updateCoreItem(newSetting);
                    }
                  },
                ),
                ListTile(
                  title: const Text('本地 DNS'),
                  subtitle: Text(ref.watch(settingProvider).dns.localDns),
                  onTap: () async {
                    final newLocalDns = await DialogUtils.showModernInputDialog(
                      context,
                      title: '设置本地 DNS，多个地址用逗号分隔',
                      hint: '请输入本地 DNS 地址',
                      initialValue: ref.watch(settingProvider).dns.localDns,
                    );
                    if (newLocalDns != null && newLocalDns.isNotEmpty) {
                      final currentSetting = ref.read(settingProvider);
                      final newSetting = currentSetting.copyWith(
                        dns: currentSetting.dns.copyWith(
                          localDns: newLocalDns.trim().replaceAll('，', ','),
                        ),
                      );
                      await ref
                          .read(settingProvider.notifier)
                          .updateCoreItem(newSetting);
                    }
                  },
                ),
                SwitchListTile(
                  title: const Text('启用 FakeDNS'),
                  subtitle: const Text('可能导致其他应用代理停止后无法连接网络'),
                  value: ref.watch(settingProvider).dns.enableFakeDns,
                  onChanged: (value) async {
                    final currentSetting = ref.read(settingProvider);
                    final newSetting = currentSetting.copyWith(
                      dns: currentSetting.dns.copyWith(enableFakeDns: value),
                    );
                    await ref
                        .read(settingProvider.notifier)
                        .updateCoreItem(newSetting);
                  },
                ),
                ListTile(
                  title: const Text('附加 Hosts'),
                  subtitle: Text(
                    ref.watch(settingProvider).dns.additionalHosts.isEmpty
                        ? '未设置'
                        : ref.watch(settingProvider).dns.additionalHosts,
                  ),
                  onTap: () async {
                    final newAdditionalHosts =
                        await DialogUtils.showModernInputDialog(
                          context,
                          title: '设置附加 Hosts，格式为 domain ip1 ip2 ...，每行一条',
                          hint: '请输入附加 Hosts',
                          initialValue: ref
                              .watch(settingProvider)
                              .dns
                              .additionalHosts,
                        );
                    if (newAdditionalHosts != null) {
                      final currentSetting = ref.read(settingProvider);
                      final newSetting = currentSetting.copyWith(
                        dns: currentSetting.dns.copyWith(
                          additionalHosts: newAdditionalHosts.trim(),
                        ),
                      );
                      await ref
                          .read(settingProvider.notifier)
                          .updateCoreItem(newSetting);
                    }
                  },
                ),
                SwitchListTile(
                  title: const Text('启用乐观缓存'),
                  subtitle: const Text('立即返回缓存中陈旧的 DNS 记录，并后台刷新缓存，降低延迟'),
                  value: ref.watch(settingProvider).dns.serveStale,
                  onChanged: (value) async {
                    final currentSetting = ref.read(settingProvider);
                    final newSetting = currentSetting.copyWith(
                      dns: currentSetting.dns.copyWith(serveStale: value),
                    );
                    await ref
                        .read(settingProvider.notifier)
                        .updateCoreItem(newSetting);
                  },
                ),
                SwitchListTile(
                  title: const Text('并行查询'),
                  subtitle: const Text('同时向多个上游 DNS 服务器发送查询请求以加快响应速度'),
                  value: ref.watch(settingProvider).dns.parallelQuery,
                  onChanged: (value) async {
                    final currentSetting = ref.read(settingProvider);
                    final newSetting = currentSetting.copyWith(
                      dns: currentSetting.dns.copyWith(parallelQuery: value),
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
