import 'package:xray_flutter/core/enum/config_type.dart';
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/handler/fmt/fmt_utils.dart';
import 'package:xray_flutter/domain/handler/fmt/fmtable.dart';

class ShadowsocksFmt implements Fmtable {
  @override
  Result<ProfileItemData> parse(String uriStr, ProfileItemData base) {
    if (uriStr.contains('@')) {
      return _parseSip002(uriStr, base);
    } else {
      return _parseLegacyBase64(uriStr, base);
    }
  }

  @override
  String build(ProfileItemData data) {
    final userInfo = Utils.base64EncodeUrlSafe('${data.security}:${data.id}').replaceAll('=', '');
    final authority = FmtUtils.buildAuthority(userInfo, data.address, data.port);

    // 构建插件参数
    final pluginParts = <String>[];

    // obfs-local 插件
    if (data.network == 'raw' && data.headerType == 'http') {
      pluginParts.add('obfs-local');
      pluginParts.add('obfs=http');
      if (data.requestHost.isNotEmpty) {
        pluginParts.add('obfs-host=${data.requestHost}');
      }
    }
    // v2ray-plugin 插件
    else if (data.network == 'ws' || data.network == 'quic') {
      pluginParts.add('v2ray-plugin');
      if (data.network == 'ws') {
        pluginParts.add('mode=websocket');
        if (data.requestHost.isNotEmpty) {
          pluginParts.add('host=${data.requestHost}');
        }
        if (data.path.isNotEmpty) {
          final escapedPath = data.path
              .replaceAll(r'\', r'\\')
              .replaceAll(',', r'\,')
              .replaceAll('=', r'\=');
          pluginParts.add('path=$escapedPath');
        }
      } else if (data.network == 'quic') {
        pluginParts.add('mode=quic');
      }

      if (data.streamSecurity == 'tls') {
        pluginParts.add('tls');
        if (data.cert.isNotEmpty) {
          var certBase64 = data.cert
              .replaceAll('-----BEGIN CERTIFICATE-----', '')
              .replaceAll('-----END CERTIFICATE-----', '')
              .replaceAll('\n', '')
              .trim();
          certBase64 = certBase64.replaceAll('=', r'\=');
          pluginParts.add('certRaw=$certBase64');
        }

        pluginParts.add('mux=0');
      }
    }

    final query = <String, String>{};
    if (pluginParts.isNotEmpty) {
      query['plugin'] = FmtUtils.urlEncode(pluginParts.join(';'));
    }

    final queryString = FmtUtils.buildQuery(query);

    // The last '/' should be appended if plugin is present
    // like: ss://YmYtY2ZiOnRlc3Q@192.168.100.1:8888/?plugin=
    final baseUri =
        pluginParts.isNotEmpty
            ? 'ss://$authority/${queryString.isNotEmpty ? '?$queryString' : ''}'
            : 'ss://$authority${queryString.isNotEmpty ? '?$queryString' : ''}';

    if (data.remarks.isNotEmpty) {
      return '$baseUri#${FmtUtils.urlEncode(data.remarks)}';
    }
    return baseUri;
  }

  // Legacy base64
  // like: ss://BASE64(method:password@server:port)[#备注]
  Result<ProfileItemData> _parseLegacyBase64(
    String uriStr,
    ProfileItemData base,
  ) {
    final hierPart = FmtUtils.parseHierPart(uriStr);
    final parts = hierPart.split('#');
    final base64Str = parts.first;
    final remarks = parts.length > 1 ? FmtUtils.urlDecode(parts.last) : '';

    final decodedStr = Utils.base64Decode(base64Str);
    final match = RegExp(
      r'^(.+?):(.+)@(.+):(\d+)$',
    ).firstMatch(decodedStr ?? '');
    if (match == null) {
      return Failure(ParseError('无法解析 shadowsocks 共享链接'));
    }

    final server = match.group(3)!;
    return Success(
      base.copyWith(
        configType: EConfigType.shadowsocks,
        address: FmtUtils.tryIDNEncode(server) ?? server,
        port: int.tryParse(match.group(4)!) ?? 0,
        remarks: remarks,
        security: match.group(1)!,
        id: match.group(2)!,
      ),
    );
  }

  // SIP002
  // like: ss://BASE64(method:password)@server:port[?params][#remarks]
  Result<ProfileItemData> _parseSip002(String uriStr, ProfileItemData base) {
    final parsedUrl = FmtUtils.tryParseUri(uriStr);
    if (parsedUrl == null) {
      return Failure(ParseError('无法解析 shadowsocks SIP002 链接'));
    }

    final remarks = parsedUrl.fragment.isNotEmpty
        ? FmtUtils.urlDecode(parsedUrl.fragment)
        : '';
    final server = FmtUtils.tryIDNEncode(parsedUrl.host) ?? parsedUrl.host;
    final port = parsedUrl.port;

    final rawUserInfo = FmtUtils.urlDecode(parsedUrl.userInfo);
    String security;
    String password;

    Result<ProfileItemData> failure = Failure(
      ParseError('无法解析 shadowsocks 用户信息'),
    );
    if (rawUserInfo.contains(':')) {
      final userInfoParts = rawUserInfo.split(':');
      if (userInfoParts.length < 2) {
        return failure;
      }
      security = userInfoParts.first;
      password = FmtUtils.urlDecode(userInfoParts.sublist(1).join(':'));
    } else {
      var userInfoBase64 = rawUserInfo;
      final remainder = userInfoBase64.length % 4;
      if (remainder > 0) {
        userInfoBase64 += '=' * (4 - remainder);
      }
      final userInfo = Utils.base64DecodeUrlSafe(userInfoBase64);
      if (userInfo == null) {
        return failure;
      }
      final userInfoParts = userInfo.split(':');
      if (userInfoParts.length < 2) {
        return failure;
      }
      security = userInfoParts.first;
      password = userInfoParts.sublist(1).join(':');
    }

    var result = base.copyWith(
      configType: EConfigType.shadowsocks,
      address: server,
      port: port,
      remarks: remarks,
      security: security,
      id: password,
    );

    final queryParams = parsedUrl.queryParameters;
    final plugin = queryParams['plugin'];
    if (plugin != null && plugin.isNotEmpty) {
      final pluginParts = plugin.split(';').where((p) => p.isNotEmpty).toList();
      if (pluginParts.isEmpty) {
        return Failure(ParseError('无效的插件参数'));
      }

      var pluginName = pluginParts.first;
      if (pluginName == 'simple-obfs') {
        pluginName = 'obfs-local';
      }

      if (pluginName == 'obfs-local') {
        final obfsMode = pluginParts.firstWhere(
          (t) => t.startsWith('obfs='),
          orElse: () => '',
        );
        final obfsHost = pluginParts.firstWhere(
          (t) => t.startsWith('obfs-host='),
          orElse: () => '',
        );

        if (obfsMode.isNotEmpty &&
            obfsMode.contains('obfs=http') &&
            obfsHost.isNotEmpty) {
          final host = obfsHost.replaceFirst('obfs-host=', '');
          result = result.copyWith(
            network: 'raw',
            headerType: 'http',
            requestHost: host,
          );
        }
      } else if (pluginName == 'v2ray-plugin') {
        final mode = pluginParts.firstWhere(
          (t) => t.startsWith('mode='),
          orElse: () => 'mode=websocket',
        );
        final host = pluginParts.firstWhere(
          (t) => t.startsWith('host='),
          orElse: () => '',
        );
        final path = pluginParts.firstWhere(
          (t) => t.startsWith('path='),
          orElse: () => '',
        );
        final hasTls = pluginParts.any((t) => t == 'tls');
        final certRaw = pluginParts.firstWhere(
          (t) => t.startsWith('certRaw='),
          orElse: () => '',
        );
        final mux = pluginParts.firstWhere(
          (t) => t.startsWith('mux='),
          orElse: () => '',
        );

        final modeValue = mode.replaceFirst('mode=', '');
        if (modeValue == 'websocket') {
          result = result.copyWith(network: 'ws');
          if (host.isNotEmpty) {
            final hostValue = host.replaceFirst('host=', '');
            result = result.copyWith(requestHost: hostValue, sni: hostValue);
          }
          if (path.isNotEmpty) {
            var pathValue = path.replaceFirst('path=', '');
            pathValue = pathValue
                .replaceAll(r'\=', '=')
                .replaceAll(r'\,', ',')
                .replaceAll(r'\\', r'\');
            result = result.copyWith(path: pathValue);
          }
        } else if (modeValue == 'quic') {
          result = result.copyWith(network: 'quic');
        }

        if (hasTls) {
          result = result.copyWith(streamSecurity: 'tls');
          if (certRaw.isNotEmpty) {
            var certBase64 = certRaw.replaceFirst('certRaw=', '');
            certBase64 = certBase64.replaceAll(r'\=', '=');
            const beginMarker = '-----BEGIN CERTIFICATE-----\n';
            const endMarker = '\n-----END CERTIFICATE-----';
            final certPem = '$beginMarker$certBase64$endMarker';
            result = result.copyWith(cert: certPem);
          }
        }

        if (mux.isNotEmpty) {
          final muxValue = mux.replaceFirst('mux=', '');
          final muxCount = int.tryParse(muxValue) ?? 0;
          if (muxCount > 0) {
            return Failure(ParseError('不支持 mux 配置'));
          }
        }
      }
    }

    return Success(result);
  }
}
