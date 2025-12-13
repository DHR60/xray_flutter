import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xray_flutter/di/app_config_provider.dart';
import 'package:xray_flutter/ui/model/profile_filter.dart';

part 'profile_filter_provider.g.dart';

@riverpod
class ProfileFilterNotifier extends _$ProfileFilterNotifier {
  @override
  ProfileFilter build() {
    return ProfileFilter(keyword: '', subId: ref.read(appConfigProvider).stateItem.subId);
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

  void reset() {
    state = ProfileFilter(keyword: '', subId: ref.read(appConfigProvider).stateItem.subId);
  }
}