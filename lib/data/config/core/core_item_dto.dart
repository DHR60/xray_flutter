import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xray_flutter/data/config/core/inbound_item_dto.dart';

part 'core_item_dto.freezed.dart';
part 'core_item_dto.g.dart';

@freezed
abstract class CoreItemDto with _$CoreItemDto {
  const factory CoreItemDto({
    @Default(InboundItemDto()) InboundItemDto inbound,
  }) = _CoreItemDto;

  factory CoreItemDto.fromJson(Map<String, dynamic> json) =>
      _$CoreItemDtoFromJson(json);
}
