part of 'xray_config_service.dart';

extension XrayConfigOutboundService on XrayConfigService {
  List<Outbound4Ray> _genOutbounds() {
    final outbounds = <Outbound4Ray>[];
    switch (_profileContext.profile.configType) {
      case EConfigType.vless:
        outbounds.add(_genVlessOutbound());
        break;
      default:
        throw UnimplementedError(
          'Outbound generation for protocol ${_profileContext.profile.configType} is not implemented.',
        );
    }
    outbounds.addAll(genDefaultOutbounds());
    return outbounds;
  }

  Outbound4Ray _genVlessOutbound() {
    final extra = ProfileExtraItemDto.fromJson(
      Utils.fromJsonString(_profileContext.profile.jsonData),
    );
    return Outbound4Ray(
      protocol: 'vless',
      settings: OutboundSettings4Ray.vless(
        settings: VlessOutboundSettings4Ray(
          address: _profileContext.profile.address,
          port: _profileContext.profile.port,
          id: _profileContext.profile.id,
          flow: extra.flow,
          encryption: extra.vlessEncryption ?? 'none',
          level: 8,
        ),
      ),
      streamSettings: _genStreamSettings(),
    );
  }

  List<Outbound4Ray> genDefaultOutbounds() {
    return [
      Outbound4Ray(protocol: 'freedom'),
      Outbound4Ray(protocol: 'blackhole'),
    ];
  }

  StreamSettings4Ray _genStreamSettings() {
    return StreamSettings4Ray(
      network: _profileContext.profile.network,
      security: _profileContext.profile.streamSecurity,
      tlsSettings: _profileContext.profile.streamSecurity == 'tls'
          ? Tls4Ray(
              serverName: _profileContext.profile.sni,
              allowInsecure:
                  _profileContext.profile.allowInsecure.toLowerCase() == 'true',
            )
          : null,
    );
  }
}
