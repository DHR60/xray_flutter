import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/di/app_config_provider.dart';
import 'package:xray_flutter/di/profile_filter_provider.dart';
import 'package:xray_flutter/di/provider.dart';

part 'profile_list_notifier.freezed.dart';
part 'profile_list_notifier.g.dart';

/// Stream provider that watches database changes reactively
final profileListStreamProvider =
    StreamProvider.autoDispose<List<ProfileItemData>>((ref) {
      final profileFilter = ref.watch(profileFilterProvider);
      final repo = ref.watch(profileRepoProvider);

      return repo.watchProfiles(
        keyword: profileFilter.keyword,
        subId: profileFilter.subId,
      );
    });

@freezed
abstract class ProfileListState with _$ProfileListState {
  const factory ProfileListState({required String activeProfileId}) =
      _ProfileListState;
}

/// Notifier for profile operations (delete, etc.)
@riverpod
class ProfileListNotifier extends _$ProfileListNotifier {
  @override
  ProfileListState build() {
    var stateItem = ref.watch(
      appConfigProvider.select((value) => value.stateItem),
    );
    String activeProfileId = stateItem.profileId;

    return ProfileListState(activeProfileId: activeProfileId);
  }

  Future<void> deleteProfile(String indexId) async {
    await ref.read(storeServiceProvider).deleteProfile(indexId);
    // Stream will automatically update
  }

  Future<void> updateActiveProfile(String newActiveProfileId) async {
    await ref
        .read(storeServiceProvider)
        .updateActiveProfile(newActiveProfileId);
  }
}
