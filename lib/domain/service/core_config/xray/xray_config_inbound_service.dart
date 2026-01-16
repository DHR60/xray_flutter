part of 'xray_config_service.dart';

extension XrayConfigInboundService on XrayConfigService {
  List<Inbound4Ray> _genInbounds() {
    // Generate inbound configurations based on profileContext
    // This is a placeholder implementation
    return [
      Inbound4Ray(
        listen: profileContext.coreItem?.inbound.publicListen == true
            ? GlobalConst.publicAddress
            : GlobalConst.loopbackAddress,
        port: MultiValueMixed.single(
          int.parse(
            profileContext.coreItem?.inbound.port ??
                '${GlobalConst.defaultPort}',
          ),
        ),
        protocol: 'socks',
        settings: InboundSettings4Ray.socks(
          settings: SocksInboundSettings4Ray(
            auth: 'noauth',
            udp: true,
            userLevel: 8,
          ),
        ),
        sniffing: Sniff4Ray(
          enabled: profileContext.coreItem?.inbound.sniff ?? true,
          routeOnly:
              !(profileContext.coreItem?.inbound.overrideTarget ?? false),
          destOverride: ['http', 'tls'],
        ),
      ),
      if (Utils.isAndroid()) ...[
        Inbound4Ray(
          protocol: 'tun',
          settings: InboundSettings4Ray.tun(
            settings: TunInboundSettings4Ray(
              name: 'xray0',
              mtu: 1500,
              userLevel: 8,
            ),
          ),
          sniffing: Sniff4Ray(
            enabled: profileContext.coreItem?.inbound.sniff ?? true,
            routeOnly:
                !(profileContext.coreItem?.inbound.overrideTarget ?? false),
            destOverride: ['http', 'tls'],
          ),
        ),
      ],
    ];
  }
}
