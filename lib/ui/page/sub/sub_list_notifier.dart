import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xray_flutter/di/app_config_provider.dart';
import 'package:xray_flutter/data/config/sub_item_dto.dart';
import 'package:xray_flutter/di/provider.dart';

part 'sub_list_notifier.freezed.dart';
part 'sub_list_notifier.g.dart';

@freezed
abstract class SubListState with _$SubListState {
  const factory SubListState({
    required List<SubItemDto> subList,
    required String activeSubId,
  }) = _SubListState;
}

@riverpod
class SubListNotifier extends _$SubListNotifier {
  @override
  SubListState build() {
    final subs = ref.watch(appConfigProvider.select((value) => value.subItems));

    final activeSubId = ref.watch(
      appConfigProvider.select((value) => value.stateItem.subId),
    );

    return SubListState(subList: subs, activeSubId: activeSubId);
  }

  Future<void> updateActiveSub(String newActiveSubId) async {
    var config = ref.read(appConfigProvider);

    if (config.subItems.isNotEmpty &&
        newActiveSubId != config.stateItem.subId) {
      await ref.read(storeServiceProvider).updateActiveSub(newActiveSubId);
    }
    state = state.copyWith(activeSubId: newActiveSubId);
  }
}
