import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xray_flutter/data/config/core/core_item_dto.dart';
import 'package:xray_flutter/di/app_config_provider.dart';

part 'setting_notifier.g.dart';

@riverpod
class SettingNotifier extends _$SettingNotifier {
  @override
  CoreItemDto build() {
    final coreItem = ref.watch(
      appConfigProvider.select((appConfig) => appConfig.coreItem),
    );
    return coreItem;
  }

  Future updateCoreItem(CoreItemDto newCoreItem) async {
    final appConfigNotifier = ref.read(appConfigProvider.notifier);
    await appConfigNotifier.update(
      appConfigNotifier.state.copyWith(coreItem: newCoreItem),
    );
  }
}
