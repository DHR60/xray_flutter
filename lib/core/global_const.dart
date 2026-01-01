import 'package:xray_flutter/core/enum/config_type.dart';
import 'package:xray_flutter/core/enum/transport.dart';

class GlobalConst {
  static const String appName = "MyFlutterApp";
  static const String customAppFontFamily = "MI_Sans_Regular";

  static const String loopbackAddress = "127.0.0.1";
  static const String publicAddress = "0.0.0.0";
  static const int defaultPort = 10808;
  static const String proxyTag = "proxy";
  static const String directTag = "direct";
  static const String blockTag = "block";

  static const List<String> ruleOutTags = [proxyTag, directTag, blockTag];
  static const String configFileName = "config.json";

  static const String defaultRemoteDns = "https://dns.google/dns-query";
  static const String defaultLocalDns = "https://dns.alidns.com/dns-query";

  static const Map<String, List<String>> commonDnsHosts = {
    "dns.google": [
      "8.8.8.8",
      "8.8.4.4",
      "2001:4860:4860::8888",
      "2001:4860:4860::8844",
    ],
    "dns.alidns.com": [
      "223.5.5.5",
      "223.6.6.6",
      "2400:3200::1",
      "2400:3200:baba::1",
    ],
    "one.one.one.one": [
      "1.1.1.1",
      "1.0.0.1",
      "2606:4700:4700::1111",
      "2606:4700:4700::1001",
    ],
    "1dot1dot1dot1.cloudflare-dns.com": [
      "1.1.1.1",
      "1.0.0.1",
      "2606:4700:4700::1111",
      "2606:4700:4700::1001",
    ],
    "cloudflare-dns.com": [
      "104.16.249.249",
      "104.16.248.249",
      "2606:4700::6810:f8f9",
      "2606:4700::6810:f9f9",
    ],
    "dns.cloudflare.com": [
      "104.16.132.229",
      "104.16.133.229",
      "2606:4700::6810:84e5",
      "2606:4700::6810:85e5",
    ],
    "dot.pub": ["1.12.12.12", "120.53.53.53"],
    "doh.pub": ["1.12.12.12", "120.53.53.53"],
    "dns.quad9.net": [
      "9.9.9.9",
      "149.112.112.112",
      "2620:fe::fe",
      "2620:fe::9",
    ],
    "dns.yandex.net": [
      "77.88.8.8",
      "77.88.8.1",
      "2a02:6b8::feed:0ff",
      "2a02:6b8:0:1::feed:0ff",
    ],
    "dns.sb": ["185.222.222.222", "2a09::"],
    "dns.umbrella.com": [
      "208.67.220.220",
      "208.67.222.222",
      "2620:119:35::35",
      "2620:119:53::53",
    ],
    "dns.sse.cisco.com": [
      "208.67.220.220",
      "208.67.222.222",
      "2620:119:35::35",
      "2620:119:53::53",
    ],
    "engage.cloudflareclient.com": ["162.159.192.1"],
  };

  static const Map<String, ETransport> transportMap = {
    "raw": ETransport.raw,
    "tcp": ETransport.raw,
    "xhttp": ETransport.xhttp,
    "grpc": ETransport.grpc,
    "ws": ETransport.ws,
    "httpupgrade": ETransport.httpupgrade,
    "kcp": ETransport.kcp,
  };

  static const List<String> rawTypes = ["none", "http"];

  static const List<String> xhttpTypes = [
    "auto",
    "packet-up",
    "stream-up",
    "stream-one",
  ];

  static const List<String> grpcTypes = ["gun", "mutli"];

  static const List<String> noneTypes = ["none"];

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

  static const List<String> allowInsecureList = ["", "false", "true"];

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
    "Custom": EConfigType.custom,
    "Policy Group": EConfigType.policyGroup,
    "Proxy Chain": EConfigType.proxyChain,
  };

  static const Map<EConfigType, String> configTypeNameMap = {
    EConfigType.vless: "VLESS",
    EConfigType.vmess: "VMess",
    EConfigType.shadowsocks: "Shadowsocks",
    EConfigType.trojan: "Trojan",
    EConfigType.wireguard: "WireGuard",
    EConfigType.socks: "SOCKS",
    EConfigType.http: "HTTP",
    EConfigType.custom: "Custom",
    EConfigType.policyGroup: "Policy Group",
    EConfigType.proxyChain: "Proxy Chain",
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
