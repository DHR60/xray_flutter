import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_extra_item_dto.freezed.dart';
part 'profile_extra_item_dto.g.dart';

@freezed
abstract class ProfileExtraItemDto with _$ProfileExtraItemDto {
  const factory ProfileExtraItemDto({
    @Default(null) String? flow,
    @Default(null) String? alterId,
    @Default(null) String? vlessEncryption,
    @Default(null) String? vlessVisionSeed,
  }) = _ProfileExtraItemDto;

  factory ProfileExtraItemDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileExtraItemDtoFromJson(json);
}
