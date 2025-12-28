import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/core/enum/config_type.dart';
import 'package:xray_flutter/core/enum/core_type.dart';

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
      ports: '',
      publicKey: '',
      requestHost: '',
      security: '',
      sni: '',
      shortId: '',
      spiderX: '',
      streamSecurity: '',
      subid: '',
      xhttpExtra: '',
      coreType: ECoreType.xray,
      preSocksProxy: null,
    );
  }
}
