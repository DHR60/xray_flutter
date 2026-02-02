import 'package:xray_flutter/core/enum/config_type.dart';
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/data/dto/profile_extra_item_dto.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/helper/fmt/fmt_utils.dart';
import 'package:xray_flutter/domain/helper/fmt/fmtable.dart';

class VlessFmt implements Fmtable {
  @override
  Result<ProfileItemData> parse(String uriStr, ProfileItemData base) {
    final uri = Uri.parse(uriStr);

    var data = base.copyWith(
      configType: EConfigType.vless,
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
      final extra = ProfileExtraItemDto(
        flow: FmtUtils.getQueryValue(queryParams, 'flow'),
        vlessEncryption: FmtUtils.getQueryValueOrDefault(
          queryParams,
          'encryption',
          'none',
        ),
      );
      data = data.copyWith(jsonData: Utils.toJsonString(extra.toJson()));
    }

    return Success(data);
  }

  @override
  String build(ProfileItemData data) {
    final extra = ProfileExtraItemDto.fromString(data.jsonData);
    var queryParams = <String, String>{};
    queryParams = FmtUtils.toQueryParams(data);
    if (extra.flow?.isNotEmpty == true) {
      queryParams['flow'] = extra.flow!;
    }
    if (extra.vlessEncryption?.isNotEmpty == true) {
      queryParams['encryption'] = extra.vlessEncryption!;
    } else {
      queryParams['encryption'] = 'none';
    }
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
      EConfigType.vless,
      authority,
      queryParams,
      data.remarks,
    );
  }
}
