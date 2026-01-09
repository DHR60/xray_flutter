import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xray_flutter/data/config/routing_item_dto.dart';
import 'package:xray_flutter/di/app_config_provider.dart';
import 'package:xray_flutter/di/provider.dart';
import 'package:xray_flutter/ui/page/routing/routing_setting_widget.dart';

part 'routing_list_notifier.freezed.dart';
part 'routing_list_notifier.g.dart';

@freezed
abstract class RoutingListState with _$RoutingListState {
  const factory RoutingListState({
    required List<RoutingItemDto> items,
    required String activeRoutingId,
  }) = _RoutingListState;
}

@riverpod
class RoutingListNotifier extends _$RoutingListNotifier {
  @override
  RoutingListState build() {
    final items = ref.watch(
      appConfigProvider.select((value) => value.routingItems),
    );
    final activeRoutingId = ref.watch(
      appConfigProvider.select((value) => value.stateItem.routingId),
    );
    return RoutingListState(items: items, activeRoutingId: activeRoutingId);
  }

  Future<void> updateActiveRouting(String newActiveRoutingId) async {
    ref.read(storeServiceProvider).updateActiveRouting(newActiveRoutingId);
    state = state.copyWith(activeRoutingId: newActiveRoutingId);
  }

  Future<void> upsertRouting(RoutingItemDto routingItem) async {
    await ref.read(storeServiceProvider).upsertRoutingItem(routingItem);
  }

  Future<void> deleteRouting(String routingId) async {
    await ref.read(storeServiceProvider).deleteRoutingItemById(routingId);
  }

  Future<void> handleRoutingSettingResult(RoutingSettingResult? intent) async {
    if (intent is RoutingSettingUpsert) {
      await upsertRouting(intent.routingItem);
    } else if (intent is RoutingSettingDelete) {
      await deleteRouting(intent.routingItem.id);
    }
  }
}
