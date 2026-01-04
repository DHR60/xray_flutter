import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:xray_flutter/core/global_const.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/di/provider.dart';
import 'package:xray_flutter/di/profile_filter_provider.dart';
import 'package:xray_flutter/di/use_case_provider.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/ui/page/profile_list/profile_list_notifier.dart';
import 'package:xray_flutter/ui/page/profile_setting/profile_fact_setting_widget.dart';
import 'package:xray_flutter/ui/page/profile_setting/profile_setting_result.dart';

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
                subtitle: Text(
                  GlobalConst.configTypeNameMap[profile.configType] ??
                      '未知类型 (${profile.configType.name})',
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () async {
                        final intent =
                            await Navigator.push<ProfileSettingResult>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileFactSettingWidget(
                                  configType: profile.configType,
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
                                .read(upsertProfileUseCaseProvider)
                                .call(updatedProfile);
                            break;
                          case ProfileSettingDelete(
                            profile: final deletedProfile,
                          ):
                            await ref
                                .read(deleteProfileUseCaseProvider)
                                .call(deletedProfile.indexId);
                            break;
                          default:
                            break;
                        }
                      },
                      icon: const Icon(Icons.edit),
                      tooltip: '编辑配置',
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {
                        _showProfileOptions(context, ref, profile);
                      },
                      tooltip: '更多选项',
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
                      tooltip: '删除配置',
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
            final filter = ref.read(profileFilterProvider);
            ref
                .read(storeServiceProvider)
                .reorderProfile(
                  oldIndex,
                  newIndex,
                  keyword: filter.keyword,
                  subId: filter.subId,
                );
          },
        );
      },
    );
  }

  Future<void> _showProfileOptions(
    BuildContext context,
    WidgetRef ref,
    ProfileItemData profile,
  ) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 12),
                    height: 4,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.qr_code),
                    title: Text('二维码'),
                    onTap: () async {
                      Navigator.pop(context);
                      await _showQRCode(context, ref, profile);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.share),
                    title: Text('导出分享链接到剪贴板'),
                    onTap: () async {
                      Navigator.pop(context);
                      final messenger = ScaffoldMessenger.of(context);
                      final result = await ref
                          .read(exportUriUseCaseProvider)
                          .call(profile.indexId);
                      if (result is Success<void>) {
                        messenger.showSnackBar(
                          const SnackBar(content: Text('分享链接已复制到剪贴板')),
                        );
                      } else if (result is Failure<void>) {
                        messenger.showSnackBar(
                          SnackBar(content: Text('导出失败: ${result.error}')),
                        );
                      }
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.file_copy),
                    title: const Text('导出配置到剪贴板'),
                    onTap: () async {
                      Navigator.pop(context);
                      final messenger = ScaffoldMessenger.of(context);
                      final result = await ref
                          .read(exportProfileConfigUseCaseProvider)
                          .call(profile.indexId);
                      if (result is Success<void>) {
                        messenger.showSnackBar(
                          const SnackBar(content: Text('配置已复制到剪贴板')),
                        );
                      } else if (result is Failure<void>) {
                        messenger.showSnackBar(
                          SnackBar(content: Text('导出失败: ${result.error}')),
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _showQRCode(
    BuildContext context,
    WidgetRef ref,
    ProfileItemData profile,
  ) async {
    final getUriUseCase = ref.read(getUriUseCaseProvider);
    final sharedUriResult = await getUriUseCase.call(profile.indexId);
    if (sharedUriResult is Failure) {
      if (context.mounted == false) return;
      final messenger = ScaffoldMessenger.of(context);
      messenger.showSnackBar(
        SnackBar(
          content: Text('生成分享链接失败: ${(sharedUriResult as Failure).toString()}'),
        ),
      );
      return;
    }
    final sharedUri = (sharedUriResult as Success).data;
    if (context.mounted == false) return;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(child: Icon(Icons.qr_code)),
          content: SizedBox(
            width: 300,
            height: 300,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    profile.remarks,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: PrettyQrView.data(data: sharedUri),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('关闭'),
            ),
          ],
        );
      },
    );
  }
}
