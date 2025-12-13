import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_item_dto.freezed.dart';
part 'ui_item_dto.g.dart';

@freezed
abstract class UiItemDto with _$UiItemDto {
  const factory UiItemDto({
    int? fontSize,
    String? fontFamily,
    int? isDarkMode,
  }) = _UiItemDto;

  factory UiItemDto.fromJson(Map<String, dynamic> json) =>
      _$UiItemDtoFromJson(json);
}