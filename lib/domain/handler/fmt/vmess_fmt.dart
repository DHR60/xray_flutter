import 'package:xray_flutter/core/enum/config_type.dart';
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/data/dto/profile_extra_item_dto.dart';
import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/handler/fmt/fmt_utils.dart';
import 'package:xray_flutter/domain/handler/fmt/fmtable.dart';
import 'package:xray_flutter/domain/handler/fmt/model/vmess_share_dto.dart';

class VmessFmt implements Fmtable {
  @override
  Result<ProfileItemData> parse(String uriStr, ProfileItemData base) {
    if (uriStr.contains('@')) {
      return _parseUriStandard(uriStr, base);
    } else {
      return _parseBase64Json(uriStr, base);
    }
  }

  @override
  String build(ProfileItemData data) {
    // use base64 json format for vmess
    final extra = ProfileExtraItemDto.fromString(data.jsonData);
    final vmessShareDto = VmessShareDto(
      v: '2',
      ps: data.remarks,
      add: data.address,
      port: data.port.toString(),
      id: data.id,
      scy: data.security.isNotEmpty == true ? data.security : 'auto',
      net: data.network.isNotEmpty == true ? data.network : 'tcp',
      type: data.headerType,
      host: data.requestHost,
      path: data.path,
      tls: data.streamSecurity,
      sni: data.sni,
      fp: data.fingerprint,
      alpn: data.alpn,
      aid: extra.alterId,
    );
    final jsonStr = Utils.toJsonString(vmessShareDto.toJson());
    final base64Str = Utils.base64Encode(jsonStr);
    return 'vmess://$base64Str';
  }

  // defined in RFC 3986 and xray community
  // see: https://github.com/XTLS/Xray-core/discussions/716
  Result<ProfileItemData> _parseUriStandard(
    String uriStr,
    ProfileItemData base,
  ) {
    final uri = Uri.parse(uriStr);

    var data = base.copyWith(
      configType: EConfigType.vmess,
      address: FmtUtils.tryIDNEncode(uri.host) ?? uri.host,
      port: uri.port,
      remarks: uri.fragment,
      id: FmtUtils.urlDecode(uri.userInfo),
    );

    final queryParams = FmtUtils.parseQueryParams(uriStr);
    if (queryParams != null) {
      data = FmtUtils.resolveFromQueryParams(queryParams, data);
      final extra = ProfileExtraItemDto(
        alterId: FmtUtils.getQueryValue(queryParams, 'alterId'),
      );
      data = data.copyWith(
        security: FmtUtils.getQueryValue(queryParams, 'encryption'),
        jsonData: Utils.toJsonString(extra.toJson()),
      );
    }

    return Success(data);
  }

  // created by v2rayN etc.
  Result<ProfileItemData> _parseBase64Json(
    String uriStr,
    ProfileItemData base,
  ) {
    final base64Str = FmtUtils.parseHierPart(uriStr);
    final decodedStr = Utils.base64Decode(base64Str) ?? '{}';
    final jsonMap = Utils.fromJsonString(decodedStr) ?? {};
    final vmessShareDto = VmessShareDto.fromJson(jsonMap);
    if (vmessShareDto.add == null) {
      return Failure(ParseError('无法解析 vmess 共享链接'));
    }

    final extra = ProfileExtraItemDto.fromJson(
      jsonMap,
    ).copyWith(alterId: vmessShareDto.aid?.toString());

    var data = base.copyWith(
      configType: EConfigType.vmess,
      address: FmtUtils.tryIDNEncode(vmessShareDto.add!) ?? vmessShareDto.add!,
      port: int.tryParse(vmessShareDto.port ?? '') ?? 0,
      remarks: vmessShareDto.ps ?? '',
      id: vmessShareDto.id ?? '',
      security: vmessShareDto.scy ?? 'auto',
      network: vmessShareDto.net ?? 'tcp',
      headerType: vmessShareDto.type,
      requestHost: vmessShareDto.host,
      path: vmessShareDto.path,
      streamSecurity: vmessShareDto.tls,
      sni: vmessShareDto.sni,
      fingerprint: vmessShareDto.fp,
      alpn: vmessShareDto.alpn,
      jsonData: Utils.toJsonString(extra.toJson()),
    );

    return Success(data);
  }
}
