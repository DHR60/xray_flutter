import 'package:freezed_annotation/freezed_annotation.dart';

part 'core_item_dto.freezed.dart';
part 'core_item_dto.g.dart';

@freezed
abstract class CoreItemDto with _$CoreItemDto {
  const factory CoreItemDto({
    @Default('10808') String inboundPort,
  }) = _CoreItemDto;

  factory CoreItemDto.fromJson(Map<String, dynamic> json) =>
      _$CoreItemDtoFromJson(json);
}