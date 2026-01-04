import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/di/app_config_provider.dart';
import 'package:xray_flutter/ui/page/routing/routing_list_notifier.dart';
import 'package:xray_flutter/ui/page/routing/routing_setting_widget.dart';

class RoutingListWidget extends ConsumerWidget {
  const RoutingListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routingListState = ref.watch(routingListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final result = await Navigator.push<RoutingSettingResult>(
                context,
                MaterialPageRoute(
                  builder: (context) => RoutingSettingWidget(
                    isNew: true,
                    routingItem: ref
                        .read(appConfigProvider.notifier)
                        .manager
                        .generateNewRoutingItem(),
                  ),
                ),
              );
              ref
                  .read(routingListProvider.notifier)
                  .handleRoutingSettingResult(result);
            },
            tooltip: '添加路由',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ReorderableListView.builder(
              buildDefaultDragHandles: false,
              itemCount: routingListState.items.length,
              itemBuilder: (context, index) {
                final routingItem = routingListState.items[index];
                final isSelected =
                    routingItem.id == routingListState.activeRoutingId;
                return ReorderableDelayedDragStartListener(
                  key: ValueKey(routingItem.id),
                  index: index,
                  child: ListTile(
                    selected: isSelected,
                    selectedTileColor: Theme.of(
                      context,
                    ).colorScheme.primary.withAlpha(25),
                    leading: ReorderableDragStartListener(
                      index: index,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.drag_handle, color: Colors.grey),
                      ),
                    ),
                    title: Text(routingItem.remark),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () async {
                            final result =
                                await Navigator.push<RoutingSettingResult>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RoutingSettingWidget(
                                      isNew: false,
                                      routingItem: routingItem,
                                    ),
                                  ),
                                );
                            ref
                                .read(routingListProvider.notifier)
                                .handleRoutingSettingResult(result);
                          },
                          tooltip: '编辑路由',
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            ref
                                .read(routingListProvider.notifier)
                                .deleteRouting(routingItem.id);
                          },
                          tooltip: '删除路由',
                        ),
                      ],
                    ),
                    onTap: () {
                      ref
                          .read(routingListProvider.notifier)
                          .updateActiveRouting(routingItem.id);
                    },
                  ),
                );
              },
              onReorder: (oldIndex, newIndex) {
                ref
                    .read(appConfigProvider.notifier)
                    .reorderRoutingItems(oldIndex, newIndex);
              },
            ),
          ),
        ],
      ),
    );
  }
}
