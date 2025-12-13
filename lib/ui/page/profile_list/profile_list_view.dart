import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/di/provider.dart';
import 'package:xray_flutter/ui/page/profile_list/profile_list_notifier.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_setting_result.dart';
import 'package:xray_flutter/ui/page/profile_setting/vless_setting_widget.dart';

class ProfileListView extends ConsumerWidget {
  const ProfileListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileListAsync = ref.watch(profileListStreamProvider);
    final profileListState = ref.watch(profileListProvider);
    return profileListAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('加载出错: $err')),
      data: (list) {
        if (list.isEmpty) {
          return const Center(child: Text('无配置'));
        }
        return ReorderableListView.builder(
          buildDefaultDragHandles: false,
          itemCount: list.length,
          itemBuilder: (context, index) {
            final profile = list[index];
            final isSelected =
                profile.indexId == profileListState.activeProfileId;
            return ReorderableDelayedDragStartListener(
              key: ValueKey(profile.indexId),
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
                title: Text(
                  profile.remarks,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : null,
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                ),
                subtitle: Text(profile.configType.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () async {
                        final intent =
                            await Navigator.push<ProfileSettingResult>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VlessSettingWidget(
                                  profile: profile,
                                  isNew: false,
                                ),
                              ),
                            );
                        switch (intent) {
                          case ProfileSettingUpsert(
                            profile: final updatedProfile,
                          ):
                            await ref
                                .read(storeServiceProvider)
                                .upsertProfile(updatedProfile);
                            break;
                          case ProfileSettingDelete(
                            profile: final deletedProfile,
                          ):
                            await ref
                                .read(storeServiceProvider)
                                .deleteProfile(deletedProfile.indexId);
                            break;
                          default:
                            break;
                        }
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        final messenger = ScaffoldMessenger.of(context);
                        try {
                          await ref
                              .read(profileListProvider.notifier)
                              .deleteProfile(profile.indexId);
                        } catch (e) {
                          messenger.showSnackBar(
                            SnackBar(content: Text('删除失败: $e')),
                          );
                        }
                      },
                    ),
                  ],
                ),
                onTap: () {
                  ref
                      .read(profileListProvider.notifier)
                      .updateActiveProfile(profile.indexId);
                },
              ),
            );
          },
          onReorder: (oldIndex, newIndex) {
            ref.read(storeServiceProvider).reorderProfile(oldIndex, newIndex);
          },
        );
      },
    );
  }
}
