import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/core/enum/config_type.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/ui/page/profile_setting/http_setting_widget.dart';
import 'package:xray_flutter/ui/page/profile_setting/shadowsocks_setting_widget.dart';
import 'package:xray_flutter/ui/page/profile_setting/socks_setting_widget.dart';
import 'package:xray_flutter/ui/page/profile_setting/trojan_setting_widget.dart';
import 'package:xray_flutter/ui/page/profile_setting/vless_setting_widget.dart';
import 'package:xray_flutter/ui/page/profile_setting/vmess_setting_widget.dart';
import 'package:xray_flutter/ui/page/profile_setting/wireguard_setting_widget.dart';

class ProfileFacSettingWidget extends ConsumerWidget {
  final EConfigType configType;
  final ProfileItemData profile;
  final bool isNew;
  final String? subId;

  const ProfileFacSettingWidget({
    super.key,
    required this.configType,
    required this.profile,
    required this.isNew,
    this.subId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (configType) {
      case EConfigType.vless:
        return VlessSettingWidget(profile: profile, isNew: isNew, subId: subId);
      case EConfigType.vmess:
        return VmessSettingWidget(profile: profile, isNew: isNew, subId: subId);
      case EConfigType.shadowsocks:
        return ShadowsocksSettingWidget(profile: profile, isNew: isNew, subId: subId);
      case EConfigType.trojan:
        return TrojanSettingWidget(profile: profile, isNew: isNew, subId: subId);
      case EConfigType.wireguard:
        return WireguardSettingWidget(profile: profile, isNew: isNew, subId: subId);
      case EConfigType.socks:
        return SocksSettingWidget(profile: profile, isNew: isNew, subId: subId);
      case EConfigType.http:
        return HttpSettingWidget(profile: profile, isNew: isNew, subId: subId);
      default:
        return AppBar(title: Text("不支持的配置类型"));
    }
  }
}
