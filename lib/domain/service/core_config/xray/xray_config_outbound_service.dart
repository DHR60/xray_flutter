part of 'xray_config_service.dart';

extension XrayConfigOutboundService on XrayConfigService {
  List<Outbound4Ray> _genOutbounds() {
    final outbounds = <Outbound4Ray>[];
    outbounds.add(_genProxyOutbound());
    outbounds.addAll(genDefaultOutbounds());
    return outbounds;
  }

  Outbound4Ray _genProxyOutbound() {
    switch (_profileContext.profile.configType) {
      case EConfigType.vless:
        return _genVlessOutbound();
      case EConfigType.vmess:
        return _genVmessOutbound();
      case EConfigType.trojan:
        return _genTrojanOutbound();
      case EConfigType.shadowsocks:
        return _genShadowsocksOutbound();
      case EConfigType.wireguard:
        return _genWireguardOutbound();
      case EConfigType.socks:
        return _genSocksOutbound();
      case EConfigType.http:
        return _genHttpOutbound();
      default:
        throw UnimplementedError(
          'Outbound generation for protocol ${_profileContext.profile.configType} is not implemented.',
        );
    }
  }

  Outbound4Ray _genVlessOutbound() {
    final extra = ProfileExtraItemDto.fromString(
      _profileContext.profile.jsonData,
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

  Outbound4Ray _genVmessOutbound() {
    // final extra = ProfileExtraItemDto.fromString(
    //   _profileContext.profile.jsonData,
    // );
    return Outbound4Ray(
      protocol: 'vmess',
      settings: OutboundSettings4Ray.vmess(
        settings: VmessOutboundSettings4Ray(
          address: _profileContext.profile.address,
          port: _profileContext.profile.port,
          id: _profileContext.profile.id,
          security: _profileContext.profile.security,
          level: 8,
        ),
      ),
      streamSettings: _genStreamSettings(),
    );
  }

  Outbound4Ray _genTrojanOutbound() {
    return Outbound4Ray(
      protocol: 'trojan',
      settings: OutboundSettings4Ray.trojan(
        settings: TrojanOutboundSettings4Ray(
          address: _profileContext.profile.address,
          port: _profileContext.profile.port,
          password: _profileContext.profile.id,
          level: 8,
        ),
      ),
      streamSettings: _genStreamSettings(),
    );
  }

  Outbound4Ray _genShadowsocksOutbound() {
    return Outbound4Ray(
      protocol: 'shadowsocks',
      settings: OutboundSettings4Ray.shadowsocks(
        settings: ShadowsocksOutboundSettings4Ray(
          address: _profileContext.profile.address,
          port: _profileContext.profile.port,
          method: _profileContext.profile.security,
          password: _profileContext.profile.id,
          level: 8,
        ),
      ),
      streamSettings: _genStreamSettings(),
    );
  }

  Outbound4Ray _genWireguardOutbound() {
    final extra = ProfileExtraItemDto.fromString(
      _profileContext.profile.jsonData,
    );
    var address = _profileContext.profile.address;
    if (Utils.isIPv6(address)) {
      address = '[$address]';
    }
    return Outbound4Ray(
      protocol: 'wireguard',
      settings: OutboundSettings4Ray.wireguard(
        settings: WireguardOutboundSettings4Ray(
          secretKey: _profileContext.profile.id,
          address: extra.wireguardLocalAddress?.split(','),
          mtu: extra.wireguardMtu,
          reserved: extra.wireguardReserved
              ?.split(',')
              .map((e) => int.tryParse(e) ?? 0)
              .toList(),
          peers: [
            WireguardOutboundPeer4Ray(
              publicKey: extra.wireguardPublicKey ?? '',
              preSharedKey: extra.wireguardPreSharedKey,
              endpoint: '$address:${_profileContext.profile.port}',
            ),
          ],
        ),
      ),
      streamSettings: _genStreamSettings(),
    );
  }

  Outbound4Ray _genSocksOutbound() {
    return Outbound4Ray(
      protocol: 'socks',
      settings: OutboundSettings4Ray.socks(
        settings: SocksOutboundSettings4Ray(
          address: _profileContext.profile.address,
          port: _profileContext.profile.port,
          user: _profileContext.profile.security,
          pass: _profileContext.profile.id,
          level: 8,
        ),
      ),
      streamSettings: _genStreamSettings(),
    );
  }

  Outbound4Ray _genHttpOutbound() {
    return Outbound4Ray(
      protocol: 'http',
      settings: OutboundSettings4Ray.http(
        settings: HttpOutboundSettings4Ray(
          address: _profileContext.profile.address,
          port: _profileContext.profile.port,
          user: _profileContext.profile.security,
          pass: _profileContext.profile.id,
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
    var streamSettings = StreamSettings4Ray();

    var transportType =
        GlobalConst.transportMap[_profileContext.profile.network] ??
        ETransport.raw;
    var streamSecurity = _profileContext.profile.streamSecurity;

    if (streamSecurity == GlobalConst.transportSecurityTls) {
      final alpnList = _profileContext.profile.alpn
          .split(',')
          .where((e) => e.isNotEmpty)
          .toList();
      streamSettings = streamSettings.copyWith(
        security: 'tls',
        tlsSettings: Tls4Ray(
          serverName: _profileContext.profile.sni.isNotEmpty
              ? _profileContext.profile.sni
              : null,
          allowInsecure: _profileContext.profile.allowInsecure == 'true',
          alpn: alpnList.isNotEmpty ? alpnList : null,
          fingerprint: _profileContext.profile.fingerprint.isNotEmpty
              ? _profileContext.profile.fingerprint
              : null,
        ),
      );
    } else if (streamSecurity == GlobalConst.transportSecurityReality) {
      streamSettings = streamSettings.copyWith(
        security: 'reality',
        realitySettings: Reality4Ray(
          serverName: _profileContext.profile.sni,
          password: _profileContext.profile.publicKey,
          shortId: _profileContext.profile.shortId,
          fingerprint: _profileContext.profile.fingerprint.isNotEmpty
              ? _profileContext.profile.fingerprint
              : null,
          spiderX: _profileContext.profile.spiderX,
          mldsa65Verify: _profileContext.profile.mldsa65Verify,
        ),
      );
    }

    switch (transportType) {
      case ETransport.raw:
        streamSettings = streamSettings.copyWith(
          network: 'raw',
          rawSettings: RawTransport4Ray(),
        );
        break;
      case ETransport.xhttp:
        streamSettings = streamSettings.copyWith(
          network: 'xhttp',
          xhttpSettings: XHttpTransport4Ray(
            host: _profileContext.profile.requestHost,
            path: _profileContext.profile.path,
            mode: _profileContext.profile.headerType,
            extra: XHttpExtra4Ray.fromJson(
              Utils.fromJsonString(_profileContext.profile.xhttpExtra) ?? {},
            ),
          ),
        );
        break;
      case ETransport.grpc:
        streamSettings = streamSettings.copyWith(
          network: 'grpc',
          grpcSettings: GrpcTransport4Ray(
            authority: _profileContext.profile.requestHost,
            serviceName: _profileContext.profile.path,
            multiMode: _profileContext.profile.headerType == 'multi',
          ),
        );
        break;
      case ETransport.ws:
        streamSettings = streamSettings.copyWith(
          network: 'ws',
          wsSettings: WebSocketTransport4Ray(
            host: _profileContext.profile.requestHost,
            path: _profileContext.profile.path,
          ),
        );
        break;
      case ETransport.httpupgrade:
        streamSettings = streamSettings.copyWith(
          network: 'httpupgrade',
          httpupgradeSettings: HttpUpgradeTransport4Ray(
            host: _profileContext.profile.requestHost,
            path: _profileContext.profile.path,
          ),
        );
        break;
      case ETransport.kcp:
        streamSettings = streamSettings.copyWith(
          network: 'kcp',
          kcpSettings: KcpTransport4Ray(
            header: KcpHeader4Ray(
              type: _profileContext.profile.headerType,
              domain: _profileContext.profile.requestHost,
            ),
            seed: _profileContext.profile.path,
          ),
        );
        break;
    }

    return streamSettings;
  }
}
