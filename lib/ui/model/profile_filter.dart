import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_filter.freezed.dart';

@freezed
abstract class ProfileFilter with _$ProfileFilter {
  const factory ProfileFilter({
    required String keyword,
    required String subId,
  }) = _ProfileFilter;
}