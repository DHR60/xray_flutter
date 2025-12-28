import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xray_flutter/core/utils.dart';

part 'profile_extra_item_dto.freezed.dart';
part 'profile_extra_item_dto.g.dart';

@freezed
abstract class ProfileExtraItemDto with _$ProfileExtraItemDto {
  const factory ProfileExtraItemDto({
    String? flow,
    String? alterId,
    String? vlessEncryption,
    String? vlessVisionSeed,
    bool? shadowsocksV2rayMode,
    String? obfs,
    String? obfsParam,
    String? wireguardLocalAddress,
    String? wireguardPreSharedKey,
    String? wireguardReserved,
    String? wireguardPublicKey,
    int? wireguardMtu,
  }) = _ProfileExtraItemDto;

  factory ProfileExtraItemDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileExtraItemDtoFromJson(json);

  factory ProfileExtraItemDto.fromString(String jsonString) {
    try {
      final Map<String, dynamic> jsonMap = Utils.fromJsonString(jsonString);
      return ProfileExtraItemDto.fromJson(jsonMap);
    } catch (_) {
      return const ProfileExtraItemDto();
    }
  }
}
