import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xray_flutter/core/global_const.dart';

part 'dns_item_dto.freezed.dart';
part 'dns_item_dto.g.dart';

@freezed
abstract class DnsItemDto with _$DnsItemDto {
  const factory DnsItemDto({
    @Default(GlobalConst.defaultRemoteDns) String remoteDns,
    @Default(GlobalConst.defaultLocalDns) String localDns,
    @Default(false) bool enableFakeDns,
    @Default('') String additionalHosts,
    @Default(false) bool serveStale,
    @Default(false) bool parallelQuery,
  }) = _DnsItemDto;

  factory DnsItemDto.fromJson(Map<String, dynamic> json) =>
      _$DnsItemDtoFromJson(json);
}
