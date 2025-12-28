import 'package:x_config_gen/xray.dart';
import 'package:xray_flutter/core/global_const.dart';
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/config/rule_item_dto.dart';
import 'package:xray_flutter/data/dto/profile_extra_item_dto.dart';
import 'package:xray_flutter/core/enum/config_type.dart';
import 'package:xray_flutter/domain/model/profile_context.dart';

part 'xray_config_dns_service.dart';
part 'xray_config_inbound_service.dart';
part 'xray_config_outbound_service.dart';
part 'xray_config_routing_service.dart';
part 'xray_config_misc_service.dart';

class XrayConfigService {
  final ProfileContext _profileContext;
  XrayConfigService(this._profileContext);

  ProfileContext get profileContext => _profileContext;

  String genConfig() {
    final config = XrayConfig(
      log: _genLog(),
      dns: _genDns(),
      inbounds: _genInbounds(),
      outbounds: _genOutbounds(),
      routing: _genRouting(),
      policy: _genPolicy(),
      stats: _genStats(),
    );
    return Utils.toJsonString(config.toJson());
  }
}
