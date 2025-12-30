import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/config/core_item_dto.dart';
import 'package:xray_flutter/data/config/routing_item_dto.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/model/profile_context.dart';
import 'package:xray_flutter/domain/service/core_config/xray/xray_config_service.dart';

class GetProfileOutboundUseCase {
  GetProfileOutboundUseCase();

  Result<String> call(ProfileItemData profileItemData) {
    // build a simple profile context for outbound preview generation
    final profileContext = ProfileContext(
      profile: profileItemData,
      routingItem: RoutingItemDto(id: 'temp'),
      coreItem: CoreItemDto(),
    );
    final xrayConfigService = XrayConfigService(profileContext);
    final xrayConfigMap = Utils.fromJsonString(xrayConfigService.genConfig());
    if (xrayConfigMap == null) {
      return Failure(UnexpectedError('生成配置失败'));
    }
    final outboundList = xrayConfigMap['outbounds'];
    if (outboundList is! List || outboundList.isEmpty) {
      return Failure(UnexpectedError('配置中未包含出站配置'));
    }
    // Extract other outbounds whose tag is not direct, block
    final filteredOutbounds = outboundList.where((outbound) {
      if (outbound is Map<String, dynamic>) {
        final tag = outbound['tag'];
        return tag != 'direct' && tag != 'block';
      }
      return false;
    }).toList();
    final prettyOutboundJson = Utils.prettyJson(
      Utils.toJsonArrayString(filteredOutbounds),
    );
    if (prettyOutboundJson == null) {
      return Failure(UnexpectedError('生成出站配置失败'));
    }
    return Success(prettyOutboundJson);
  }
}
