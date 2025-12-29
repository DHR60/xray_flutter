import 'package:xray_flutter/core/enum/config_type.dart';
import 'package:xray_flutter/core/global_const.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/handler/fmt/vless_fmt.dart';

class FmtFact {
  // ProfileItemData is nessesary to provide id and order
  static Result<ProfileItemData> resolveSharedUri(
    String uri,
    ProfileItemData base,
  ) {
    try {
      if (_matchProtocol(uri, EConfigType.vless)) {
        return VlessFmt().parse(uri, base);
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
}
