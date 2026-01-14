part of 'xray_config_service.dart';

extension XrayConfigOutboundService on XrayConfigService {
  List<Outbound4Ray> _genOutbounds() {
    final outbounds = <Outbound4Ray>[];
    outbounds.add(
      _genProxyOutbound().copyWith(
        tag: indexIdToOutboundTag[profileContext.profile.id],
      ),
    );
    outbounds.addAll(genDefaultOutbounds());
    return outbounds;
  }

  Outbound4Ray _genProxyOutbound() {
    switch (profileContext.profile.configType) {
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
      case EConfigType.hysteria2:
        return _genHysteria2Outbound();
      case EConfigType.socks:
        return _genSocksOutbound();
      case EConfigType.http:
        return _genHttpOutbound();
      default:
        return Outbound4Ray();
    }
  }

  Outbound4Ray _genVlessOutbound() {
    final extra = ProfileExtraItemDto.fromString(
      profileContext.profile.jsonData,
    );
    return Outbound4Ray(
      protocol: 'vless',
      settings: OutboundSettings4Ray.vless(
        settings: VlessOutboundSettings4Ray(
          address: profileContext.profile.address,
          port: profileContext.profile.port,
          id: profileContext.profile.id,
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
          address: profileContext.profile.address,
          port: profileContext.profile.port,
          id: profileContext.profile.id,
          security: profileContext.profile.security,
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
          address: profileContext.profile.address,
          port: profileContext.profile.port,
          password: profileContext.profile.id,
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
          address: profileContext.profile.address,
          port: profileContext.profile.port,
          method: profileContext.profile.security,
          password: profileContext.profile.id,
          level: 8,
        ),
      ),
      streamSettings: _genStreamSettings(),
    );
  }

  Outbound4Ray _genWireguardOutbound() {
    final extra = ProfileExtraItemDto.fromString(
      profileContext.profile.jsonData,
    );
    var address = profileContext.profile.address;
    if (Utils.isIPv6(address)) {
      address = '[$address]';
    }
    return Outbound4Ray(
      protocol: 'wireguard',
      settings: OutboundSettings4Ray.wireguard(
        settings: WireguardOutboundSettings4Ray(
          secretKey: profileContext.profile.id,
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
              endpoint: '$address:${profileContext.profile.port}',
            ),
          ],
        ),
      ),
      streamSettings: _genStreamSettings(),
    );
  }

  Outbound4Ray _genHysteria2Outbound() {
    return Outbound4Ray(
      protocol: 'hysteria',
      settings: OutboundSettings4Ray.hysteria(
        settings: HysteriaOutboundSettings4Ray(
          version: 2,
          address: profileContext.profile.address,
          port: profileContext.profile.port,
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
          address: profileContext.profile.address,
          port: profileContext.profile.port,
          user: profileContext.profile.security,
          pass: profileContext.profile.id,
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
          address: profileContext.profile.address,
          port: profileContext.profile.port,
          user: profileContext.profile.security,
          pass: profileContext.profile.id,
          level: 8,
        ),
      ),
      streamSettings: _genStreamSettings(),
    );
  }

  List<Outbound4Ray> genDefaultOutbounds() {
    return [
      Outbound4Ray(protocol: 'freedom', tag: GlobalConst.directTag),
      Outbound4Ray(protocol: 'blackhole', tag: GlobalConst.blockTag),
    ];
  }

  StreamSettings4Ray _genStreamSettings() {
    var streamSettings = StreamSettings4Ray();

    var transportType =
        GlobalConst.transportMap[profileContext.profile.network] ??
        ETransport.raw;
    var streamSecurity = profileContext.profile.streamSecurity;

    if (streamSecurity == GlobalConst.transportSecurityTls) {
      final alpnList = profileContext.profile.alpn
          .split(',')
          .where((e) => e.isNotEmpty)
          .toList();
      streamSettings = streamSettings.copyWith(
        security: 'tls',
        tlsSettings: Tls4Ray(
          serverName: profileContext.profile.sni.isNotEmpty
              ? profileContext.profile.sni
              : null,
          allowInsecure: profileContext.profile.allowInsecure == 'true',
          alpn: alpnList.isNotEmpty ? alpnList : null,
          fingerprint: profileContext.profile.fingerprint.isNotEmpty
              ? profileContext.profile.fingerprint
              : null,
        ),
      );
    } else if (streamSecurity == GlobalConst.transportSecurityReality) {
      streamSettings = streamSettings.copyWith(
        security: 'reality',
        realitySettings: Reality4Ray(
          serverName: profileContext.profile.sni,
          password: profileContext.profile.publicKey,
          shortId: profileContext.profile.shortId,
          fingerprint: profileContext.profile.fingerprint.isNotEmpty
              ? profileContext.profile.fingerprint
              : null,
          spiderX: profileContext.profile.spiderX,
          mldsa65Verify: profileContext.profile.mldsa65Verify,
        ),
      );
    }

    if (profileContext.profile.configType == EConfigType.hysteria2) {
      final extra = ProfileExtraItemDto.fromString(
        profileContext.profile.jsonData,
      );
      streamSettings = streamSettings.copyWith(
        network: 'hysteria',
        hysteriaSettings: HysteriaTransport4Ray(
          version: 2,
          auth: profileContext.profile.id,
          up: extra.hy2Up?.isNotEmpty == true ? extra.hy2Up : null,
          down: extra.hy2Down?.isNotEmpty == true
              ? extra.hy2Down
              : null,
          udphop: extra.hy2HopPorts?.isNotEmpty == true
              ? UdpHop4Ray(
                  port: extra.hy2HopPorts!,
                  interval: extra.hy2HopInterval?.isNotEmpty == true
                      ? extra.hy2HopInterval!
                      : null,
                )
              : null,
        ),
        udpmasks: extra.hy2ObfsPass?.isNotEmpty == true
            ? [
                UdpMask4Ray(
                  type: 'salamander',
                  settings: UdpMaskSettings4Ray(
                    password: extra.hy2ObfsPass!,
                  ),
                ),
              ]
            : null,
      );
      return streamSettings;
    }
    if (profileContext.profile.configType == EConfigType.wireguard) {
      return streamSettings;
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
            host: profileContext.profile.requestHost,
            path: profileContext.profile.path,
            mode: profileContext.profile.headerType,
            extra: XHttpExtra4Ray.fromJson(
              Utils.fromJsonString(profileContext.profile.xhttpExtra) ?? {},
            ),
          ),
        );
        break;
      case ETransport.grpc:
        streamSettings = streamSettings.copyWith(
          network: 'grpc',
          grpcSettings: GrpcTransport4Ray(
            authority: profileContext.profile.requestHost,
            serviceName: profileContext.profile.path,
            multiMode: profileContext.profile.headerType == 'multi',
          ),
        );
        break;
      case ETransport.ws:
        streamSettings = streamSettings.copyWith(
          network: 'ws',
          wsSettings: WebSocketTransport4Ray(
            host: profileContext.profile.requestHost,
            path: profileContext.profile.path,
          ),
        );
        break;
      case ETransport.httpupgrade:
        streamSettings = streamSettings.copyWith(
          network: 'httpupgrade',
          httpupgradeSettings: HttpUpgradeTransport4Ray(
            host: profileContext.profile.requestHost,
            path: profileContext.profile.path,
          ),
        );
        break;
      case ETransport.kcp:
        streamSettings = streamSettings.copyWith(
          network: 'kcp',
          kcpSettings: KcpTransport4Ray(
            header: KcpHeader4Ray(
              type: profileContext.profile.headerType,
              domain: profileContext.profile.requestHost,
            ),
            seed: profileContext.profile.path,
          ),
        );
        break;
    }

    return streamSettings;
  }
}
