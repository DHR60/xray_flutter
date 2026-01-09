import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xray_flutter/data/config/rule_item_dto.dart';

part 'routing_item_dto.freezed.dart';
part 'routing_item_dto.g.dart';

@freezed
abstract class RoutingItemDto with _$RoutingItemDto {
  const factory RoutingItemDto({
    required String id,
    @Default('') String remark,
    @Default(0) int orderIndex,
    @Default(<RuleItemDto>[]) List<RuleItemDto> rules,
    @Default(true) bool enabled,
    @Default('') String strategy,
    @Default('') String url,
  }) = _RoutingItemDto;

  factory RoutingItemDto.fromJson(Map<String, dynamic> json) =>
      _$RoutingItemDtoFromJson(json);
}
