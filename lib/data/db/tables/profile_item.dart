import 'package:drift/drift.dart';
import 'package:xray_flutter/data/enum/config_type.dart';
import 'package:xray_flutter/data/enum/core_type.dart';

class ProfileItem extends Table {
  late final indexId = text()();
  late final configType = textEnum<EConfigType>().clientDefault(() => 'unknown')();
  late final configVersion = integer().clientDefault(() => 0)();
  late final remarks = text().clientDefault(() => '')();
  late final subid = text().clientDefault(() => '')();
  late final isSub = boolean().clientDefault(() => true)();
  late final address = text().clientDefault(() => '')();
  late final port = integer().clientDefault(() => 0)();
  late final ports = text().clientDefault(() => '')();
  late final id = text().clientDefault(() => '')();
  late final alterId = integer().clientDefault(() => 0)();
  late final security = text().clientDefault(() => '')();
  late final network = text().clientDefault(() => '')();
  late final headerType = text().clientDefault(() => '')();
  late final requestHost = text().clientDefault(() => '')();
  late final path = text().clientDefault(() => '')();
  late final streamSecurity = text().clientDefault(() => '')();
  late final allowInsecure = text().clientDefault(() => '')();
  late final sni = text().clientDefault(() => '')();
  late final alpn = text().clientDefault(() => '')();
  late final fingerprint = text().clientDefault(() => '')();
  late final publicKey = text().clientDefault(() => '')();
  late final shortId = text().clientDefault(() => '')();
  late final spiderX = text().clientDefault(() => '')();
  late final mldsa65Verify = text().clientDefault(() => '')();
  late final coreType = textEnum<ECoreType>().nullable()();
  late final preSocksProxy = integer().nullable()();
  late final displayLog = boolean().clientDefault(() => true)();
  late final xhttpExtra = text().clientDefault(() => '')();
  late final cert = text().clientDefault(() => '')();
  late final jsonData = text().clientDefault(() => '')();
  
  @override
  Set<Column<Object>> get primaryKey => {indexId};
}