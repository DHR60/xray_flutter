part of 'xray_config_service.dart';

extension XrayConfigRoutingService on XrayConfigService {
  Routing4Ray _genRouting() {
    final rules = _profileContext.routingItem?.rules
        .map((ruleItem) => _genRoutingRule(ruleItem))
        .toList();
    return Routing4Ray(
      domainStrategy: _profileContext.routingItem?.strategy ?? 'AsIs',
      rules: rules,
    );
  }

  RoutingRule4Ray _genRoutingRule(RuleItemDto ruleItem) {
    final ip = Utils.normalizeRulesToList(ruleItem.ip);
    final domain = Utils.normalizeRulesToList(ruleItem.domain);
    final port = Utils.normalizeRulesToString(ruleItem.port);
    final network = Utils.normalizeRulesToString(ruleItem.network);
    final protocol = Utils.normalizeRulesToList(ruleItem.protocol);

    return RoutingRule4Ray(
      outboundTag: ruleItem.outboundTag,
      ip: ip.isEmpty ? null : ip,
      domain: domain.isEmpty ? null : domain,
      port: port.isEmpty ? null : port,
      network: network.isEmpty ? null : network,
      protocol: protocol.isEmpty ? null : protocol,
    );
  }
}
