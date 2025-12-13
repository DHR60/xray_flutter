import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_item_dto.freezed.dart';
part 'sub_item_dto.g.dart';

@freezed
abstract class SubItemDto with _$SubItemDto {
  const factory SubItemDto({
    required String subId,
    @Default('') String subName,
    @Default(0) int orderIndex,
    String? subUrl,
    DateTime? lastUpdated,
    String? userAgent,
    String? filterRegex,
  }) = _SubItemDto;

  factory SubItemDto.fromJson(Map<String, dynamic> json) =>
      _$SubItemDtoFromJson(json);
}
