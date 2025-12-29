import 'package:xray_flutter/core/enum/config_type.dart';
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/data/dto/profile_extra_item_dto.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/handler/fmt/fmt_utils.dart';
import 'package:xray_flutter/domain/handler/fmt/fmtable.dart';

class VlessFmt implements Fmtable {
  @override
  Result<ProfileItemData> parse(String uriStr, ProfileItemData base) {
    final uri = Uri.parse(uriStr);

    var data = base.copyWith(
      address: FmtUtils.tryIDNEncode(uri.host) ?? uri.host,
      port: uri.port,
      remarks: uri.fragment,
      id: FmtUtils.urlDecode(uri.userInfo),
    );

    final queryParams = FmtUtils.parseQueryParams(uriStr);
    if (queryParams != null) {
      data = FmtUtils.resolveFromQueryParams(queryParams, data);
      final extra = ProfileExtraItemDto(
        flow: FmtUtils.getQueryValue(queryParams, 'flow'),
        vlessEncryption: FmtUtils.getQueryValue(queryParams, 'encryption'),
      );
      data = data.copyWith(
        streamSecurity: FmtUtils.getQueryValue(queryParams, 'security'),
        jsonData: Utils.toJsonString(extra.toJson()),
      );
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
    }
    // add allowInsecure for compatibility
    if (data.allowInsecure == 'true') {
      queryParams['allowInsecure'] = 'true';
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
