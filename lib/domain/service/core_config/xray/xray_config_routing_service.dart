part of 'xray_config_service.dart';

extension XrayConfigRoutingService on XrayConfigService {
  Routing4Ray _genRouting() {
    // if ip and domain are both non-empty, split into two rules
    final rules = <RoutingRule4Ray>[];

    if (profileContext.routingItem?.rules != null) {
      for (var ruleItem in profileContext.routingItem!.rules) {
        if (!ruleItem.enabled) continue;

        final ip = Utils.normalizeRulesToList(ruleItem.ip);
        final domain = Utils.normalizeRulesToList(ruleItem.domain);

        if (ip.isNotEmpty && domain.isNotEmpty) {
          rules.add(_genRoutingRule(ruleItem.copyWith(domain: '')));
          rules.add(_genRoutingRule(ruleItem.copyWith(ip: '')));
        } else {
          rules.add(_genRoutingRule(ruleItem));
        }
      }
    }

    return Routing4Ray(
      domainStrategy: profileContext.routingItem?.strategy ?? 'AsIs',
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
