part of 'xray_config_service.dart';

extension XrayConfigMiscService on XrayConfigService {
  Log4Ray _genLog() {
    return Log4Ray(loglevel: 'warning');
  }

  Stats4Ray _genStats() {
    return Stats4Ray();
  }

  Policy4Ray _genPolicy() {
    return Policy4Ray(
      levels: PolicyLevels4Ray(
        levels: {
          '8': PolicyLevelObject4Ray(
            connIdle: 300,
            downlinkOnly: 1,
            handshake: 4,
            uplinkOnly: 1,
          ),
        },
      ),
      system: PolicySystem4Ray(
        statsOutboundDownlink: true,
        statsOutboundUplink: true,
      ),
    );
  }
}
