part of 'xray_config_service.dart';

extension XrayConfigInboundService on XrayConfigService {
  List<Inbound4Ray> _genInbounds() {
    // Generate inbound configurations based on profileContext
    // This is a placeholder implementation
    return [
      Inbound4Ray(
        listen: GlobalConst.loopbackAddress,
        port: MultiValueMixed.single(int.parse(profileContext.coreItem?.inboundPort ?? '${GlobalConst.defaultPort}')),
        protocol: 'socks',
        settings: InboundSettings4Ray.socks(
          settings: SocksInboundSettings4Ray(
            auth: 'noauth',
            udp: true,
            userLevel: 8
          ),
        ),
      ),
    ];
  }
}