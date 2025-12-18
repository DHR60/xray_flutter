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
    return RoutingRule4Ray(
      outboundTag: ruleItem.outboundTag,
      ip: Utils.normalizeRulesToList(ruleItem.ip),
      domain: Utils.normalizeRulesToList(ruleItem.domain),
      port: Utils.normalizeRulesToString(ruleItem.port),
      network: Utils.normalizeRulesToString(ruleItem.network),
      protocol: Utils.normalizeRulesToList(ruleItem.protocol),
    );
  }
}