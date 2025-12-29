import 'package:xray_flutter/core/enum/config_type.dart';
import 'package:xray_flutter/core/enum/transport.dart';

class GlobalConst {
  static const String appName = "MyFlutterApp";

  static const String loopbackAddress = "127.0.0.1";
  static const int defaultPort = 10808;
  static const String proxyTag = "proxy";
  static const String directTag = "direct";
  static const String blockTag = "block";

  static const List<String> ruleOutTags = [proxyTag, directTag, blockTag];
  static const String configFileName = "config.json";

  static const Map<String, ETransport> transportMap = {
    "raw": ETransport.raw,
    "tcp": ETransport.raw,
    "xhttp": ETransport.xhttp,
    "grpc": ETransport.grpc,
    "ws": ETransport.ws,
    "httpupgrade": ETransport.httpupgrade,
    "kcp": ETransport.kcp,
  };

  static const List<String> rawTypes = [
    "none",
    "http",
  ];

  static const List<String> xhttpTypes = [
    "auto",
    "packet-up",
    "stream-up",
    "stream-one",
  ];

  static const List<String> grpcTypes = [
    "gun",
    "mutli",
  ];

  static const List<String> noneTypes = [
    "none",
  ];

  static const List<String> kcpTypes = [
    "none",
    "srtp",
    "utp",
    "wechat-video",
    "dtls",
    "wireguard",
    "dns",
  ];

  static const Map<ETransport, List<String>> transportTypeMap = {
    ETransport.raw: rawTypes,
    ETransport.xhttp: xhttpTypes,
    ETransport.grpc: grpcTypes,
    ETransport.ws: noneTypes,
    ETransport.httpupgrade: noneTypes,
    ETransport.kcp: kcpTypes,
  };

  static const String transportSecurityTls = "tls";
  static const String transportSecurityReality = "reality";
  static const List<String> transportSecurityList = [
    "",
    transportSecurityTls,
    transportSecurityReality,
  ];

  static const List<String> alpnList = [
    "",
    "h3",
    "h2",
    "http/1.1",
    "h3,h2",
    "h2,http/1.1",
    "h3,h2,http/1.1",
  ];

  static const List<String> allowInsecureList = [
    "",
    "false",
    "true",
  ];

  static const List<String> utlsFingerprintList = [
    "",
    "chrome",
    "firefox",
    "safari",
    "edge",
    "ios",
    "android",
    "360",
    "qq",
    "random",
    "randomized",
  ];
  
  static const Map<String, EConfigType> configTypeMap = {
    "VLESS": EConfigType.vless,
    "VMess": EConfigType.vmess,
    "Shadowsocks": EConfigType.shadowsocks,
    "Trojan": EConfigType.trojan,
    "WireGuard": EConfigType.wireguard,
    "SOCKS": EConfigType.socks,
    "HTTP": EConfigType.http,
  };

  static const String vlessVisionFlow = "xtls-rprx-vision";
  static const String vlessVisionAllowQuicFlow = "xtls-rprx-vision-udp443";
  static const List<String> vlessFlowList = [
    "",
    vlessVisionFlow,
    vlessVisionAllowQuicFlow,
  ];

  static const List<String> vmessSecurityList = [
    "auto",
    "none",
    "zero",
    "aes-128-gcm",
    "chacha20-poly1305",
  ];

  static const List<String> shadowsocksMethodList = [
    "aes-256-gcm",
    "aes-128-gcm",
    "2022-blake3-aes-128-gcm",
    "2022-blake3-aes-256-gcm",
    "2022-blake3-chacha20-poly1305",
    "chacha20-poly1305",
    "chacha20-ietf-poly1305",
    "xchacha20-poly1305",
    "xchacha20-ietf-poly1305",
    "none",
    "plain",
  ];

  static const Map<EConfigType, List<String>> protocolShares = {
    EConfigType.vless: ['vless://'],
    EConfigType.vmess: ['vmess://'],
    EConfigType.shadowsocks: ['ss://'],
    EConfigType.trojan: ['trojan://'],
    EConfigType.wireguard: ['wireguard://'],
    EConfigType.socks: ['socks://'],
    EConfigType.http: ['http://'],
  };
}
