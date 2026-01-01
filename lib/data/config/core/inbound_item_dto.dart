import 'package:freezed_annotation/freezed_annotation.dart';

part 'inbound_item_dto.freezed.dart';
part 'inbound_item_dto.g.dart';

@freezed
abstract class InboundItemDto with _$InboundItemDto {
  const factory InboundItemDto({
    @Default('10808') String port,
    @Default(true) bool sniff,
    @Default(false) bool overrideTarget,
    @Default(false) bool publicListen,
  }) = _InboundItemDto;

  factory InboundItemDto.fromJson(Map<String, dynamic> json) =>
      _$InboundItemDtoFromJson(json);
}
