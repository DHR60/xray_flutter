// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProfileItemTable extends ProfileItem
    with TableInfo<$ProfileItemTable, ProfileItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfileItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _indexIdMeta = const VerificationMeta(
    'indexId',
  );
  @override
  late final GeneratedColumn<String> indexId = GeneratedColumn<String>(
    'index_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<EConfigType, String> configType =
      GeneratedColumn<String>(
        'config_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        clientDefault: () => 'unknown',
      ).withConverter<EConfigType>($ProfileItemTable.$converterconfigType);
  static const VerificationMeta _configVersionMeta = const VerificationMeta(
    'configVersion',
  );
  @override
  late final GeneratedColumn<int> configVersion = GeneratedColumn<int>(
    'config_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => 0,
  );
  static const VerificationMeta _remarksMeta = const VerificationMeta(
    'remarks',
  );
  @override
  late final GeneratedColumn<String> remarks = GeneratedColumn<String>(
    'remarks',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => 0,
  );
  static const VerificationMeta _subidMeta = const VerificationMeta('subid');
  @override
  late final GeneratedColumn<String> subid = GeneratedColumn<String>(
    'subid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _isSubMeta = const VerificationMeta('isSub');
  @override
  late final GeneratedColumn<bool> isSub = GeneratedColumn<bool>(
    'is_sub',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sub" IN (0, 1))',
    ),
    clientDefault: () => true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _portMeta = const VerificationMeta('port');
  @override
  late final GeneratedColumn<int> port = GeneratedColumn<int>(
    'port',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => 0,
  );
  static const VerificationMeta _portsMeta = const VerificationMeta('ports');
  @override
  late final GeneratedColumn<String> ports = GeneratedColumn<String>(
    'ports',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _securityMeta = const VerificationMeta(
    'security',
  );
  @override
  late final GeneratedColumn<String> security = GeneratedColumn<String>(
    'security',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _networkMeta = const VerificationMeta(
    'network',
  );
  @override
  late final GeneratedColumn<String> network = GeneratedColumn<String>(
    'network',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _headerTypeMeta = const VerificationMeta(
    'headerType',
  );
  @override
  late final GeneratedColumn<String> headerType = GeneratedColumn<String>(
    'header_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _requestHostMeta = const VerificationMeta(
    'requestHost',
  );
  @override
  late final GeneratedColumn<String> requestHost = GeneratedColumn<String>(
    'request_host',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
    'path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _streamSecurityMeta = const VerificationMeta(
    'streamSecurity',
  );
  @override
  late final GeneratedColumn<String> streamSecurity = GeneratedColumn<String>(
    'stream_security',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _allowInsecureMeta = const VerificationMeta(
    'allowInsecure',
  );
  @override
  late final GeneratedColumn<String> allowInsecure = GeneratedColumn<String>(
    'allow_insecure',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _sniMeta = const VerificationMeta('sni');
  @override
  late final GeneratedColumn<String> sni = GeneratedColumn<String>(
    'sni',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _alpnMeta = const VerificationMeta('alpn');
  @override
  late final GeneratedColumn<String> alpn = GeneratedColumn<String>(
    'alpn',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _fingerprintMeta = const VerificationMeta(
    'fingerprint',
  );
  @override
  late final GeneratedColumn<String> fingerprint = GeneratedColumn<String>(
    'fingerprint',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _publicKeyMeta = const VerificationMeta(
    'publicKey',
  );
  @override
  late final GeneratedColumn<String> publicKey = GeneratedColumn<String>(
    'public_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _shortIdMeta = const VerificationMeta(
    'shortId',
  );
  @override
  late final GeneratedColumn<String> shortId = GeneratedColumn<String>(
    'short_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _spiderXMeta = const VerificationMeta(
    'spiderX',
  );
  @override
  late final GeneratedColumn<String> spiderX = GeneratedColumn<String>(
    'spider_x',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _mldsa65VerifyMeta = const VerificationMeta(
    'mldsa65Verify',
  );
  @override
  late final GeneratedColumn<String> mldsa65Verify = GeneratedColumn<String>(
    'mldsa65_verify',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  @override
  late final GeneratedColumnWithTypeConverter<ECoreType?, String> coreType =
      GeneratedColumn<String>(
        'core_type',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<ECoreType?>($ProfileItemTable.$convertercoreTypen);
  static const VerificationMeta _preSocksProxyMeta = const VerificationMeta(
    'preSocksProxy',
  );
  @override
  late final GeneratedColumn<int> preSocksProxy = GeneratedColumn<int>(
    'pre_socks_proxy',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _displayLogMeta = const VerificationMeta(
    'displayLog',
  );
  @override
  late final GeneratedColumn<bool> displayLog = GeneratedColumn<bool>(
    'display_log',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("display_log" IN (0, 1))',
    ),
    clientDefault: () => true,
  );
  static const VerificationMeta _xhttpExtraMeta = const VerificationMeta(
    'xhttpExtra',
  );
  @override
  late final GeneratedColumn<String> xhttpExtra = GeneratedColumn<String>(
    'xhttp_extra',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _certMeta = const VerificationMeta('cert');
  @override
  late final GeneratedColumn<String> cert = GeneratedColumn<String>(
    'cert',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _customConfigMeta = const VerificationMeta(
    'customConfig',
  );
  @override
  late final GeneratedColumn<String> customConfig = GeneratedColumn<String>(
    'custom_config',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _customOutboundMeta = const VerificationMeta(
    'customOutbound',
  );
  @override
  late final GeneratedColumn<String> customOutbound = GeneratedColumn<String>(
    'custom_outbound',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _jsonDataMeta = const VerificationMeta(
    'jsonData',
  );
  @override
  late final GeneratedColumn<String> jsonData = GeneratedColumn<String>(
    'json_data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    indexId,
    configType,
    configVersion,
    remarks,
    orderIndex,
    subid,
    isSub,
    address,
    port,
    ports,
    id,
    security,
    network,
    headerType,
    requestHost,
    path,
    streamSecurity,
    allowInsecure,
    sni,
    alpn,
    fingerprint,
    publicKey,
    shortId,
    spiderX,
    mldsa65Verify,
    coreType,
    preSocksProxy,
    displayLog,
    xhttpExtra,
    cert,
    customConfig,
    customOutbound,
    jsonData,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profile_item';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProfileItemData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('index_id')) {
      context.handle(
        _indexIdMeta,
        indexId.isAcceptableOrUnknown(data['index_id']!, _indexIdMeta),
      );
    } else if (isInserting) {
      context.missing(_indexIdMeta);
    }
    if (data.containsKey('config_version')) {
      context.handle(
        _configVersionMeta,
        configVersion.isAcceptableOrUnknown(
          data['config_version']!,
          _configVersionMeta,
        ),
      );
    }
    if (data.containsKey('remarks')) {
      context.handle(
        _remarksMeta,
        remarks.isAcceptableOrUnknown(data['remarks']!, _remarksMeta),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    }
    if (data.containsKey('subid')) {
      context.handle(
        _subidMeta,
        subid.isAcceptableOrUnknown(data['subid']!, _subidMeta),
      );
    }
    if (data.containsKey('is_sub')) {
      context.handle(
        _isSubMeta,
        isSub.isAcceptableOrUnknown(data['is_sub']!, _isSubMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('port')) {
      context.handle(
        _portMeta,
        port.isAcceptableOrUnknown(data['port']!, _portMeta),
      );
    }
    if (data.containsKey('ports')) {
      context.handle(
        _portsMeta,
        ports.isAcceptableOrUnknown(data['ports']!, _portsMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('security')) {
      context.handle(
        _securityMeta,
        security.isAcceptableOrUnknown(data['security']!, _securityMeta),
      );
    }
    if (data.containsKey('network')) {
      context.handle(
        _networkMeta,
        network.isAcceptableOrUnknown(data['network']!, _networkMeta),
      );
    }
    if (data.containsKey('header_type')) {
      context.handle(
        _headerTypeMeta,
        headerType.isAcceptableOrUnknown(data['header_type']!, _headerTypeMeta),
      );
    }
    if (data.containsKey('request_host')) {
      context.handle(
        _requestHostMeta,
        requestHost.isAcceptableOrUnknown(
          data['request_host']!,
          _requestHostMeta,
        ),
      );
    }
    if (data.containsKey('path')) {
      context.handle(
        _pathMeta,
        path.isAcceptableOrUnknown(data['path']!, _pathMeta),
      );
    }
    if (data.containsKey('stream_security')) {
      context.handle(
        _streamSecurityMeta,
        streamSecurity.isAcceptableOrUnknown(
          data['stream_security']!,
          _streamSecurityMeta,
        ),
      );
    }
    if (data.containsKey('allow_insecure')) {
      context.handle(
        _allowInsecureMeta,
        allowInsecure.isAcceptableOrUnknown(
          data['allow_insecure']!,
          _allowInsecureMeta,
        ),
      );
    }
    if (data.containsKey('sni')) {
      context.handle(
        _sniMeta,
        sni.isAcceptableOrUnknown(data['sni']!, _sniMeta),
      );
    }
    if (data.containsKey('alpn')) {
      context.handle(
        _alpnMeta,
        alpn.isAcceptableOrUnknown(data['alpn']!, _alpnMeta),
      );
    }
    if (data.containsKey('fingerprint')) {
      context.handle(
        _fingerprintMeta,
        fingerprint.isAcceptableOrUnknown(
          data['fingerprint']!,
          _fingerprintMeta,
        ),
      );
    }
    if (data.containsKey('public_key')) {
      context.handle(
        _publicKeyMeta,
        publicKey.isAcceptableOrUnknown(data['public_key']!, _publicKeyMeta),
      );
    }
    if (data.containsKey('short_id')) {
      context.handle(
        _shortIdMeta,
        shortId.isAcceptableOrUnknown(data['short_id']!, _shortIdMeta),
      );
    }
    if (data.containsKey('spider_x')) {
      context.handle(
        _spiderXMeta,
        spiderX.isAcceptableOrUnknown(data['spider_x']!, _spiderXMeta),
      );
    }
    if (data.containsKey('mldsa65_verify')) {
      context.handle(
        _mldsa65VerifyMeta,
        mldsa65Verify.isAcceptableOrUnknown(
          data['mldsa65_verify']!,
          _mldsa65VerifyMeta,
        ),
      );
    }
    if (data.containsKey('pre_socks_proxy')) {
      context.handle(
        _preSocksProxyMeta,
        preSocksProxy.isAcceptableOrUnknown(
          data['pre_socks_proxy']!,
          _preSocksProxyMeta,
        ),
      );
    }
    if (data.containsKey('display_log')) {
      context.handle(
        _displayLogMeta,
        displayLog.isAcceptableOrUnknown(data['display_log']!, _displayLogMeta),
      );
    }
    if (data.containsKey('xhttp_extra')) {
      context.handle(
        _xhttpExtraMeta,
        xhttpExtra.isAcceptableOrUnknown(data['xhttp_extra']!, _xhttpExtraMeta),
      );
    }
    if (data.containsKey('cert')) {
      context.handle(
        _certMeta,
        cert.isAcceptableOrUnknown(data['cert']!, _certMeta),
      );
    }
    if (data.containsKey('custom_config')) {
      context.handle(
        _customConfigMeta,
        customConfig.isAcceptableOrUnknown(
          data['custom_config']!,
          _customConfigMeta,
        ),
      );
    }
    if (data.containsKey('custom_outbound')) {
      context.handle(
        _customOutboundMeta,
        customOutbound.isAcceptableOrUnknown(
          data['custom_outbound']!,
          _customOutboundMeta,
        ),
      );
    }
    if (data.containsKey('json_data')) {
      context.handle(
        _jsonDataMeta,
        jsonData.isAcceptableOrUnknown(data['json_data']!, _jsonDataMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {indexId};
  @override
  ProfileItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProfileItemData(
      indexId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}index_id'],
      )!,
      configType: $ProfileItemTable.$converterconfigType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}config_type'],
        )!,
      ),
      configVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}config_version'],
      )!,
      remarks: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remarks'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      subid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subid'],
      )!,
      isSub: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sub'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      port: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}port'],
      )!,
      ports: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ports'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      security: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}security'],
      )!,
      network: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}network'],
      )!,
      headerType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}header_type'],
      )!,
      requestHost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}request_host'],
      )!,
      path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path'],
      )!,
      streamSecurity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stream_security'],
      )!,
      allowInsecure: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}allow_insecure'],
      )!,
      sni: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sni'],
      )!,
      alpn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alpn'],
      )!,
      fingerprint: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fingerprint'],
      )!,
      publicKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}public_key'],
      )!,
      shortId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}short_id'],
      )!,
      spiderX: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}spider_x'],
      )!,
      mldsa65Verify: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mldsa65_verify'],
      )!,
      coreType: $ProfileItemTable.$convertercoreTypen.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}core_type'],
        ),
      ),
      preSocksProxy: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pre_socks_proxy'],
      ),
      displayLog: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}display_log'],
      )!,
      xhttpExtra: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}xhttp_extra'],
      )!,
      cert: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cert'],
      )!,
      customConfig: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}custom_config'],
      )!,
      customOutbound: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}custom_outbound'],
      )!,
      jsonData: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}json_data'],
      )!,
    );
  }

  @override
  $ProfileItemTable createAlias(String alias) {
    return $ProfileItemTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<EConfigType, String, String> $converterconfigType =
      const EnumNameConverter<EConfigType>(EConfigType.values);
  static JsonTypeConverter2<ECoreType, String, String> $convertercoreType =
      const EnumNameConverter<ECoreType>(ECoreType.values);
  static JsonTypeConverter2<ECoreType?, String?, String?> $convertercoreTypen =
      JsonTypeConverter2.asNullable($convertercoreType);
}

class ProfileItemData extends DataClass implements Insertable<ProfileItemData> {
  final String indexId;
  final EConfigType configType;
  final int configVersion;
  final String remarks;
  final int orderIndex;
  final String subid;
  final bool isSub;
  final String address;
  final int port;
  final String ports;
  final String id;
  final String security;
  final String network;
  final String headerType;
  final String requestHost;
  final String path;
  final String streamSecurity;
  final String allowInsecure;
  final String sni;
  final String alpn;
  final String fingerprint;
  final String publicKey;
  final String shortId;
  final String spiderX;
  final String mldsa65Verify;
  final ECoreType? coreType;
  final int? preSocksProxy;
  final bool displayLog;
  final String xhttpExtra;
  final String cert;
  final String customConfig;
  final String customOutbound;
  final String jsonData;
  const ProfileItemData({
    required this.indexId,
    required this.configType,
    required this.configVersion,
    required this.remarks,
    required this.orderIndex,
    required this.subid,
    required this.isSub,
    required this.address,
    required this.port,
    required this.ports,
    required this.id,
    required this.security,
    required this.network,
    required this.headerType,
    required this.requestHost,
    required this.path,
    required this.streamSecurity,
    required this.allowInsecure,
    required this.sni,
    required this.alpn,
    required this.fingerprint,
    required this.publicKey,
    required this.shortId,
    required this.spiderX,
    required this.mldsa65Verify,
    this.coreType,
    this.preSocksProxy,
    required this.displayLog,
    required this.xhttpExtra,
    required this.cert,
    required this.customConfig,
    required this.customOutbound,
    required this.jsonData,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['index_id'] = Variable<String>(indexId);
    {
      map['config_type'] = Variable<String>(
        $ProfileItemTable.$converterconfigType.toSql(configType),
      );
    }
    map['config_version'] = Variable<int>(configVersion);
    map['remarks'] = Variable<String>(remarks);
    map['order_index'] = Variable<int>(orderIndex);
    map['subid'] = Variable<String>(subid);
    map['is_sub'] = Variable<bool>(isSub);
    map['address'] = Variable<String>(address);
    map['port'] = Variable<int>(port);
    map['ports'] = Variable<String>(ports);
    map['id'] = Variable<String>(id);
    map['security'] = Variable<String>(security);
    map['network'] = Variable<String>(network);
    map['header_type'] = Variable<String>(headerType);
    map['request_host'] = Variable<String>(requestHost);
    map['path'] = Variable<String>(path);
    map['stream_security'] = Variable<String>(streamSecurity);
    map['allow_insecure'] = Variable<String>(allowInsecure);
    map['sni'] = Variable<String>(sni);
    map['alpn'] = Variable<String>(alpn);
    map['fingerprint'] = Variable<String>(fingerprint);
    map['public_key'] = Variable<String>(publicKey);
    map['short_id'] = Variable<String>(shortId);
    map['spider_x'] = Variable<String>(spiderX);
    map['mldsa65_verify'] = Variable<String>(mldsa65Verify);
    if (!nullToAbsent || coreType != null) {
      map['core_type'] = Variable<String>(
        $ProfileItemTable.$convertercoreTypen.toSql(coreType),
      );
    }
    if (!nullToAbsent || preSocksProxy != null) {
      map['pre_socks_proxy'] = Variable<int>(preSocksProxy);
    }
    map['display_log'] = Variable<bool>(displayLog);
    map['xhttp_extra'] = Variable<String>(xhttpExtra);
    map['cert'] = Variable<String>(cert);
    map['custom_config'] = Variable<String>(customConfig);
    map['custom_outbound'] = Variable<String>(customOutbound);
    map['json_data'] = Variable<String>(jsonData);
    return map;
  }

  ProfileItemCompanion toCompanion(bool nullToAbsent) {
    return ProfileItemCompanion(
      indexId: Value(indexId),
      configType: Value(configType),
      configVersion: Value(configVersion),
      remarks: Value(remarks),
      orderIndex: Value(orderIndex),
      subid: Value(subid),
      isSub: Value(isSub),
      address: Value(address),
      port: Value(port),
      ports: Value(ports),
      id: Value(id),
      security: Value(security),
      network: Value(network),
      headerType: Value(headerType),
      requestHost: Value(requestHost),
      path: Value(path),
      streamSecurity: Value(streamSecurity),
      allowInsecure: Value(allowInsecure),
      sni: Value(sni),
      alpn: Value(alpn),
      fingerprint: Value(fingerprint),
      publicKey: Value(publicKey),
      shortId: Value(shortId),
      spiderX: Value(spiderX),
      mldsa65Verify: Value(mldsa65Verify),
      coreType: coreType == null && nullToAbsent
          ? const Value.absent()
          : Value(coreType),
      preSocksProxy: preSocksProxy == null && nullToAbsent
          ? const Value.absent()
          : Value(preSocksProxy),
      displayLog: Value(displayLog),
      xhttpExtra: Value(xhttpExtra),
      cert: Value(cert),
      customConfig: Value(customConfig),
      customOutbound: Value(customOutbound),
      jsonData: Value(jsonData),
    );
  }

  factory ProfileItemData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfileItemData(
      indexId: serializer.fromJson<String>(json['indexId']),
      configType: $ProfileItemTable.$converterconfigType.fromJson(
        serializer.fromJson<String>(json['configType']),
      ),
      configVersion: serializer.fromJson<int>(json['configVersion']),
      remarks: serializer.fromJson<String>(json['remarks']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      subid: serializer.fromJson<String>(json['subid']),
      isSub: serializer.fromJson<bool>(json['isSub']),
      address: serializer.fromJson<String>(json['address']),
      port: serializer.fromJson<int>(json['port']),
      ports: serializer.fromJson<String>(json['ports']),
      id: serializer.fromJson<String>(json['id']),
      security: serializer.fromJson<String>(json['security']),
      network: serializer.fromJson<String>(json['network']),
      headerType: serializer.fromJson<String>(json['headerType']),
      requestHost: serializer.fromJson<String>(json['requestHost']),
      path: serializer.fromJson<String>(json['path']),
      streamSecurity: serializer.fromJson<String>(json['streamSecurity']),
      allowInsecure: serializer.fromJson<String>(json['allowInsecure']),
      sni: serializer.fromJson<String>(json['sni']),
      alpn: serializer.fromJson<String>(json['alpn']),
      fingerprint: serializer.fromJson<String>(json['fingerprint']),
      publicKey: serializer.fromJson<String>(json['publicKey']),
      shortId: serializer.fromJson<String>(json['shortId']),
      spiderX: serializer.fromJson<String>(json['spiderX']),
      mldsa65Verify: serializer.fromJson<String>(json['mldsa65Verify']),
      coreType: $ProfileItemTable.$convertercoreTypen.fromJson(
        serializer.fromJson<String?>(json['coreType']),
      ),
      preSocksProxy: serializer.fromJson<int?>(json['preSocksProxy']),
      displayLog: serializer.fromJson<bool>(json['displayLog']),
      xhttpExtra: serializer.fromJson<String>(json['xhttpExtra']),
      cert: serializer.fromJson<String>(json['cert']),
      customConfig: serializer.fromJson<String>(json['customConfig']),
      customOutbound: serializer.fromJson<String>(json['customOutbound']),
      jsonData: serializer.fromJson<String>(json['jsonData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'indexId': serializer.toJson<String>(indexId),
      'configType': serializer.toJson<String>(
        $ProfileItemTable.$converterconfigType.toJson(configType),
      ),
      'configVersion': serializer.toJson<int>(configVersion),
      'remarks': serializer.toJson<String>(remarks),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'subid': serializer.toJson<String>(subid),
      'isSub': serializer.toJson<bool>(isSub),
      'address': serializer.toJson<String>(address),
      'port': serializer.toJson<int>(port),
      'ports': serializer.toJson<String>(ports),
      'id': serializer.toJson<String>(id),
      'security': serializer.toJson<String>(security),
      'network': serializer.toJson<String>(network),
      'headerType': serializer.toJson<String>(headerType),
      'requestHost': serializer.toJson<String>(requestHost),
      'path': serializer.toJson<String>(path),
      'streamSecurity': serializer.toJson<String>(streamSecurity),
      'allowInsecure': serializer.toJson<String>(allowInsecure),
      'sni': serializer.toJson<String>(sni),
      'alpn': serializer.toJson<String>(alpn),
      'fingerprint': serializer.toJson<String>(fingerprint),
      'publicKey': serializer.toJson<String>(publicKey),
      'shortId': serializer.toJson<String>(shortId),
      'spiderX': serializer.toJson<String>(spiderX),
      'mldsa65Verify': serializer.toJson<String>(mldsa65Verify),
      'coreType': serializer.toJson<String?>(
        $ProfileItemTable.$convertercoreTypen.toJson(coreType),
      ),
      'preSocksProxy': serializer.toJson<int?>(preSocksProxy),
      'displayLog': serializer.toJson<bool>(displayLog),
      'xhttpExtra': serializer.toJson<String>(xhttpExtra),
      'cert': serializer.toJson<String>(cert),
      'customConfig': serializer.toJson<String>(customConfig),
      'customOutbound': serializer.toJson<String>(customOutbound),
      'jsonData': serializer.toJson<String>(jsonData),
    };
  }

  ProfileItemData copyWith({
    String? indexId,
    EConfigType? configType,
    int? configVersion,
    String? remarks,
    int? orderIndex,
    String? subid,
    bool? isSub,
    String? address,
    int? port,
    String? ports,
    String? id,
    String? security,
    String? network,
    String? headerType,
    String? requestHost,
    String? path,
    String? streamSecurity,
    String? allowInsecure,
    String? sni,
    String? alpn,
    String? fingerprint,
    String? publicKey,
    String? shortId,
    String? spiderX,
    String? mldsa65Verify,
    Value<ECoreType?> coreType = const Value.absent(),
    Value<int?> preSocksProxy = const Value.absent(),
    bool? displayLog,
    String? xhttpExtra,
    String? cert,
    String? customConfig,
    String? customOutbound,
    String? jsonData,
  }) => ProfileItemData(
    indexId: indexId ?? this.indexId,
    configType: configType ?? this.configType,
    configVersion: configVersion ?? this.configVersion,
    remarks: remarks ?? this.remarks,
    orderIndex: orderIndex ?? this.orderIndex,
    subid: subid ?? this.subid,
    isSub: isSub ?? this.isSub,
    address: address ?? this.address,
    port: port ?? this.port,
    ports: ports ?? this.ports,
    id: id ?? this.id,
    security: security ?? this.security,
    network: network ?? this.network,
    headerType: headerType ?? this.headerType,
    requestHost: requestHost ?? this.requestHost,
    path: path ?? this.path,
    streamSecurity: streamSecurity ?? this.streamSecurity,
    allowInsecure: allowInsecure ?? this.allowInsecure,
    sni: sni ?? this.sni,
    alpn: alpn ?? this.alpn,
    fingerprint: fingerprint ?? this.fingerprint,
    publicKey: publicKey ?? this.publicKey,
    shortId: shortId ?? this.shortId,
    spiderX: spiderX ?? this.spiderX,
    mldsa65Verify: mldsa65Verify ?? this.mldsa65Verify,
    coreType: coreType.present ? coreType.value : this.coreType,
    preSocksProxy: preSocksProxy.present
        ? preSocksProxy.value
        : this.preSocksProxy,
    displayLog: displayLog ?? this.displayLog,
    xhttpExtra: xhttpExtra ?? this.xhttpExtra,
    cert: cert ?? this.cert,
    customConfig: customConfig ?? this.customConfig,
    customOutbound: customOutbound ?? this.customOutbound,
    jsonData: jsonData ?? this.jsonData,
  );
  ProfileItemData copyWithCompanion(ProfileItemCompanion data) {
    return ProfileItemData(
      indexId: data.indexId.present ? data.indexId.value : this.indexId,
      configType: data.configType.present
          ? data.configType.value
          : this.configType,
      configVersion: data.configVersion.present
          ? data.configVersion.value
          : this.configVersion,
      remarks: data.remarks.present ? data.remarks.value : this.remarks,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      subid: data.subid.present ? data.subid.value : this.subid,
      isSub: data.isSub.present ? data.isSub.value : this.isSub,
      address: data.address.present ? data.address.value : this.address,
      port: data.port.present ? data.port.value : this.port,
      ports: data.ports.present ? data.ports.value : this.ports,
      id: data.id.present ? data.id.value : this.id,
      security: data.security.present ? data.security.value : this.security,
      network: data.network.present ? data.network.value : this.network,
      headerType: data.headerType.present
          ? data.headerType.value
          : this.headerType,
      requestHost: data.requestHost.present
          ? data.requestHost.value
          : this.requestHost,
      path: data.path.present ? data.path.value : this.path,
      streamSecurity: data.streamSecurity.present
          ? data.streamSecurity.value
          : this.streamSecurity,
      allowInsecure: data.allowInsecure.present
          ? data.allowInsecure.value
          : this.allowInsecure,
      sni: data.sni.present ? data.sni.value : this.sni,
      alpn: data.alpn.present ? data.alpn.value : this.alpn,
      fingerprint: data.fingerprint.present
          ? data.fingerprint.value
          : this.fingerprint,
      publicKey: data.publicKey.present ? data.publicKey.value : this.publicKey,
      shortId: data.shortId.present ? data.shortId.value : this.shortId,
      spiderX: data.spiderX.present ? data.spiderX.value : this.spiderX,
      mldsa65Verify: data.mldsa65Verify.present
          ? data.mldsa65Verify.value
          : this.mldsa65Verify,
      coreType: data.coreType.present ? data.coreType.value : this.coreType,
      preSocksProxy: data.preSocksProxy.present
          ? data.preSocksProxy.value
          : this.preSocksProxy,
      displayLog: data.displayLog.present
          ? data.displayLog.value
          : this.displayLog,
      xhttpExtra: data.xhttpExtra.present
          ? data.xhttpExtra.value
          : this.xhttpExtra,
      cert: data.cert.present ? data.cert.value : this.cert,
      customConfig: data.customConfig.present
          ? data.customConfig.value
          : this.customConfig,
      customOutbound: data.customOutbound.present
          ? data.customOutbound.value
          : this.customOutbound,
      jsonData: data.jsonData.present ? data.jsonData.value : this.jsonData,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProfileItemData(')
          ..write('indexId: $indexId, ')
          ..write('configType: $configType, ')
          ..write('configVersion: $configVersion, ')
          ..write('remarks: $remarks, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('subid: $subid, ')
          ..write('isSub: $isSub, ')
          ..write('address: $address, ')
          ..write('port: $port, ')
          ..write('ports: $ports, ')
          ..write('id: $id, ')
          ..write('security: $security, ')
          ..write('network: $network, ')
          ..write('headerType: $headerType, ')
          ..write('requestHost: $requestHost, ')
          ..write('path: $path, ')
          ..write('streamSecurity: $streamSecurity, ')
          ..write('allowInsecure: $allowInsecure, ')
          ..write('sni: $sni, ')
          ..write('alpn: $alpn, ')
          ..write('fingerprint: $fingerprint, ')
          ..write('publicKey: $publicKey, ')
          ..write('shortId: $shortId, ')
          ..write('spiderX: $spiderX, ')
          ..write('mldsa65Verify: $mldsa65Verify, ')
          ..write('coreType: $coreType, ')
          ..write('preSocksProxy: $preSocksProxy, ')
          ..write('displayLog: $displayLog, ')
          ..write('xhttpExtra: $xhttpExtra, ')
          ..write('cert: $cert, ')
          ..write('customConfig: $customConfig, ')
          ..write('customOutbound: $customOutbound, ')
          ..write('jsonData: $jsonData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    indexId,
    configType,
    configVersion,
    remarks,
    orderIndex,
    subid,
    isSub,
    address,
    port,
    ports,
    id,
    security,
    network,
    headerType,
    requestHost,
    path,
    streamSecurity,
    allowInsecure,
    sni,
    alpn,
    fingerprint,
    publicKey,
    shortId,
    spiderX,
    mldsa65Verify,
    coreType,
    preSocksProxy,
    displayLog,
    xhttpExtra,
    cert,
    customConfig,
    customOutbound,
    jsonData,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileItemData &&
          other.indexId == this.indexId &&
          other.configType == this.configType &&
          other.configVersion == this.configVersion &&
          other.remarks == this.remarks &&
          other.orderIndex == this.orderIndex &&
          other.subid == this.subid &&
          other.isSub == this.isSub &&
          other.address == this.address &&
          other.port == this.port &&
          other.ports == this.ports &&
          other.id == this.id &&
          other.security == this.security &&
          other.network == this.network &&
          other.headerType == this.headerType &&
          other.requestHost == this.requestHost &&
          other.path == this.path &&
          other.streamSecurity == this.streamSecurity &&
          other.allowInsecure == this.allowInsecure &&
          other.sni == this.sni &&
          other.alpn == this.alpn &&
          other.fingerprint == this.fingerprint &&
          other.publicKey == this.publicKey &&
          other.shortId == this.shortId &&
          other.spiderX == this.spiderX &&
          other.mldsa65Verify == this.mldsa65Verify &&
          other.coreType == this.coreType &&
          other.preSocksProxy == this.preSocksProxy &&
          other.displayLog == this.displayLog &&
          other.xhttpExtra == this.xhttpExtra &&
          other.cert == this.cert &&
          other.customConfig == this.customConfig &&
          other.customOutbound == this.customOutbound &&
          other.jsonData == this.jsonData);
}

class ProfileItemCompanion extends UpdateCompanion<ProfileItemData> {
  final Value<String> indexId;
  final Value<EConfigType> configType;
  final Value<int> configVersion;
  final Value<String> remarks;
  final Value<int> orderIndex;
  final Value<String> subid;
  final Value<bool> isSub;
  final Value<String> address;
  final Value<int> port;
  final Value<String> ports;
  final Value<String> id;
  final Value<String> security;
  final Value<String> network;
  final Value<String> headerType;
  final Value<String> requestHost;
  final Value<String> path;
  final Value<String> streamSecurity;
  final Value<String> allowInsecure;
  final Value<String> sni;
  final Value<String> alpn;
  final Value<String> fingerprint;
  final Value<String> publicKey;
  final Value<String> shortId;
  final Value<String> spiderX;
  final Value<String> mldsa65Verify;
  final Value<ECoreType?> coreType;
  final Value<int?> preSocksProxy;
  final Value<bool> displayLog;
  final Value<String> xhttpExtra;
  final Value<String> cert;
  final Value<String> customConfig;
  final Value<String> customOutbound;
  final Value<String> jsonData;
  final Value<int> rowid;
  const ProfileItemCompanion({
    this.indexId = const Value.absent(),
    this.configType = const Value.absent(),
    this.configVersion = const Value.absent(),
    this.remarks = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.subid = const Value.absent(),
    this.isSub = const Value.absent(),
    this.address = const Value.absent(),
    this.port = const Value.absent(),
    this.ports = const Value.absent(),
    this.id = const Value.absent(),
    this.security = const Value.absent(),
    this.network = const Value.absent(),
    this.headerType = const Value.absent(),
    this.requestHost = const Value.absent(),
    this.path = const Value.absent(),
    this.streamSecurity = const Value.absent(),
    this.allowInsecure = const Value.absent(),
    this.sni = const Value.absent(),
    this.alpn = const Value.absent(),
    this.fingerprint = const Value.absent(),
    this.publicKey = const Value.absent(),
    this.shortId = const Value.absent(),
    this.spiderX = const Value.absent(),
    this.mldsa65Verify = const Value.absent(),
    this.coreType = const Value.absent(),
    this.preSocksProxy = const Value.absent(),
    this.displayLog = const Value.absent(),
    this.xhttpExtra = const Value.absent(),
    this.cert = const Value.absent(),
    this.customConfig = const Value.absent(),
    this.customOutbound = const Value.absent(),
    this.jsonData = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProfileItemCompanion.insert({
    required String indexId,
    this.configType = const Value.absent(),
    this.configVersion = const Value.absent(),
    this.remarks = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.subid = const Value.absent(),
    this.isSub = const Value.absent(),
    this.address = const Value.absent(),
    this.port = const Value.absent(),
    this.ports = const Value.absent(),
    this.id = const Value.absent(),
    this.security = const Value.absent(),
    this.network = const Value.absent(),
    this.headerType = const Value.absent(),
    this.requestHost = const Value.absent(),
    this.path = const Value.absent(),
    this.streamSecurity = const Value.absent(),
    this.allowInsecure = const Value.absent(),
    this.sni = const Value.absent(),
    this.alpn = const Value.absent(),
    this.fingerprint = const Value.absent(),
    this.publicKey = const Value.absent(),
    this.shortId = const Value.absent(),
    this.spiderX = const Value.absent(),
    this.mldsa65Verify = const Value.absent(),
    this.coreType = const Value.absent(),
    this.preSocksProxy = const Value.absent(),
    this.displayLog = const Value.absent(),
    this.xhttpExtra = const Value.absent(),
    this.cert = const Value.absent(),
    this.customConfig = const Value.absent(),
    this.customOutbound = const Value.absent(),
    this.jsonData = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : indexId = Value(indexId);
  static Insertable<ProfileItemData> custom({
    Expression<String>? indexId,
    Expression<String>? configType,
    Expression<int>? configVersion,
    Expression<String>? remarks,
    Expression<int>? orderIndex,
    Expression<String>? subid,
    Expression<bool>? isSub,
    Expression<String>? address,
    Expression<int>? port,
    Expression<String>? ports,
    Expression<String>? id,
    Expression<String>? security,
    Expression<String>? network,
    Expression<String>? headerType,
    Expression<String>? requestHost,
    Expression<String>? path,
    Expression<String>? streamSecurity,
    Expression<String>? allowInsecure,
    Expression<String>? sni,
    Expression<String>? alpn,
    Expression<String>? fingerprint,
    Expression<String>? publicKey,
    Expression<String>? shortId,
    Expression<String>? spiderX,
    Expression<String>? mldsa65Verify,
    Expression<String>? coreType,
    Expression<int>? preSocksProxy,
    Expression<bool>? displayLog,
    Expression<String>? xhttpExtra,
    Expression<String>? cert,
    Expression<String>? customConfig,
    Expression<String>? customOutbound,
    Expression<String>? jsonData,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (indexId != null) 'index_id': indexId,
      if (configType != null) 'config_type': configType,
      if (configVersion != null) 'config_version': configVersion,
      if (remarks != null) 'remarks': remarks,
      if (orderIndex != null) 'order_index': orderIndex,
      if (subid != null) 'subid': subid,
      if (isSub != null) 'is_sub': isSub,
      if (address != null) 'address': address,
      if (port != null) 'port': port,
      if (ports != null) 'ports': ports,
      if (id != null) 'id': id,
      if (security != null) 'security': security,
      if (network != null) 'network': network,
      if (headerType != null) 'header_type': headerType,
      if (requestHost != null) 'request_host': requestHost,
      if (path != null) 'path': path,
      if (streamSecurity != null) 'stream_security': streamSecurity,
      if (allowInsecure != null) 'allow_insecure': allowInsecure,
      if (sni != null) 'sni': sni,
      if (alpn != null) 'alpn': alpn,
      if (fingerprint != null) 'fingerprint': fingerprint,
      if (publicKey != null) 'public_key': publicKey,
      if (shortId != null) 'short_id': shortId,
      if (spiderX != null) 'spider_x': spiderX,
      if (mldsa65Verify != null) 'mldsa65_verify': mldsa65Verify,
      if (coreType != null) 'core_type': coreType,
      if (preSocksProxy != null) 'pre_socks_proxy': preSocksProxy,
      if (displayLog != null) 'display_log': displayLog,
      if (xhttpExtra != null) 'xhttp_extra': xhttpExtra,
      if (cert != null) 'cert': cert,
      if (customConfig != null) 'custom_config': customConfig,
      if (customOutbound != null) 'custom_outbound': customOutbound,
      if (jsonData != null) 'json_data': jsonData,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProfileItemCompanion copyWith({
    Value<String>? indexId,
    Value<EConfigType>? configType,
    Value<int>? configVersion,
    Value<String>? remarks,
    Value<int>? orderIndex,
    Value<String>? subid,
    Value<bool>? isSub,
    Value<String>? address,
    Value<int>? port,
    Value<String>? ports,
    Value<String>? id,
    Value<String>? security,
    Value<String>? network,
    Value<String>? headerType,
    Value<String>? requestHost,
    Value<String>? path,
    Value<String>? streamSecurity,
    Value<String>? allowInsecure,
    Value<String>? sni,
    Value<String>? alpn,
    Value<String>? fingerprint,
    Value<String>? publicKey,
    Value<String>? shortId,
    Value<String>? spiderX,
    Value<String>? mldsa65Verify,
    Value<ECoreType?>? coreType,
    Value<int?>? preSocksProxy,
    Value<bool>? displayLog,
    Value<String>? xhttpExtra,
    Value<String>? cert,
    Value<String>? customConfig,
    Value<String>? customOutbound,
    Value<String>? jsonData,
    Value<int>? rowid,
  }) {
    return ProfileItemCompanion(
      indexId: indexId ?? this.indexId,
      configType: configType ?? this.configType,
      configVersion: configVersion ?? this.configVersion,
      remarks: remarks ?? this.remarks,
      orderIndex: orderIndex ?? this.orderIndex,
      subid: subid ?? this.subid,
      isSub: isSub ?? this.isSub,
      address: address ?? this.address,
      port: port ?? this.port,
      ports: ports ?? this.ports,
      id: id ?? this.id,
      security: security ?? this.security,
      network: network ?? this.network,
      headerType: headerType ?? this.headerType,
      requestHost: requestHost ?? this.requestHost,
      path: path ?? this.path,
      streamSecurity: streamSecurity ?? this.streamSecurity,
      allowInsecure: allowInsecure ?? this.allowInsecure,
      sni: sni ?? this.sni,
      alpn: alpn ?? this.alpn,
      fingerprint: fingerprint ?? this.fingerprint,
      publicKey: publicKey ?? this.publicKey,
      shortId: shortId ?? this.shortId,
      spiderX: spiderX ?? this.spiderX,
      mldsa65Verify: mldsa65Verify ?? this.mldsa65Verify,
      coreType: coreType ?? this.coreType,
      preSocksProxy: preSocksProxy ?? this.preSocksProxy,
      displayLog: displayLog ?? this.displayLog,
      xhttpExtra: xhttpExtra ?? this.xhttpExtra,
      cert: cert ?? this.cert,
      customConfig: customConfig ?? this.customConfig,
      customOutbound: customOutbound ?? this.customOutbound,
      jsonData: jsonData ?? this.jsonData,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (indexId.present) {
      map['index_id'] = Variable<String>(indexId.value);
    }
    if (configType.present) {
      map['config_type'] = Variable<String>(
        $ProfileItemTable.$converterconfigType.toSql(configType.value),
      );
    }
    if (configVersion.present) {
      map['config_version'] = Variable<int>(configVersion.value);
    }
    if (remarks.present) {
      map['remarks'] = Variable<String>(remarks.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (subid.present) {
      map['subid'] = Variable<String>(subid.value);
    }
    if (isSub.present) {
      map['is_sub'] = Variable<bool>(isSub.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (port.present) {
      map['port'] = Variable<int>(port.value);
    }
    if (ports.present) {
      map['ports'] = Variable<String>(ports.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (security.present) {
      map['security'] = Variable<String>(security.value);
    }
    if (network.present) {
      map['network'] = Variable<String>(network.value);
    }
    if (headerType.present) {
      map['header_type'] = Variable<String>(headerType.value);
    }
    if (requestHost.present) {
      map['request_host'] = Variable<String>(requestHost.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (streamSecurity.present) {
      map['stream_security'] = Variable<String>(streamSecurity.value);
    }
    if (allowInsecure.present) {
      map['allow_insecure'] = Variable<String>(allowInsecure.value);
    }
    if (sni.present) {
      map['sni'] = Variable<String>(sni.value);
    }
    if (alpn.present) {
      map['alpn'] = Variable<String>(alpn.value);
    }
    if (fingerprint.present) {
      map['fingerprint'] = Variable<String>(fingerprint.value);
    }
    if (publicKey.present) {
      map['public_key'] = Variable<String>(publicKey.value);
    }
    if (shortId.present) {
      map['short_id'] = Variable<String>(shortId.value);
    }
    if (spiderX.present) {
      map['spider_x'] = Variable<String>(spiderX.value);
    }
    if (mldsa65Verify.present) {
      map['mldsa65_verify'] = Variable<String>(mldsa65Verify.value);
    }
    if (coreType.present) {
      map['core_type'] = Variable<String>(
        $ProfileItemTable.$convertercoreTypen.toSql(coreType.value),
      );
    }
    if (preSocksProxy.present) {
      map['pre_socks_proxy'] = Variable<int>(preSocksProxy.value);
    }
    if (displayLog.present) {
      map['display_log'] = Variable<bool>(displayLog.value);
    }
    if (xhttpExtra.present) {
      map['xhttp_extra'] = Variable<String>(xhttpExtra.value);
    }
    if (cert.present) {
      map['cert'] = Variable<String>(cert.value);
    }
    if (customConfig.present) {
      map['custom_config'] = Variable<String>(customConfig.value);
    }
    if (customOutbound.present) {
      map['custom_outbound'] = Variable<String>(customOutbound.value);
    }
    if (jsonData.present) {
      map['json_data'] = Variable<String>(jsonData.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfileItemCompanion(')
          ..write('indexId: $indexId, ')
          ..write('configType: $configType, ')
          ..write('configVersion: $configVersion, ')
          ..write('remarks: $remarks, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('subid: $subid, ')
          ..write('isSub: $isSub, ')
          ..write('address: $address, ')
          ..write('port: $port, ')
          ..write('ports: $ports, ')
          ..write('id: $id, ')
          ..write('security: $security, ')
          ..write('network: $network, ')
          ..write('headerType: $headerType, ')
          ..write('requestHost: $requestHost, ')
          ..write('path: $path, ')
          ..write('streamSecurity: $streamSecurity, ')
          ..write('allowInsecure: $allowInsecure, ')
          ..write('sni: $sni, ')
          ..write('alpn: $alpn, ')
          ..write('fingerprint: $fingerprint, ')
          ..write('publicKey: $publicKey, ')
          ..write('shortId: $shortId, ')
          ..write('spiderX: $spiderX, ')
          ..write('mldsa65Verify: $mldsa65Verify, ')
          ..write('coreType: $coreType, ')
          ..write('preSocksProxy: $preSocksProxy, ')
          ..write('displayLog: $displayLog, ')
          ..write('xhttpExtra: $xhttpExtra, ')
          ..write('cert: $cert, ')
          ..write('customConfig: $customConfig, ')
          ..write('customOutbound: $customOutbound, ')
          ..write('jsonData: $jsonData, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProfileTestItemTable extends ProfileTestItem
    with TableInfo<$ProfileTestItemTable, ProfileTestItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfileTestItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _indexIdMeta = const VerificationMeta(
    'indexId',
  );
  @override
  late final GeneratedColumn<String> indexId = GeneratedColumn<String>(
    'index_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _testTimeMeta = const VerificationMeta(
    'testTime',
  );
  @override
  late final GeneratedColumn<String> testTime = GeneratedColumn<String>(
    'test_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latencyMeta = const VerificationMeta(
    'latency',
  );
  @override
  late final GeneratedColumn<String> latency = GeneratedColumn<String>(
    'latency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<String> speed = GeneratedColumn<String>(
    'speed',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _testResultMeta = const VerificationMeta(
    'testResult',
  );
  @override
  late final GeneratedColumn<String> testResult = GeneratedColumn<String>(
    'test_result',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    indexId,
    testTime,
    latency,
    speed,
    testResult,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profile_test_item';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProfileTestItemData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('index_id')) {
      context.handle(
        _indexIdMeta,
        indexId.isAcceptableOrUnknown(data['index_id']!, _indexIdMeta),
      );
    } else if (isInserting) {
      context.missing(_indexIdMeta);
    }
    if (data.containsKey('test_time')) {
      context.handle(
        _testTimeMeta,
        testTime.isAcceptableOrUnknown(data['test_time']!, _testTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_testTimeMeta);
    }
    if (data.containsKey('latency')) {
      context.handle(
        _latencyMeta,
        latency.isAcceptableOrUnknown(data['latency']!, _latencyMeta),
      );
    }
    if (data.containsKey('speed')) {
      context.handle(
        _speedMeta,
        speed.isAcceptableOrUnknown(data['speed']!, _speedMeta),
      );
    }
    if (data.containsKey('test_result')) {
      context.handle(
        _testResultMeta,
        testResult.isAcceptableOrUnknown(data['test_result']!, _testResultMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {indexId};
  @override
  ProfileTestItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProfileTestItemData(
      indexId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}index_id'],
      )!,
      testTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}test_time'],
      )!,
      latency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}latency'],
      )!,
      speed: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}speed'],
      )!,
      testResult: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}test_result'],
      )!,
    );
  }

  @override
  $ProfileTestItemTable createAlias(String alias) {
    return $ProfileTestItemTable(attachedDatabase, alias);
  }
}

class ProfileTestItemData extends DataClass
    implements Insertable<ProfileTestItemData> {
  final String indexId;
  final String testTime;
  final String latency;
  final String speed;
  final String testResult;
  const ProfileTestItemData({
    required this.indexId,
    required this.testTime,
    required this.latency,
    required this.speed,
    required this.testResult,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['index_id'] = Variable<String>(indexId);
    map['test_time'] = Variable<String>(testTime);
    map['latency'] = Variable<String>(latency);
    map['speed'] = Variable<String>(speed);
    map['test_result'] = Variable<String>(testResult);
    return map;
  }

  ProfileTestItemCompanion toCompanion(bool nullToAbsent) {
    return ProfileTestItemCompanion(
      indexId: Value(indexId),
      testTime: Value(testTime),
      latency: Value(latency),
      speed: Value(speed),
      testResult: Value(testResult),
    );
  }

  factory ProfileTestItemData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfileTestItemData(
      indexId: serializer.fromJson<String>(json['indexId']),
      testTime: serializer.fromJson<String>(json['testTime']),
      latency: serializer.fromJson<String>(json['latency']),
      speed: serializer.fromJson<String>(json['speed']),
      testResult: serializer.fromJson<String>(json['testResult']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'indexId': serializer.toJson<String>(indexId),
      'testTime': serializer.toJson<String>(testTime),
      'latency': serializer.toJson<String>(latency),
      'speed': serializer.toJson<String>(speed),
      'testResult': serializer.toJson<String>(testResult),
    };
  }

  ProfileTestItemData copyWith({
    String? indexId,
    String? testTime,
    String? latency,
    String? speed,
    String? testResult,
  }) => ProfileTestItemData(
    indexId: indexId ?? this.indexId,
    testTime: testTime ?? this.testTime,
    latency: latency ?? this.latency,
    speed: speed ?? this.speed,
    testResult: testResult ?? this.testResult,
  );
  ProfileTestItemData copyWithCompanion(ProfileTestItemCompanion data) {
    return ProfileTestItemData(
      indexId: data.indexId.present ? data.indexId.value : this.indexId,
      testTime: data.testTime.present ? data.testTime.value : this.testTime,
      latency: data.latency.present ? data.latency.value : this.latency,
      speed: data.speed.present ? data.speed.value : this.speed,
      testResult: data.testResult.present
          ? data.testResult.value
          : this.testResult,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProfileTestItemData(')
          ..write('indexId: $indexId, ')
          ..write('testTime: $testTime, ')
          ..write('latency: $latency, ')
          ..write('speed: $speed, ')
          ..write('testResult: $testResult')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(indexId, testTime, latency, speed, testResult);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileTestItemData &&
          other.indexId == this.indexId &&
          other.testTime == this.testTime &&
          other.latency == this.latency &&
          other.speed == this.speed &&
          other.testResult == this.testResult);
}

class ProfileTestItemCompanion extends UpdateCompanion<ProfileTestItemData> {
  final Value<String> indexId;
  final Value<String> testTime;
  final Value<String> latency;
  final Value<String> speed;
  final Value<String> testResult;
  final Value<int> rowid;
  const ProfileTestItemCompanion({
    this.indexId = const Value.absent(),
    this.testTime = const Value.absent(),
    this.latency = const Value.absent(),
    this.speed = const Value.absent(),
    this.testResult = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProfileTestItemCompanion.insert({
    required String indexId,
    required String testTime,
    this.latency = const Value.absent(),
    this.speed = const Value.absent(),
    this.testResult = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : indexId = Value(indexId),
       testTime = Value(testTime);
  static Insertable<ProfileTestItemData> custom({
    Expression<String>? indexId,
    Expression<String>? testTime,
    Expression<String>? latency,
    Expression<String>? speed,
    Expression<String>? testResult,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (indexId != null) 'index_id': indexId,
      if (testTime != null) 'test_time': testTime,
      if (latency != null) 'latency': latency,
      if (speed != null) 'speed': speed,
      if (testResult != null) 'test_result': testResult,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProfileTestItemCompanion copyWith({
    Value<String>? indexId,
    Value<String>? testTime,
    Value<String>? latency,
    Value<String>? speed,
    Value<String>? testResult,
    Value<int>? rowid,
  }) {
    return ProfileTestItemCompanion(
      indexId: indexId ?? this.indexId,
      testTime: testTime ?? this.testTime,
      latency: latency ?? this.latency,
      speed: speed ?? this.speed,
      testResult: testResult ?? this.testResult,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (indexId.present) {
      map['index_id'] = Variable<String>(indexId.value);
    }
    if (testTime.present) {
      map['test_time'] = Variable<String>(testTime.value);
    }
    if (latency.present) {
      map['latency'] = Variable<String>(latency.value);
    }
    if (speed.present) {
      map['speed'] = Variable<String>(speed.value);
    }
    if (testResult.present) {
      map['test_result'] = Variable<String>(testResult.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfileTestItemCompanion(')
          ..write('indexId: $indexId, ')
          ..write('testTime: $testTime, ')
          ..write('latency: $latency, ')
          ..write('speed: $speed, ')
          ..write('testResult: $testResult, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProfileStatItemTable extends ProfileStatItem
    with TableInfo<$ProfileStatItemTable, ProfileStatItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfileStatItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _indexIdMeta = const VerificationMeta(
    'indexId',
  );
  @override
  late final GeneratedColumn<String> indexId = GeneratedColumn<String>(
    'index_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalUpMeta = const VerificationMeta(
    'totalUp',
  );
  @override
  late final GeneratedColumn<BigInt> totalUp = GeneratedColumn<BigInt>(
    'total_up',
    aliasedName,
    false,
    type: DriftSqlType.bigInt,
    requiredDuringInsert: false,
    clientDefault: () => BigInt.zero,
  );
  static const VerificationMeta _totalDownMeta = const VerificationMeta(
    'totalDown',
  );
  @override
  late final GeneratedColumn<BigInt> totalDown = GeneratedColumn<BigInt>(
    'total_down',
    aliasedName,
    false,
    type: DriftSqlType.bigInt,
    requiredDuringInsert: false,
    clientDefault: () => BigInt.zero,
  );
  static const VerificationMeta _todayUpMeta = const VerificationMeta(
    'todayUp',
  );
  @override
  late final GeneratedColumn<BigInt> todayUp = GeneratedColumn<BigInt>(
    'today_up',
    aliasedName,
    false,
    type: DriftSqlType.bigInt,
    requiredDuringInsert: false,
    clientDefault: () => BigInt.zero,
  );
  static const VerificationMeta _todayDownMeta = const VerificationMeta(
    'todayDown',
  );
  @override
  late final GeneratedColumn<BigInt> todayDown = GeneratedColumn<BigInt>(
    'today_down',
    aliasedName,
    false,
    type: DriftSqlType.bigInt,
    requiredDuringInsert: false,
    clientDefault: () => BigInt.zero,
  );
  static const VerificationMeta _dateNowMeta = const VerificationMeta(
    'dateNow',
  );
  @override
  late final GeneratedColumn<BigInt> dateNow = GeneratedColumn<BigInt>(
    'date_now',
    aliasedName,
    false,
    type: DriftSqlType.bigInt,
    requiredDuringInsert: false,
    clientDefault: () => BigInt.zero,
  );
  @override
  List<GeneratedColumn> get $columns => [
    indexId,
    totalUp,
    totalDown,
    todayUp,
    todayDown,
    dateNow,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profile_stat_item';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProfileStatItemData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('index_id')) {
      context.handle(
        _indexIdMeta,
        indexId.isAcceptableOrUnknown(data['index_id']!, _indexIdMeta),
      );
    } else if (isInserting) {
      context.missing(_indexIdMeta);
    }
    if (data.containsKey('total_up')) {
      context.handle(
        _totalUpMeta,
        totalUp.isAcceptableOrUnknown(data['total_up']!, _totalUpMeta),
      );
    }
    if (data.containsKey('total_down')) {
      context.handle(
        _totalDownMeta,
        totalDown.isAcceptableOrUnknown(data['total_down']!, _totalDownMeta),
      );
    }
    if (data.containsKey('today_up')) {
      context.handle(
        _todayUpMeta,
        todayUp.isAcceptableOrUnknown(data['today_up']!, _todayUpMeta),
      );
    }
    if (data.containsKey('today_down')) {
      context.handle(
        _todayDownMeta,
        todayDown.isAcceptableOrUnknown(data['today_down']!, _todayDownMeta),
      );
    }
    if (data.containsKey('date_now')) {
      context.handle(
        _dateNowMeta,
        dateNow.isAcceptableOrUnknown(data['date_now']!, _dateNowMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {indexId};
  @override
  ProfileStatItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProfileStatItemData(
      indexId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}index_id'],
      )!,
      totalUp: attachedDatabase.typeMapping.read(
        DriftSqlType.bigInt,
        data['${effectivePrefix}total_up'],
      )!,
      totalDown: attachedDatabase.typeMapping.read(
        DriftSqlType.bigInt,
        data['${effectivePrefix}total_down'],
      )!,
      todayUp: attachedDatabase.typeMapping.read(
        DriftSqlType.bigInt,
        data['${effectivePrefix}today_up'],
      )!,
      todayDown: attachedDatabase.typeMapping.read(
        DriftSqlType.bigInt,
        data['${effectivePrefix}today_down'],
      )!,
      dateNow: attachedDatabase.typeMapping.read(
        DriftSqlType.bigInt,
        data['${effectivePrefix}date_now'],
      )!,
    );
  }

  @override
  $ProfileStatItemTable createAlias(String alias) {
    return $ProfileStatItemTable(attachedDatabase, alias);
  }
}

class ProfileStatItemData extends DataClass
    implements Insertable<ProfileStatItemData> {
  final String indexId;
  final BigInt totalUp;
  final BigInt totalDown;
  final BigInt todayUp;
  final BigInt todayDown;
  final BigInt dateNow;
  const ProfileStatItemData({
    required this.indexId,
    required this.totalUp,
    required this.totalDown,
    required this.todayUp,
    required this.todayDown,
    required this.dateNow,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['index_id'] = Variable<String>(indexId);
    map['total_up'] = Variable<BigInt>(totalUp);
    map['total_down'] = Variable<BigInt>(totalDown);
    map['today_up'] = Variable<BigInt>(todayUp);
    map['today_down'] = Variable<BigInt>(todayDown);
    map['date_now'] = Variable<BigInt>(dateNow);
    return map;
  }

  ProfileStatItemCompanion toCompanion(bool nullToAbsent) {
    return ProfileStatItemCompanion(
      indexId: Value(indexId),
      totalUp: Value(totalUp),
      totalDown: Value(totalDown),
      todayUp: Value(todayUp),
      todayDown: Value(todayDown),
      dateNow: Value(dateNow),
    );
  }

  factory ProfileStatItemData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfileStatItemData(
      indexId: serializer.fromJson<String>(json['indexId']),
      totalUp: serializer.fromJson<BigInt>(json['totalUp']),
      totalDown: serializer.fromJson<BigInt>(json['totalDown']),
      todayUp: serializer.fromJson<BigInt>(json['todayUp']),
      todayDown: serializer.fromJson<BigInt>(json['todayDown']),
      dateNow: serializer.fromJson<BigInt>(json['dateNow']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'indexId': serializer.toJson<String>(indexId),
      'totalUp': serializer.toJson<BigInt>(totalUp),
      'totalDown': serializer.toJson<BigInt>(totalDown),
      'todayUp': serializer.toJson<BigInt>(todayUp),
      'todayDown': serializer.toJson<BigInt>(todayDown),
      'dateNow': serializer.toJson<BigInt>(dateNow),
    };
  }

  ProfileStatItemData copyWith({
    String? indexId,
    BigInt? totalUp,
    BigInt? totalDown,
    BigInt? todayUp,
    BigInt? todayDown,
    BigInt? dateNow,
  }) => ProfileStatItemData(
    indexId: indexId ?? this.indexId,
    totalUp: totalUp ?? this.totalUp,
    totalDown: totalDown ?? this.totalDown,
    todayUp: todayUp ?? this.todayUp,
    todayDown: todayDown ?? this.todayDown,
    dateNow: dateNow ?? this.dateNow,
  );
  ProfileStatItemData copyWithCompanion(ProfileStatItemCompanion data) {
    return ProfileStatItemData(
      indexId: data.indexId.present ? data.indexId.value : this.indexId,
      totalUp: data.totalUp.present ? data.totalUp.value : this.totalUp,
      totalDown: data.totalDown.present ? data.totalDown.value : this.totalDown,
      todayUp: data.todayUp.present ? data.todayUp.value : this.todayUp,
      todayDown: data.todayDown.present ? data.todayDown.value : this.todayDown,
      dateNow: data.dateNow.present ? data.dateNow.value : this.dateNow,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProfileStatItemData(')
          ..write('indexId: $indexId, ')
          ..write('totalUp: $totalUp, ')
          ..write('totalDown: $totalDown, ')
          ..write('todayUp: $todayUp, ')
          ..write('todayDown: $todayDown, ')
          ..write('dateNow: $dateNow')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(indexId, totalUp, totalDown, todayUp, todayDown, dateNow);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileStatItemData &&
          other.indexId == this.indexId &&
          other.totalUp == this.totalUp &&
          other.totalDown == this.totalDown &&
          other.todayUp == this.todayUp &&
          other.todayDown == this.todayDown &&
          other.dateNow == this.dateNow);
}

class ProfileStatItemCompanion extends UpdateCompanion<ProfileStatItemData> {
  final Value<String> indexId;
  final Value<BigInt> totalUp;
  final Value<BigInt> totalDown;
  final Value<BigInt> todayUp;
  final Value<BigInt> todayDown;
  final Value<BigInt> dateNow;
  final Value<int> rowid;
  const ProfileStatItemCompanion({
    this.indexId = const Value.absent(),
    this.totalUp = const Value.absent(),
    this.totalDown = const Value.absent(),
    this.todayUp = const Value.absent(),
    this.todayDown = const Value.absent(),
    this.dateNow = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProfileStatItemCompanion.insert({
    required String indexId,
    this.totalUp = const Value.absent(),
    this.totalDown = const Value.absent(),
    this.todayUp = const Value.absent(),
    this.todayDown = const Value.absent(),
    this.dateNow = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : indexId = Value(indexId);
  static Insertable<ProfileStatItemData> custom({
    Expression<String>? indexId,
    Expression<BigInt>? totalUp,
    Expression<BigInt>? totalDown,
    Expression<BigInt>? todayUp,
    Expression<BigInt>? todayDown,
    Expression<BigInt>? dateNow,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (indexId != null) 'index_id': indexId,
      if (totalUp != null) 'total_up': totalUp,
      if (totalDown != null) 'total_down': totalDown,
      if (todayUp != null) 'today_up': todayUp,
      if (todayDown != null) 'today_down': todayDown,
      if (dateNow != null) 'date_now': dateNow,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProfileStatItemCompanion copyWith({
    Value<String>? indexId,
    Value<BigInt>? totalUp,
    Value<BigInt>? totalDown,
    Value<BigInt>? todayUp,
    Value<BigInt>? todayDown,
    Value<BigInt>? dateNow,
    Value<int>? rowid,
  }) {
    return ProfileStatItemCompanion(
      indexId: indexId ?? this.indexId,
      totalUp: totalUp ?? this.totalUp,
      totalDown: totalDown ?? this.totalDown,
      todayUp: todayUp ?? this.todayUp,
      todayDown: todayDown ?? this.todayDown,
      dateNow: dateNow ?? this.dateNow,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (indexId.present) {
      map['index_id'] = Variable<String>(indexId.value);
    }
    if (totalUp.present) {
      map['total_up'] = Variable<BigInt>(totalUp.value);
    }
    if (totalDown.present) {
      map['total_down'] = Variable<BigInt>(totalDown.value);
    }
    if (todayUp.present) {
      map['today_up'] = Variable<BigInt>(todayUp.value);
    }
    if (todayDown.present) {
      map['today_down'] = Variable<BigInt>(todayDown.value);
    }
    if (dateNow.present) {
      map['date_now'] = Variable<BigInt>(dateNow.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfileStatItemCompanion(')
          ..write('indexId: $indexId, ')
          ..write('totalUp: $totalUp, ')
          ..write('totalDown: $totalDown, ')
          ..write('todayUp: $todayUp, ')
          ..write('todayDown: $todayDown, ')
          ..write('dateNow: $dateNow, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProfileItemTable profileItem = $ProfileItemTable(this);
  late final $ProfileTestItemTable profileTestItem = $ProfileTestItemTable(
    this,
  );
  late final $ProfileStatItemTable profileStatItem = $ProfileStatItemTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    profileItem,
    profileTestItem,
    profileStatItem,
  ];
}

typedef $$ProfileItemTableCreateCompanionBuilder =
    ProfileItemCompanion Function({
      required String indexId,
      Value<EConfigType> configType,
      Value<int> configVersion,
      Value<String> remarks,
      Value<int> orderIndex,
      Value<String> subid,
      Value<bool> isSub,
      Value<String> address,
      Value<int> port,
      Value<String> ports,
      Value<String> id,
      Value<String> security,
      Value<String> network,
      Value<String> headerType,
      Value<String> requestHost,
      Value<String> path,
      Value<String> streamSecurity,
      Value<String> allowInsecure,
      Value<String> sni,
      Value<String> alpn,
      Value<String> fingerprint,
      Value<String> publicKey,
      Value<String> shortId,
      Value<String> spiderX,
      Value<String> mldsa65Verify,
      Value<ECoreType?> coreType,
      Value<int?> preSocksProxy,
      Value<bool> displayLog,
      Value<String> xhttpExtra,
      Value<String> cert,
      Value<String> customConfig,
      Value<String> customOutbound,
      Value<String> jsonData,
      Value<int> rowid,
    });
typedef $$ProfileItemTableUpdateCompanionBuilder =
    ProfileItemCompanion Function({
      Value<String> indexId,
      Value<EConfigType> configType,
      Value<int> configVersion,
      Value<String> remarks,
      Value<int> orderIndex,
      Value<String> subid,
      Value<bool> isSub,
      Value<String> address,
      Value<int> port,
      Value<String> ports,
      Value<String> id,
      Value<String> security,
      Value<String> network,
      Value<String> headerType,
      Value<String> requestHost,
      Value<String> path,
      Value<String> streamSecurity,
      Value<String> allowInsecure,
      Value<String> sni,
      Value<String> alpn,
      Value<String> fingerprint,
      Value<String> publicKey,
      Value<String> shortId,
      Value<String> spiderX,
      Value<String> mldsa65Verify,
      Value<ECoreType?> coreType,
      Value<int?> preSocksProxy,
      Value<bool> displayLog,
      Value<String> xhttpExtra,
      Value<String> cert,
      Value<String> customConfig,
      Value<String> customOutbound,
      Value<String> jsonData,
      Value<int> rowid,
    });

class $$ProfileItemTableFilterComposer
    extends Composer<_$AppDatabase, $ProfileItemTable> {
  $$ProfileItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get indexId => $composableBuilder(
    column: $table.indexId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<EConfigType, EConfigType, String>
  get configType => $composableBuilder(
    column: $table.configType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get configVersion => $composableBuilder(
    column: $table.configVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remarks => $composableBuilder(
    column: $table.remarks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subid => $composableBuilder(
    column: $table.subid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSub => $composableBuilder(
    column: $table.isSub,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get port => $composableBuilder(
    column: $table.port,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ports => $composableBuilder(
    column: $table.ports,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get security => $composableBuilder(
    column: $table.security,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get network => $composableBuilder(
    column: $table.network,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get headerType => $composableBuilder(
    column: $table.headerType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get requestHost => $composableBuilder(
    column: $table.requestHost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get streamSecurity => $composableBuilder(
    column: $table.streamSecurity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get allowInsecure => $composableBuilder(
    column: $table.allowInsecure,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sni => $composableBuilder(
    column: $table.sni,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alpn => $composableBuilder(
    column: $table.alpn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fingerprint => $composableBuilder(
    column: $table.fingerprint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get publicKey => $composableBuilder(
    column: $table.publicKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shortId => $composableBuilder(
    column: $table.shortId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get spiderX => $composableBuilder(
    column: $table.spiderX,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mldsa65Verify => $composableBuilder(
    column: $table.mldsa65Verify,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ECoreType?, ECoreType, String> get coreType =>
      $composableBuilder(
        column: $table.coreType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get preSocksProxy => $composableBuilder(
    column: $table.preSocksProxy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get displayLog => $composableBuilder(
    column: $table.displayLog,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get xhttpExtra => $composableBuilder(
    column: $table.xhttpExtra,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cert => $composableBuilder(
    column: $table.cert,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customConfig => $composableBuilder(
    column: $table.customConfig,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customOutbound => $composableBuilder(
    column: $table.customOutbound,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jsonData => $composableBuilder(
    column: $table.jsonData,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProfileItemTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfileItemTable> {
  $$ProfileItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get indexId => $composableBuilder(
    column: $table.indexId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get configType => $composableBuilder(
    column: $table.configType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get configVersion => $composableBuilder(
    column: $table.configVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remarks => $composableBuilder(
    column: $table.remarks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subid => $composableBuilder(
    column: $table.subid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSub => $composableBuilder(
    column: $table.isSub,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get port => $composableBuilder(
    column: $table.port,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ports => $composableBuilder(
    column: $table.ports,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get security => $composableBuilder(
    column: $table.security,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get network => $composableBuilder(
    column: $table.network,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get headerType => $composableBuilder(
    column: $table.headerType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get requestHost => $composableBuilder(
    column: $table.requestHost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get streamSecurity => $composableBuilder(
    column: $table.streamSecurity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get allowInsecure => $composableBuilder(
    column: $table.allowInsecure,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sni => $composableBuilder(
    column: $table.sni,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alpn => $composableBuilder(
    column: $table.alpn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fingerprint => $composableBuilder(
    column: $table.fingerprint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get publicKey => $composableBuilder(
    column: $table.publicKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortId => $composableBuilder(
    column: $table.shortId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get spiderX => $composableBuilder(
    column: $table.spiderX,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mldsa65Verify => $composableBuilder(
    column: $table.mldsa65Verify,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coreType => $composableBuilder(
    column: $table.coreType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get preSocksProxy => $composableBuilder(
    column: $table.preSocksProxy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get displayLog => $composableBuilder(
    column: $table.displayLog,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get xhttpExtra => $composableBuilder(
    column: $table.xhttpExtra,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cert => $composableBuilder(
    column: $table.cert,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customConfig => $composableBuilder(
    column: $table.customConfig,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customOutbound => $composableBuilder(
    column: $table.customOutbound,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jsonData => $composableBuilder(
    column: $table.jsonData,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProfileItemTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfileItemTable> {
  $$ProfileItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get indexId =>
      $composableBuilder(column: $table.indexId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<EConfigType, String> get configType =>
      $composableBuilder(
        column: $table.configType,
        builder: (column) => column,
      );

  GeneratedColumn<int> get configVersion => $composableBuilder(
    column: $table.configVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get remarks =>
      $composableBuilder(column: $table.remarks, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get subid =>
      $composableBuilder(column: $table.subid, builder: (column) => column);

  GeneratedColumn<bool> get isSub =>
      $composableBuilder(column: $table.isSub, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<int> get port =>
      $composableBuilder(column: $table.port, builder: (column) => column);

  GeneratedColumn<String> get ports =>
      $composableBuilder(column: $table.ports, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get security =>
      $composableBuilder(column: $table.security, builder: (column) => column);

  GeneratedColumn<String> get network =>
      $composableBuilder(column: $table.network, builder: (column) => column);

  GeneratedColumn<String> get headerType => $composableBuilder(
    column: $table.headerType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get requestHost => $composableBuilder(
    column: $table.requestHost,
    builder: (column) => column,
  );

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  GeneratedColumn<String> get streamSecurity => $composableBuilder(
    column: $table.streamSecurity,
    builder: (column) => column,
  );

  GeneratedColumn<String> get allowInsecure => $composableBuilder(
    column: $table.allowInsecure,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sni =>
      $composableBuilder(column: $table.sni, builder: (column) => column);

  GeneratedColumn<String> get alpn =>
      $composableBuilder(column: $table.alpn, builder: (column) => column);

  GeneratedColumn<String> get fingerprint => $composableBuilder(
    column: $table.fingerprint,
    builder: (column) => column,
  );

  GeneratedColumn<String> get publicKey =>
      $composableBuilder(column: $table.publicKey, builder: (column) => column);

  GeneratedColumn<String> get shortId =>
      $composableBuilder(column: $table.shortId, builder: (column) => column);

  GeneratedColumn<String> get spiderX =>
      $composableBuilder(column: $table.spiderX, builder: (column) => column);

  GeneratedColumn<String> get mldsa65Verify => $composableBuilder(
    column: $table.mldsa65Verify,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<ECoreType?, String> get coreType =>
      $composableBuilder(column: $table.coreType, builder: (column) => column);

  GeneratedColumn<int> get preSocksProxy => $composableBuilder(
    column: $table.preSocksProxy,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get displayLog => $composableBuilder(
    column: $table.displayLog,
    builder: (column) => column,
  );

  GeneratedColumn<String> get xhttpExtra => $composableBuilder(
    column: $table.xhttpExtra,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cert =>
      $composableBuilder(column: $table.cert, builder: (column) => column);

  GeneratedColumn<String> get customConfig => $composableBuilder(
    column: $table.customConfig,
    builder: (column) => column,
  );

  GeneratedColumn<String> get customOutbound => $composableBuilder(
    column: $table.customOutbound,
    builder: (column) => column,
  );

  GeneratedColumn<String> get jsonData =>
      $composableBuilder(column: $table.jsonData, builder: (column) => column);
}

class $$ProfileItemTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProfileItemTable,
          ProfileItemData,
          $$ProfileItemTableFilterComposer,
          $$ProfileItemTableOrderingComposer,
          $$ProfileItemTableAnnotationComposer,
          $$ProfileItemTableCreateCompanionBuilder,
          $$ProfileItemTableUpdateCompanionBuilder,
          (
            ProfileItemData,
            BaseReferences<_$AppDatabase, $ProfileItemTable, ProfileItemData>,
          ),
          ProfileItemData,
          PrefetchHooks Function()
        > {
  $$ProfileItemTableTableManager(_$AppDatabase db, $ProfileItemTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfileItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfileItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfileItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> indexId = const Value.absent(),
                Value<EConfigType> configType = const Value.absent(),
                Value<int> configVersion = const Value.absent(),
                Value<String> remarks = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<String> subid = const Value.absent(),
                Value<bool> isSub = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<int> port = const Value.absent(),
                Value<String> ports = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> security = const Value.absent(),
                Value<String> network = const Value.absent(),
                Value<String> headerType = const Value.absent(),
                Value<String> requestHost = const Value.absent(),
                Value<String> path = const Value.absent(),
                Value<String> streamSecurity = const Value.absent(),
                Value<String> allowInsecure = const Value.absent(),
                Value<String> sni = const Value.absent(),
                Value<String> alpn = const Value.absent(),
                Value<String> fingerprint = const Value.absent(),
                Value<String> publicKey = const Value.absent(),
                Value<String> shortId = const Value.absent(),
                Value<String> spiderX = const Value.absent(),
                Value<String> mldsa65Verify = const Value.absent(),
                Value<ECoreType?> coreType = const Value.absent(),
                Value<int?> preSocksProxy = const Value.absent(),
                Value<bool> displayLog = const Value.absent(),
                Value<String> xhttpExtra = const Value.absent(),
                Value<String> cert = const Value.absent(),
                Value<String> customConfig = const Value.absent(),
                Value<String> customOutbound = const Value.absent(),
                Value<String> jsonData = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProfileItemCompanion(
                indexId: indexId,
                configType: configType,
                configVersion: configVersion,
                remarks: remarks,
                orderIndex: orderIndex,
                subid: subid,
                isSub: isSub,
                address: address,
                port: port,
                ports: ports,
                id: id,
                security: security,
                network: network,
                headerType: headerType,
                requestHost: requestHost,
                path: path,
                streamSecurity: streamSecurity,
                allowInsecure: allowInsecure,
                sni: sni,
                alpn: alpn,
                fingerprint: fingerprint,
                publicKey: publicKey,
                shortId: shortId,
                spiderX: spiderX,
                mldsa65Verify: mldsa65Verify,
                coreType: coreType,
                preSocksProxy: preSocksProxy,
                displayLog: displayLog,
                xhttpExtra: xhttpExtra,
                cert: cert,
                customConfig: customConfig,
                customOutbound: customOutbound,
                jsonData: jsonData,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String indexId,
                Value<EConfigType> configType = const Value.absent(),
                Value<int> configVersion = const Value.absent(),
                Value<String> remarks = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<String> subid = const Value.absent(),
                Value<bool> isSub = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<int> port = const Value.absent(),
                Value<String> ports = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> security = const Value.absent(),
                Value<String> network = const Value.absent(),
                Value<String> headerType = const Value.absent(),
                Value<String> requestHost = const Value.absent(),
                Value<String> path = const Value.absent(),
                Value<String> streamSecurity = const Value.absent(),
                Value<String> allowInsecure = const Value.absent(),
                Value<String> sni = const Value.absent(),
                Value<String> alpn = const Value.absent(),
                Value<String> fingerprint = const Value.absent(),
                Value<String> publicKey = const Value.absent(),
                Value<String> shortId = const Value.absent(),
                Value<String> spiderX = const Value.absent(),
                Value<String> mldsa65Verify = const Value.absent(),
                Value<ECoreType?> coreType = const Value.absent(),
                Value<int?> preSocksProxy = const Value.absent(),
                Value<bool> displayLog = const Value.absent(),
                Value<String> xhttpExtra = const Value.absent(),
                Value<String> cert = const Value.absent(),
                Value<String> customConfig = const Value.absent(),
                Value<String> customOutbound = const Value.absent(),
                Value<String> jsonData = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProfileItemCompanion.insert(
                indexId: indexId,
                configType: configType,
                configVersion: configVersion,
                remarks: remarks,
                orderIndex: orderIndex,
                subid: subid,
                isSub: isSub,
                address: address,
                port: port,
                ports: ports,
                id: id,
                security: security,
                network: network,
                headerType: headerType,
                requestHost: requestHost,
                path: path,
                streamSecurity: streamSecurity,
                allowInsecure: allowInsecure,
                sni: sni,
                alpn: alpn,
                fingerprint: fingerprint,
                publicKey: publicKey,
                shortId: shortId,
                spiderX: spiderX,
                mldsa65Verify: mldsa65Verify,
                coreType: coreType,
                preSocksProxy: preSocksProxy,
                displayLog: displayLog,
                xhttpExtra: xhttpExtra,
                cert: cert,
                customConfig: customConfig,
                customOutbound: customOutbound,
                jsonData: jsonData,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProfileItemTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProfileItemTable,
      ProfileItemData,
      $$ProfileItemTableFilterComposer,
      $$ProfileItemTableOrderingComposer,
      $$ProfileItemTableAnnotationComposer,
      $$ProfileItemTableCreateCompanionBuilder,
      $$ProfileItemTableUpdateCompanionBuilder,
      (
        ProfileItemData,
        BaseReferences<_$AppDatabase, $ProfileItemTable, ProfileItemData>,
      ),
      ProfileItemData,
      PrefetchHooks Function()
    >;
typedef $$ProfileTestItemTableCreateCompanionBuilder =
    ProfileTestItemCompanion Function({
      required String indexId,
      required String testTime,
      Value<String> latency,
      Value<String> speed,
      Value<String> testResult,
      Value<int> rowid,
    });
typedef $$ProfileTestItemTableUpdateCompanionBuilder =
    ProfileTestItemCompanion Function({
      Value<String> indexId,
      Value<String> testTime,
      Value<String> latency,
      Value<String> speed,
      Value<String> testResult,
      Value<int> rowid,
    });

class $$ProfileTestItemTableFilterComposer
    extends Composer<_$AppDatabase, $ProfileTestItemTable> {
  $$ProfileTestItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get indexId => $composableBuilder(
    column: $table.indexId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get testTime => $composableBuilder(
    column: $table.testTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get latency => $composableBuilder(
    column: $table.latency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get testResult => $composableBuilder(
    column: $table.testResult,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProfileTestItemTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfileTestItemTable> {
  $$ProfileTestItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get indexId => $composableBuilder(
    column: $table.indexId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get testTime => $composableBuilder(
    column: $table.testTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get latency => $composableBuilder(
    column: $table.latency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get testResult => $composableBuilder(
    column: $table.testResult,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProfileTestItemTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfileTestItemTable> {
  $$ProfileTestItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get indexId =>
      $composableBuilder(column: $table.indexId, builder: (column) => column);

  GeneratedColumn<String> get testTime =>
      $composableBuilder(column: $table.testTime, builder: (column) => column);

  GeneratedColumn<String> get latency =>
      $composableBuilder(column: $table.latency, builder: (column) => column);

  GeneratedColumn<String> get speed =>
      $composableBuilder(column: $table.speed, builder: (column) => column);

  GeneratedColumn<String> get testResult => $composableBuilder(
    column: $table.testResult,
    builder: (column) => column,
  );
}

class $$ProfileTestItemTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProfileTestItemTable,
          ProfileTestItemData,
          $$ProfileTestItemTableFilterComposer,
          $$ProfileTestItemTableOrderingComposer,
          $$ProfileTestItemTableAnnotationComposer,
          $$ProfileTestItemTableCreateCompanionBuilder,
          $$ProfileTestItemTableUpdateCompanionBuilder,
          (
            ProfileTestItemData,
            BaseReferences<
              _$AppDatabase,
              $ProfileTestItemTable,
              ProfileTestItemData
            >,
          ),
          ProfileTestItemData,
          PrefetchHooks Function()
        > {
  $$ProfileTestItemTableTableManager(
    _$AppDatabase db,
    $ProfileTestItemTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfileTestItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfileTestItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfileTestItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> indexId = const Value.absent(),
                Value<String> testTime = const Value.absent(),
                Value<String> latency = const Value.absent(),
                Value<String> speed = const Value.absent(),
                Value<String> testResult = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProfileTestItemCompanion(
                indexId: indexId,
                testTime: testTime,
                latency: latency,
                speed: speed,
                testResult: testResult,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String indexId,
                required String testTime,
                Value<String> latency = const Value.absent(),
                Value<String> speed = const Value.absent(),
                Value<String> testResult = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProfileTestItemCompanion.insert(
                indexId: indexId,
                testTime: testTime,
                latency: latency,
                speed: speed,
                testResult: testResult,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProfileTestItemTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProfileTestItemTable,
      ProfileTestItemData,
      $$ProfileTestItemTableFilterComposer,
      $$ProfileTestItemTableOrderingComposer,
      $$ProfileTestItemTableAnnotationComposer,
      $$ProfileTestItemTableCreateCompanionBuilder,
      $$ProfileTestItemTableUpdateCompanionBuilder,
      (
        ProfileTestItemData,
        BaseReferences<
          _$AppDatabase,
          $ProfileTestItemTable,
          ProfileTestItemData
        >,
      ),
      ProfileTestItemData,
      PrefetchHooks Function()
    >;
typedef $$ProfileStatItemTableCreateCompanionBuilder =
    ProfileStatItemCompanion Function({
      required String indexId,
      Value<BigInt> totalUp,
      Value<BigInt> totalDown,
      Value<BigInt> todayUp,
      Value<BigInt> todayDown,
      Value<BigInt> dateNow,
      Value<int> rowid,
    });
typedef $$ProfileStatItemTableUpdateCompanionBuilder =
    ProfileStatItemCompanion Function({
      Value<String> indexId,
      Value<BigInt> totalUp,
      Value<BigInt> totalDown,
      Value<BigInt> todayUp,
      Value<BigInt> todayDown,
      Value<BigInt> dateNow,
      Value<int> rowid,
    });

class $$ProfileStatItemTableFilterComposer
    extends Composer<_$AppDatabase, $ProfileStatItemTable> {
  $$ProfileStatItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get indexId => $composableBuilder(
    column: $table.indexId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<BigInt> get totalUp => $composableBuilder(
    column: $table.totalUp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<BigInt> get totalDown => $composableBuilder(
    column: $table.totalDown,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<BigInt> get todayUp => $composableBuilder(
    column: $table.todayUp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<BigInt> get todayDown => $composableBuilder(
    column: $table.todayDown,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<BigInt> get dateNow => $composableBuilder(
    column: $table.dateNow,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProfileStatItemTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfileStatItemTable> {
  $$ProfileStatItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get indexId => $composableBuilder(
    column: $table.indexId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<BigInt> get totalUp => $composableBuilder(
    column: $table.totalUp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<BigInt> get totalDown => $composableBuilder(
    column: $table.totalDown,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<BigInt> get todayUp => $composableBuilder(
    column: $table.todayUp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<BigInt> get todayDown => $composableBuilder(
    column: $table.todayDown,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<BigInt> get dateNow => $composableBuilder(
    column: $table.dateNow,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProfileStatItemTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfileStatItemTable> {
  $$ProfileStatItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get indexId =>
      $composableBuilder(column: $table.indexId, builder: (column) => column);

  GeneratedColumn<BigInt> get totalUp =>
      $composableBuilder(column: $table.totalUp, builder: (column) => column);

  GeneratedColumn<BigInt> get totalDown =>
      $composableBuilder(column: $table.totalDown, builder: (column) => column);

  GeneratedColumn<BigInt> get todayUp =>
      $composableBuilder(column: $table.todayUp, builder: (column) => column);

  GeneratedColumn<BigInt> get todayDown =>
      $composableBuilder(column: $table.todayDown, builder: (column) => column);

  GeneratedColumn<BigInt> get dateNow =>
      $composableBuilder(column: $table.dateNow, builder: (column) => column);
}

class $$ProfileStatItemTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProfileStatItemTable,
          ProfileStatItemData,
          $$ProfileStatItemTableFilterComposer,
          $$ProfileStatItemTableOrderingComposer,
          $$ProfileStatItemTableAnnotationComposer,
          $$ProfileStatItemTableCreateCompanionBuilder,
          $$ProfileStatItemTableUpdateCompanionBuilder,
          (
            ProfileStatItemData,
            BaseReferences<
              _$AppDatabase,
              $ProfileStatItemTable,
              ProfileStatItemData
            >,
          ),
          ProfileStatItemData,
          PrefetchHooks Function()
        > {
  $$ProfileStatItemTableTableManager(
    _$AppDatabase db,
    $ProfileStatItemTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfileStatItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfileStatItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfileStatItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> indexId = const Value.absent(),
                Value<BigInt> totalUp = const Value.absent(),
                Value<BigInt> totalDown = const Value.absent(),
                Value<BigInt> todayUp = const Value.absent(),
                Value<BigInt> todayDown = const Value.absent(),
                Value<BigInt> dateNow = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProfileStatItemCompanion(
                indexId: indexId,
                totalUp: totalUp,
                totalDown: totalDown,
                todayUp: todayUp,
                todayDown: todayDown,
                dateNow: dateNow,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String indexId,
                Value<BigInt> totalUp = const Value.absent(),
                Value<BigInt> totalDown = const Value.absent(),
                Value<BigInt> todayUp = const Value.absent(),
                Value<BigInt> todayDown = const Value.absent(),
                Value<BigInt> dateNow = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProfileStatItemCompanion.insert(
                indexId: indexId,
                totalUp: totalUp,
                totalDown: totalDown,
                todayUp: todayUp,
                todayDown: todayDown,
                dateNow: dateNow,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProfileStatItemTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProfileStatItemTable,
      ProfileStatItemData,
      $$ProfileStatItemTableFilterComposer,
      $$ProfileStatItemTableOrderingComposer,
      $$ProfileStatItemTableAnnotationComposer,
      $$ProfileStatItemTableCreateCompanionBuilder,
      $$ProfileStatItemTableUpdateCompanionBuilder,
      (
        ProfileStatItemData,
        BaseReferences<
          _$AppDatabase,
          $ProfileStatItemTable,
          ProfileStatItemData
        >,
      ),
      ProfileStatItemData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProfileItemTableTableManager get profileItem =>
      $$ProfileItemTableTableManager(_db, _db.profileItem);
  $$ProfileTestItemTableTableManager get profileTestItem =>
      $$ProfileTestItemTableTableManager(_db, _db.profileTestItem);
  $$ProfileStatItemTableTableManager get profileStatItem =>
      $$ProfileStatItemTableTableManager(_db, _db.profileStatItem);
}
