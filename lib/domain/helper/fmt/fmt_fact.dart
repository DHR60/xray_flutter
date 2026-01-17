import 'package:xray_flutter/core/enum/config_type.dart';
import 'package:xray_flutter/core/global_const.dart';
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/data/model/profile_item_factory.dart';
import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/helper/fmt/hy2_fact.dart';
import 'package:xray_flutter/domain/helper/fmt/shadowsocks_fmt.dart';
import 'package:xray_flutter/domain/helper/fmt/trojan_fmt.dart';
import 'package:xray_flutter/domain/helper/fmt/vless_fmt.dart';
import 'package:xray_flutter/domain/helper/fmt/vmess_fmt.dart';

class FmtFact {
  /// Note: ProfileItemData is nessesary to provide id and order
  static Result<ProfileItemData> resolveSharedUri(
    String uri,
    ProfileItemData base,
  ) {
    try {
      if (_matchProtocol(uri, EConfigType.vless)) {
        return VlessFmt().parse(uri, base);
      } else if (_matchProtocol(uri, EConfigType.vmess)) {
        return VmessFmt().parse(uri, base);
      } else if (_matchProtocol(uri, EConfigType.trojan)) {
        return TrojanFmt().parse(uri, base);
      } else if (_matchProtocol(uri, EConfigType.shadowsocks)) {
        return ShadowsocksFmt().parse(uri, base);
      } else if (_matchProtocol(uri, EConfigType.hysteria2)) {
        return Hy2Fact().parse(uri, base);
      }
      return Failure(ValidationError('Unsupported shared URI format'));
    } catch (e) {
      return Failure(UnexpectedError(e));
    }
  }

  static Result<String> buildSharedUri(ProfileItemData data) {
    try {
      switch (data.configType) {
        case EConfigType.vless:
          return Success(VlessFmt().build(data));
        case EConfigType.vmess:
          return Success(VmessFmt().build(data));
        case EConfigType.trojan:
          return Success(TrojanFmt().build(data));
        case EConfigType.shadowsocks:
          return Success(ShadowsocksFmt().build(data));
        case EConfigType.hysteria2:
          return Success(Hy2Fact().build(data));
        default:
          return Failure(ValidationError('Unsupported shared URI format'));
      }
    } catch (e) {
      return Failure(UnexpectedError(e));
    }
  }

  static bool _matchProtocol(String uri, EConfigType type) {
    return GlobalConst.protocolShares[type]!.any(
      (prefix) => uri.startsWith(prefix),
    );
  }

  /// Note: ProfileItemData returned not have id and order set
  /// Support import multiple uri separated by new line, base64 encoded data, or
  /// raw config text
  /// shadowsocks SIP008 temporarily not supported
  static Result<List<ProfileItemData>> resolveImportData(String importData) {
    var dataList = <ProfileItemData>[];
    bool tryParseLines(String s) {
      final lines = s
          .split(RegExp(r'[\r\n]+'))
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
      var added = false;
      for (final line in lines) {
        final result = resolveSharedUri(
          line,
          ProfileItemFactory.createDefault('', 0),
        );
        if (result is Success<ProfileItemData>) {
          dataList.add(result.data);
          added = true;
        }
      }
      return added;
    }

    // first try uri lines
    if (tryParseLines(importData)) {
      return Success(dataList);
    }
    // then try base64 decode
    final decoded = Utils.base64Decode(importData);
    if (decoded != null && tryParseLines(decoded)) {
      return Success(dataList);
    }
    // finally try raw config text
    // json object
    final jsonData = Utils.fromJsonString(importData);
    if (jsonData is Map<String, dynamic>) {
      final remark = jsonData['remarks']?.toString() ?? '';
      final profile = ProfileItemFactory.createDefault('', 0).copyWith(
        configType: EConfigType.custom,
        customConfig: importData,
        remarks: remark,
      );
      return Success([profile]);
    }
    return Failure(ValidationError('Unsupported import data format'));
  }
}
