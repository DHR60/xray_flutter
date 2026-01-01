part of 'xray_config_service.dart';

extension XrayConfigDnsService on XrayConfigService {
  Dns4Ray _genDns() {
    return Dns4Ray(
      hosts: _genHosts().map(
        (key, value) => MapEntry(key, MultiValueString.multi(value)),
      ),
      servers: _genDnsServers(),
      serveStale: profileContext.coreItem?.dns.serveStale == true,
      enableParallelQuery: profileContext.coreItem?.dns.parallelQuery == true,
    );
  }

  FakeDns4Ray? _genFakeDns() {
    if (profileContext.coreItem?.dns.enableFakeDns != true) {
      return null;
    }
    return FakeDns4Ray(ipPool: "198.18.0.0/15", poolSize: 65535);
  }

  Map<String, List<String>> _genHosts() {
    final hosts = GlobalConst.commonDnsHosts;
    var additionalHosts =
        profileContext.coreItem?.dns.additionalHosts.trim() ?? '';
    if (additionalHosts.isEmpty) {
      return hosts;
    }
    for (var line in additionalHosts.split('\n')) {
      line = line.trim();
      if (line.isEmpty) continue;
      final parts = line.split(RegExp(r'\s+'));
      if (parts.length < 2) continue;
      final domain = parts[0];
      final ips = parts.sublist(1);
      hosts.putIfAbsent(domain, () => []);
      hosts[domain]!.addAll(ips);
    }
    return hosts;
  }

  List<DnsServer4Ray> _genDnsServers() {
    var localDns = _normalizeDnsServers(
      profileContext.coreItem?.dns.localDns ?? GlobalConst.defaultLocalDns,
    );
    var remoteDns = _normalizeDnsServers(
      profileContext.coreItem?.dns.remoteDns ?? GlobalConst.defaultRemoteDns,
    );

    final rules = profileContext.routingItem?.rules ?? [];
    final directDomains = <String>[];
    final proxyDomains = <String>[];
    final directGeosites = <String>[];
    final proxyGeosites = <String>[];
    for (var rule in rules) {
      // if (rule.ruleType == ERuleType.route) continue;
      if (rule.domain.isEmpty) continue;
      if (rule.outboundTag == GlobalConst.directTag) {
        if (rule.domain.startsWith('geosite:') ||
            rule.domain.startsWith('ext:')) {
          directGeosites.add(rule.domain);
        } else {
          directDomains.add(rule.domain);
        }
      } else if (rule.outboundTag == GlobalConst.proxyTag) {
        if (rule.domain.startsWith('geosite:') ||
            rule.domain.startsWith('ext:')) {
          proxyGeosites.add(rule.domain);
        } else {
          proxyDomains.add(rule.domain);
        }
      }
    }

    final dnsServers = <DnsServer4Ray>[];
    if (profileContext.coreItem?.dns.enableFakeDns == true) {
      dnsServers.add(
        _genDnsServerObject(
          'fakedns',
          (proxyDomains + proxyGeosites + directDomains + directGeosites)
              .toSet()
              .toList(),
        ).map((e) => DnsServer4Ray.object(e)),
      );
    }
    dnsServers.addAll(
      _genDnsServerObjects(
        remoteDns,
        proxyDomains,
      ).map((e) => DnsServer4Ray.object(e.copyWith(skipFallback: true))),
    );
    dnsServers.addAll(
      _genDnsServerObjects(
        localDns,
        directDomains,
      ).map((e) => DnsServer4Ray.object(e.copyWith(skipFallback: true))),
    );
    dnsServers.addAll(
      _genDnsServerObjects(
        remoteDns,
        proxyGeosites,
      ).map((e) => DnsServer4Ray.object(e.copyWith(skipFallback: true))),
    );
    dnsServers.addAll(
      _genDnsServerObjects(
        localDns,
        directGeosites,
      ).map((e) => DnsServer4Ray.object(e.copyWith(skipFallback: true))),
    );
    // add fallback dns
    dnsServers.addAll(
      remoteDns
          .map((e) => _genDnsServerObject(e, []))
          .map((e) => DnsServer4Ray.object(e)),
    );
    return dnsServers;
  }

  static List<String> _normalizeDnsServers(String dnsString) {
    return dnsString
        .split(dnsString.contains(',') ? ',' : ';')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .map((e) => e.toLowerCase().startsWith('dhcp') ? 'localhost' : e)
        .toSet()
        .toList();
  }

  static DnsServerObject4Ray _genDnsServerObject(
    String address,
    List<String> matchDomains,
  ) {
    if (address == 'fakedns') {
      return DnsServerObject4Ray(
        address: 'fakedns',
        domains: matchDomains.isEmpty ? null : matchDomains,
      );
    }

    Uri uri;
    try {
      if (address.contains('://')) {
        uri = Uri.parse(address);
      } else {
        uri = Uri.parse('udp://$address');
      }
    } catch (e) {
      return DnsServerObject4Ray(
        address: address,
        domains: matchDomains.isEmpty ? null : matchDomains,
      );
    }

    String finalAddress;
    int? finalPort;

    if (uri.scheme == 'udp') {
      finalAddress = uri.host;
      finalPort = uri.hasPort ? uri.port : 53;
    } else if (uri.scheme == 'tcp') {
      var host = uri.host;
      if (host.contains(':')) {
        host = '[$host]';
      }
      finalAddress = 'tcp://$host';
      finalPort = uri.hasPort ? uri.port : 53;
    } else {
      finalAddress = address;
      finalPort = null;
    }

    if (finalPort == 53) {
      finalPort = null;
    }

    return DnsServerObject4Ray(
      address: finalAddress,
      port: finalPort,
      domains: matchDomains.isEmpty ? null : matchDomains,
    );
  }

  static List<DnsServerObject4Ray> _genDnsServerObjects(
    List<String> addresses,
    List<String> matchDomains,
  ) {
    if (matchDomains.isEmpty) {
      return [];
    }
    return addresses.map((e) => _genDnsServerObject(e, matchDomains)).toList();
  }
}
