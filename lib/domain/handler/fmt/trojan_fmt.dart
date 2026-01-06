import 'package:xray_flutter/core/enum/config_type.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/handler/fmt/fmt_utils.dart';
import 'package:xray_flutter/domain/handler/fmt/fmtable.dart';

class TrojanFmt implements Fmtable {
  @override
  Result<ProfileItemData> parse(String uriStr, ProfileItemData base) {
    final uri = Uri.parse(uriStr);

    var data = base.copyWith(
      address: FmtUtils.tryIDNEncode(uri.host) ?? uri.host,
      port: uri.port,
      remarks: FmtUtils.urlDecode(uri.fragment),
      id: FmtUtils.urlDecode(uri.userInfo),
    );

    final queryParams = FmtUtils.parseQueryParams(uriStr);
    if (queryParams != null) {
      data = FmtUtils.resolveFromQueryParams(queryParams, data);
      // resolve allowInsecure for compatibility
      final allowInsecure = FmtUtils.getQueryValue(
        queryParams,
        'allowInsecure',
      );
      if (allowInsecure == '1' || allowInsecure == 'true') {
        data = data.copyWith(allowInsecure: 'true');
      }
    }

    return Success(data);
  }

  @override
  String build(ProfileItemData data) {
    var queryParams = <String, String>{};
    queryParams = FmtUtils.toQueryParams(data);
    // add allowInsecure for compatibility
    if (data.allowInsecure == 'true') {
      queryParams['allowInsecure'] = '1';
    }
    final authority = FmtUtils.buildAuthority(
      FmtUtils.urlEncode(data.id),
      data.address,
      data.port,
    );
    return FmtUtils.buildUri(
      EConfigType.trojan,
      authority,
      queryParams,
      data.remarks,
    );
  }
}
