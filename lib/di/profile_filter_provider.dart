import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xray_flutter/di/app_config_provider.dart';
import 'package:xray_flutter/ui/model/profile_filter.dart';

part 'profile_filter_provider.g.dart';

@riverpod
class ProfileFilterNotifier extends _$ProfileFilterNotifier {
  @override
  ProfileFilter build() {
    final subId = ref.watch(
      appConfigProvider.select((value) => value.stateItem.subId),
    );
    return ProfileFilter(keyword: '', subId: subId);
  }

  void updateFilter(ProfileFilter newFilter) {
    state = newFilter;
  }

  void updateKeyword(String keyword) {
    state = state.copyWith(keyword: keyword);
  }

  void updateSubId(String subId) {
    state = state.copyWith(subId: subId);
  }
}
