part of 'xray_config_service.dart';

extension XrayConfigDnsService on XrayConfigService {
  Dns4Ray _genDns() {
    return Dns4Ray(servers: [DnsServer4Ray.string('8.8.8.8')]);
  }
}
