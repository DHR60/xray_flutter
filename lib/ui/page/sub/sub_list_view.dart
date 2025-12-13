import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/di/app_config_provider.dart';
import 'package:xray_flutter/ui/page/sub/sub_list_notifier.dart';

class SubListView extends ConsumerWidget {
  const SubListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subState = ref.watch(subListProvider);
    return ReorderableListView.builder(
      scrollDirection: Axis.horizontal,
      buildDefaultDragHandles: false,
      itemCount: subState.subList.length,
      itemBuilder: (context, index) {
        final subItem = subState.subList[index];
        final isSelected = subItem.subId == subState.activeSubId;
        return ReorderableDelayedDragStartListener(
          key: ValueKey(subItem.subId),
          index: index,
          child: Ink(
            color: isSelected
                ? Theme.of(context).colorScheme.primary.withAlpha(25)
                : null,
            child: InkWell(
              onTap: () {
                ref
                    .read(subListProvider.notifier)
                    .updateActiveSub(subItem.subId);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: Text(
                    subItem.subName,
                    style: TextStyle(
                      fontWeight: isSelected ? FontWeight.bold : null,
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      onReorder: (oldIndex, newIndex) {
        ref
            .read(appConfigProvider.notifier)
            .reorderSubItems(oldIndex, newIndex);
      },
    );
  }
}
