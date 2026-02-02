import 'package:punycoder/punycoder.dart';
import 'package:x_config_gen/xray.dart';
import 'package:xray_flutter/core/enum/config_type.dart';
import 'package:xray_flutter/core/enum/transport.dart';
import 'package:xray_flutter/core/global_const.dart';
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/db/app_database.dart';

class FmtUtils {
  // http+h2c://user:pass@host:port/path to
  // user:pass@host:port/path
  static String parseHierPart(String uri) {
    // Find the index of "://"
    int schemeEndIndex = uri.indexOf('://');
    if (schemeEndIndex == -1) {
      // If "://" is not found, return the original URI
      return uri;
    }
    // Extract and return the hierarchical part
    return uri.substring(schemeEndIndex + 3);
  }

  static String urlEncode(String input) {
    return Uri.encodeComponent(input);
  }

  static String urlDecode(String input) {
    return Uri.decodeComponent(input);
  }

  static String buildQuery(Map<String, String> params) {
    return params.entries
        .map((entry) => '${entry.key}=${entry.value}')
        .join('&');
  }

  static String buildAuthority(String userId, String host, int port) {
    String authority = '';
    if (userId.isNotEmpty) {
      authority += '$userId@';
    }
    if (Utils.isIPv6(host)) {
      authority += '[$host]';
    } else {
      authority += host;
    }
    if (port > 0) {
      authority += ':$port';
    }
    return authority;
  }

  static String buildUri(
    EConfigType type,
    String authority,
    Map<String, String> query,
    String remark,
  ) {
    final scheme = GlobalConst.protocolShares[type]!.first.replaceAll(
      '://',
      '',
    ); // Get the scheme without "://"
    final queryString = buildQuery(query);
    final baseUri =
        '$scheme://$authority${queryString.isNotEmpty ? '?$queryString' : ''}';
    if (remark.isNotEmpty) {
      return '$baseUri#${urlEncode(remark)}';
    }
    return baseUri;
  }

  static Uri? tryParseUri(String uri) {
    try {
      return Uri.parse(uri);
    } catch (_) {
      return null;
    }
  }

  static String? tryIDNDecode(String domain) {
    try {
      return PunycodeCodec().decode(domain);
    } catch (_) {
      return null;
    }
  }

  static String? tryIDNEncode(String domain) {
    try {
      return PunycodeCodec().encode(domain);
    } catch (_) {
      return null;
    }
  }

  static Map<String, String>? parseQueryParams(String uri) {
    final parsedUri = tryParseUri(uri);
    if (parsedUri == null) {
      return null;
    }
    return parsedUri.queryParameters;
  }

  static String getQueryValue(Map<String, String>? queryParams, String key) {
    if (queryParams == null || !queryParams.containsKey(key)) {
      return '';
    }
    return queryParams[key]!;
  }

  static String getQueryValueOrDefault(
    Map<String, String>? queryParams,
    String key,
    String defaultValue,
  ) {
    if (queryParams == null || !queryParams.containsKey(key)) {
      return defaultValue;
    }
    return queryParams[key]!;
  }

  static String getQueryDecoded(Map<String, String>? queryParams, String key) {
    final value = getQueryValue(queryParams, key);
    if (value.isEmpty) {
      return '';
    }
    return Uri.decodeComponent(value);
  }

  static Map<String, String> toQueryParams(ProfileItemData data) {
    var query = <String, String>{};
    query.addAll(_transportToQueryParams(data));
    query.addAll(_securityToQueryParams(data));
    return query;
  }

  static Map<String, String> toQueryParamsLite(ProfileItemData data) {
    var query = <String, String>{};
    if (data.sni.isNotEmpty) {
      query['sni'] = data.sni;
    }
    if (data.alpn.isNotEmpty) {
      query['alpn'] = data.alpn;
    }
    if (data.allowInsecure == 'true') {
      query['allowInsecure'] = '1';
      query['insecure'] = '1';
    }
    return query;
  }

  static Map<String, String> _transportToQueryParams(ProfileItemData data) {
    if (!GlobalConst.transportMap.containsKey(data.network)) {
      return {};
    }
    var query = <String, String>{};
    final transportType = GlobalConst.transportMap[data.network]!;
    query['type'] = data.network;
    switch (transportType) {
      case ETransport.raw:
        if (data.headerType.isNotEmpty && data.headerType != 'none') {
          query['headerType'] = data.headerType;
          query['host'] = urlEncode(data.requestHost);
        }
        break;
      case ETransport.xhttp:
        if (data.requestHost.isNotEmpty) {
          query['host'] = urlEncode(data.requestHost);
        }
        if (data.path.isNotEmpty) {
          query['path'] = urlEncode(data.path);
        }
        if (data.headerType.isNotEmpty &&
            GlobalConst.xhttpTypes.contains(data.headerType)) {
          query['headerType'] = data.headerType;
        }
        if (data.xhttpExtra.isNotEmpty) {
          // check json format and remove spaces
          var jsonMap = Utils.fromJsonString(data.xhttpExtra);
          if (jsonMap != null) {
            final xhttpExtra = XHttpExtra4Ray.fromJson(jsonMap);
            final extraJson = xhttpExtra.toJson();
            final extraString = Utils.toJsonString(extraJson);
            if (extraString != '{}') {
              query['extra'] = urlEncode(extraString);
            }
          }
        }
        break;
      case ETransport.ws:
      case ETransport.httpupgrade:
        if (data.requestHost.isNotEmpty) {
          query['host'] = urlEncode(data.requestHost);
        }
        if (data.path.isNotEmpty) {
          query['path'] = urlEncode(data.path);
        }
        break;
      case ETransport.grpc:
        if (data.path.isNotEmpty) {
          query['authority'] = urlEncode(data.requestHost);
          query['serviceName'] = urlEncode(data.path);
          if (data.headerType.isNotEmpty &&
              GlobalConst.grpcTypes.contains(data.headerType)) {
            query['mode'] = urlEncode(data.headerType);
          }
        }
        break;
      case ETransport.kcp:
        if (data.headerType.isNotEmpty &&
            GlobalConst.kcpTypes.contains(data.headerType)) {
          query['headerType'] = data.headerType;
        }
        if (data.path.isNotEmpty) {
          query['seed'] = urlEncode(data.path);
        }
        // kcp dns domain
        if (data.requestHost.isNotEmpty) {
          query['host'] = urlEncode(data.requestHost);
        }
        break;
    }
    return query;
  }

  static Map<String, String> _securityToQueryParams(ProfileItemData data) {
    var query = <String, String>{};
    if (data.security.isNotEmpty) {
      query['security'] = data.security;
      if (data.sni.isNotEmpty) {
        query['sni'] = data.sni;
      }
      if (data.fingerprint.isNotEmpty) {
        query['fp'] = data.fingerprint;
      }
      if (data.security == GlobalConst.transportSecurityTls) {
        if (data.alpn.isNotEmpty &&
            GlobalConst.utlsFingerprintList.contains(data.alpn)) {
          query['alpn'] = data.alpn;
        }
        if (data.allowInsecure == 'true') {
          query['allowInsecure'] = '1';
          query['insecure'] = '1';
        }
      } else if (data.security == GlobalConst.transportSecurityReality) {
        if (data.publicKey.isNotEmpty) {
          query['pbk'] = data.publicKey;
        }
        if (data.shortId.isNotEmpty) {
          query['sid'] = data.shortId;
        }
        if (data.sni.isNotEmpty) {
          query['sni'] = data.sni;
        }
        if (data.spiderX.isNotEmpty) {
          query['spx'] = data.spiderX;
        }
        if (data.mldsa65Verify.isNotEmpty) {
          query['pqv'] = data.mldsa65Verify;
        }
        if (data.certSha256.isNotEmpty) {
          query['pcs'] = data.certSha256;
        }
      }
    }
    return query;
  }

  static ProfileItemData resolveFromQueryParams(
    Map<String, String> queryParams,
    ProfileItemData base,
  ) {
    var data = base;
    data = _resolveTransportParams(queryParams, data);
    data = _resolveSecurityParams(queryParams, data);
    return data;
  }

  static ProfileItemData _resolveTransportParams(
    Map<String, String> queryParams,
    ProfileItemData base,
  ) {
    var data = base.copyWith(network: getQueryValue(queryParams, 'type'));
    final transportType = GlobalConst.transportMap[data.network];
    if (transportType == null) {
      return data.copyWith(network: 'raw');
    }
    switch (transportType) {
      case ETransport.raw:
        data = data.copyWith(
          headerType: getQueryValue(queryParams, 'headerType'),
          requestHost: getQueryDecoded(queryParams, 'host'),
        );
        break;
      case ETransport.xhttp:
        final extraStr = getQueryDecoded(queryParams, 'extra');
        final extraJson = XHttpExtra4Ray.fromJson(
          Utils.fromJsonString(extraStr) ?? {},
        ).toJson();
        final prettyExtraStr = Utils.prettyJson(Utils.toJsonString(extraJson));
        data = data.copyWith(
          requestHost: getQueryDecoded(queryParams, 'host'),
          path: getQueryDecoded(queryParams, 'path'),
          headerType: getQueryValue(queryParams, 'headerType'),
          xhttpExtra: prettyExtraStr == '{}' ? null : prettyExtraStr,
        );
        break;
      case ETransport.ws:
      case ETransport.httpupgrade:
        data = data.copyWith(
          requestHost: getQueryDecoded(queryParams, 'host'),
          path: getQueryDecoded(queryParams, 'path'),
        );
        break;
      case ETransport.grpc:
        data = data.copyWith(
          requestHost: getQueryDecoded(queryParams, 'authority'),
          path: getQueryDecoded(queryParams, 'serviceName'),
          headerType: getQueryDecoded(queryParams, 'mode'),
        );
        break;
      case ETransport.kcp:
        data = data.copyWith(
          headerType: getQueryDecoded(queryParams, 'headerType'),
          path: getQueryDecoded(queryParams, 'seed'),
          requestHost: getQueryDecoded(queryParams, 'host'),
        );
        break;
    }
    return data;
  }

  static ProfileItemData _resolveSecurityParams(
    Map<String, String> queryParams,
    ProfileItemData base,
  ) {
    return base.copyWith(
      streamSecurity: getQueryValue(queryParams, 'security'),
      sni: getQueryValue(queryParams, 'sni'),
      fingerprint: getQueryValue(queryParams, 'fp'),
      alpn: getQueryValue(queryParams, 'alpn'),
      allowInsecure: allowInsecureFromQueryParams(queryParams)
          ? 'true'
          : 'false',
      publicKey: getQueryValue(queryParams, 'pbk'),
      shortId: getQueryValue(queryParams, 'sid'),
      spiderX: getQueryValue(queryParams, 'spx'),
      mldsa65Verify: getQueryValue(queryParams, 'pqv'),
      certSha256: getQueryValue(queryParams, 'pcs'),
    );
  }

  static bool allowInsecureFromQueryParams(Map<String, String>? queryParams) {
    if (queryParams == null) {
      return false;
    }
    final allowInsecure = getQueryValue(queryParams, 'allowInsecure');
    final insecure = getQueryValue(queryParams, 'insecure');
    return allowInsecure == '1' || insecure == '1';
  }
}
