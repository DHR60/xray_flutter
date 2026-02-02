import 'package:xray_flutter/core/enum/transport.dart';
import 'package:xray_flutter/core/global_const.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/core/enum/config_type.dart';
import 'package:xray_flutter/core/enum/core_type.dart';
import 'package:xray_flutter/data/dto/profile_extra_item_dto.dart';

class ProfileItemFactory {
  static ProfileItemData createDefault(String indexId, int orderIndex) {
    return ProfileItemData(
      indexId: indexId,
      remarks: '',
      orderIndex: orderIndex,
      address: '',
      port: 0,
      allowInsecure: '',
      alpn: '',
      cert: '',
      certSha256: '',
      configType: EConfigType.vless,
      configVersion: 0,
      displayLog: true,
      fingerprint: '',
      headerType: '',
      id: '',
      network: '',
      isSub: false,
      jsonData: '',
      mldsa65Verify: '',
      path: '',
      publicKey: '',
      requestHost: '',
      security: '',
      sni: '',
      shortId: '',
      spiderX: '',
      streamSecurity: '',
      subid: '',
      xhttpExtra: '',
      customConfig: '',
      customOutbound: '',
      coreType: ECoreType.xray,
      preSocksProxy: null,
      finalmask: '',
    );
  }

  static bool isEqual(ProfileItemData a, ProfileItemData b) {
    return a == b;
  }

  // only compare remote relevant fields
  static bool isRemoteEqual(ProfileItemData a, ProfileItemData b) {
    final aExtra = ProfileExtraItemDto.fromString(a.jsonData).toJson();
    final bExtra = ProfileExtraItemDto.fromString(b.jsonData).toJson();
    // compare extra, ingore order and different empty fields
    // e.g., {"a":""}, {"a":null} and {}
    final allKeys = <String>{}
      ..addAll(aExtra.keys)
      ..addAll(bExtra.keys);
    for (final key in allKeys) {
      final aValue = aExtra[key];
      final bValue = bExtra[key];
      final aIsEmpty =
          aValue == null ||
          (aValue is String && aValue.isEmpty) ||
          (aValue is bool && aValue == false);
      final bIsEmpty =
          bValue == null ||
          (bValue is String && bValue.isEmpty) ||
          (bValue is bool && bValue == false);
      if (aIsEmpty && bIsEmpty) {
        continue;
      }
      if (aValue != bValue) {
        return false;
      }
    }
    final normalizedANetwork =
        GlobalConst.transportMap[a.network] ?? ETransport.raw;
    final normalizedBNetwork =
        GlobalConst.transportMap[b.network] ?? ETransport.raw;
    return a.address == b.address &&
        a.port == b.port &&
        a.allowInsecure == b.allowInsecure &&
        a.alpn == b.alpn &&
        a.cert == b.cert &&
        a.certSha256 == b.certSha256 &&
        a.configType == b.configType &&
        a.fingerprint == b.fingerprint &&
        a.headerType == b.headerType &&
        a.id == b.id &&
        normalizedANetwork == normalizedBNetwork &&
        a.mldsa65Verify == b.mldsa65Verify &&
        a.path == b.path &&
        a.publicKey == b.publicKey &&
        a.requestHost == b.requestHost &&
        a.security == b.security &&
        a.sni == b.sni &&
        a.shortId == b.shortId &&
        a.spiderX == b.spiderX &&
        a.streamSecurity == b.streamSecurity &&
        a.xhttpExtra == b.xhttpExtra &&
        a.customConfig == b.customConfig &&
        a.customOutbound == b.customOutbound &&
        a.finalmask == b.finalmask;
  }
}
