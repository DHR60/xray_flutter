import 'package:x_config_gen/xray.dart';
import 'package:xray_flutter/core/enum/transport.dart';
import 'package:xray_flutter/core/global_const.dart';
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/config/rule_item_dto.dart';
import 'package:xray_flutter/data/dto/profile_extra_item_dto.dart';
import 'package:xray_flutter/core/enum/config_type.dart';
import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/model/profile_context.dart';

part 'xray_config_dns_service.dart';
part 'xray_config_inbound_service.dart';
part 'xray_config_outbound_service.dart';
part 'xray_config_routing_service.dart';
part 'xray_config_misc_service.dart';

class XrayConfigService {
  final ProfileContext profileContext;
  XrayConfigService(this.profileContext);

  // mapping profile dto indexId to outbound tags for lookup
  // the purpose is to replace outbound with custom outbound, etc.
  // in the future, we can replace, and keep chain proxy related settings
  late final Map<String, String> indexIdToOutboundTag = {};

  Result<String> genConfig() {
    indexIdToOutboundTag.clear();
    indexIdToOutboundTag[profileContext.profile.id] = GlobalConst.proxyTag;
    if (profileContext.profile.customConfig.isNotEmpty) {
      // check json format
      final customConfigMap = Utils.fromJsonString(
        profileContext.profile.customConfig,
      );
      if (customConfigMap == null) {
        return Failure(UnexpectedError('自定义配置 JSON 格式错误'));
      }
      // simple check empty, here we just check inbounds key existence
      if (!customConfigMap.containsKey('inbounds')) {
        return Failure(UnexpectedError('自定义配置不正确'));
      }
      return Success(profileContext.profile.customConfig);
    }
    final config = XrayConfig(
      log: _genLog(),
      dns: _genDns(),
      fakeDns: _genFakeDns(),
      inbounds: _genInbounds(),
      outbounds: _genOutbounds(),
      routing: _genRouting(),
      policy: _genPolicy(),
      stats: _genStats(),
    );
    final configMap = config.toJson();
    if (profileContext.profile.customOutbound.isNotEmpty) {
      final customOutbound = Utils.fromJsonString(
        profileContext.profile.customOutbound,
      );
      if (customOutbound == null) {
        return Failure(UnexpectedError('自定义出站 JSON 格式错误'));
      }
      final outbounds = configMap['outbounds'];
      if (outbounds is List && outbounds.isNotEmpty) {
        final tagToReplace = indexIdToOutboundTag[profileContext.profile.id];
        // ensure custom outbound carries the tag
        customOutbound['tag'] = tagToReplace;

        var replaced = false;
        for (var i = 0; i < outbounds.length; i++) {
          final outbound = outbounds[i];
          if (outbound is Map<String, dynamic> &&
              outbound['tag'] == tagToReplace) {
            outbounds[i] = customOutbound;
            replaced = true;
            break;
          }
        }
        if (!replaced) {
          outbounds.add(customOutbound);
        }
      }
    }
    return Success(Utils.toJsonString(configMap));
  }
}
