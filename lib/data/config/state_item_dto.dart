import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_item_dto.freezed.dart';
part 'state_item_dto.g.dart';

@freezed
abstract class StateItemDto with _$StateItemDto {
  const factory StateItemDto({
    @Default('') String subId,
    @Default('') String profileId,
    @Default('') String routingId,
  }) = _StateItemDto;
  
  factory StateItemDto.fromJson(Map<String, dynamic> json) =>
      _$StateItemDtoFromJson(json);
}