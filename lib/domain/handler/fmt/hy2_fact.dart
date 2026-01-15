import 'package:xray_flutter/core/enum/config_type.dart';
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/data/dto/profile_extra_item_dto.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/handler/fmt/fmt_utils.dart';
import 'package:xray_flutter/domain/handler/fmt/fmtable.dart';

class Hy2Fact implements Fmtable {
  @override
  Result<ProfileItemData> parse(String uriStr, ProfileItemData base) {
    final uri = Uri.parse(uriStr);

    var data = base.copyWith(
      configType: EConfigType.hysteria2,
      address: FmtUtils.tryIDNEncode(uri.host) ?? uri.host,
      port: uri.port,
      remarks: FmtUtils.urlDecode(uri.fragment),
      id: FmtUtils.urlDecode(uri.userInfo),
    );

    final queryParams = FmtUtils.parseQueryParams(uriStr);
    if (queryParams != null) {
      final certSha256 = FmtUtils.getQueryValueOrDefault(
        queryParams,
        'pinSHA256',
        FmtUtils.getQueryValue(queryParams, 'pcs'),
      );
      final extra = ProfileExtraItemDto(
        hy2HopPorts: FmtUtils.getQueryValue(queryParams, 'mport'),
        hy2HopInterval: FmtUtils.getQueryValue(queryParams, 'mportHopInt'),
        hy2ObfsPass: FmtUtils.getQueryValue(queryParams, 'obfs-password'),
      );
      data = data.copyWith(
        sni: FmtUtils.getQueryValueOrDefault(queryParams, 'sni', data.address),
        allowInsecure: FmtUtils.allowInsecureFromQueryParams(queryParams)
            ? 'true'
            : 'false',
        streamSecurity: 'tls',
        alpn: 'h3',
        certSha256: certSha256.contains('~')
            ? certSha256.split('~').first
            : certSha256,
        jsonData: Utils.toJsonString(extra.toJson()),
      );
    }

    return Success(data);
  }

  @override
  String build(ProfileItemData data) {
    final extra = ProfileExtraItemDto.fromString(data.jsonData);
    var queryParams = <String, String>{};
    if (data.sni.isNotEmpty == true) {
      queryParams['sni'] = data.sni;
    }
    if (data.allowInsecure == 'true') {
      queryParams['insecure'] = '1';
      queryParams['allowInsecure'] = '1';
    }
    if (data.certSha256.isNotEmpty == true) {
      queryParams['pinSHA256'] = data.certSha256.contains('~')
          ? data.certSha256.split('~').first
          : data.certSha256;
    }
    if (extra.hy2HopPorts?.isNotEmpty == true) {
      queryParams['mport'] = extra.hy2HopPorts!;
    }
    if (extra.hy2HopInterval?.isNotEmpty == true) {
      queryParams['mportHopInt'] = extra.hy2HopInterval!;
    }
    if (extra.hy2ObfsPass?.isNotEmpty == true) {
      queryParams['obfs'] = 'salamander';
      queryParams['obfs-password'] = extra.hy2ObfsPass!;
    }
    final authority = FmtUtils.buildAuthority(
      FmtUtils.urlEncode(data.id),
      data.address,
      data.port,
    );
    return FmtUtils.buildUri(
      EConfigType.hysteria2,
      authority,
      queryParams,
      data.remarks,
    );
  }
}
