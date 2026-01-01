import 'package:freezed_annotation/freezed_annotation.dart';

part 'rule_item_dto.freezed.dart';
part 'rule_item_dto.g.dart';

@freezed
abstract class RuleItemDto with _$RuleItemDto {
  const factory RuleItemDto({
    required String id,
    @Default(0) int orderIndex,
    @Default('all') String ruleType,
    @Default('') String outboundTag,
    @Default('') String inboundTag,
    @Default('') String ip,
    @Default('') String domain,
    @Default('') String port,
    @Default('') String network,
    @Default('') String protocol,
    @Default('') String remark,
    @Default(true) bool enabled,
  }) = _RuleItemDto;

  factory RuleItemDto.fromJson(Map<String, dynamic> json) =>
      _$RuleItemDtoFromJson(json);
}
