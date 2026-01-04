import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/di/use_case_provider.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/ui/page/profile_list/selectable/profile_selection_view.dart';

class ProfilePickerWidget extends ConsumerStatefulWidget {
  const ProfilePickerWidget({super.key});

  @override
  ConsumerState<ProfilePickerWidget> createState() =>
      _ProfilePickerWidgetState();
}

class _ProfilePickerWidgetState extends ConsumerState<ProfilePickerWidget> {
  Set<String> _selectedProfileIds = <String>{};

  bool _checkSelected() {
    if (_selectedProfileIds.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请先选择至少一个配置文件')));
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('选择配置文件'),
        actions: [
          IconButton(
            onPressed: () async {
              if (!_checkSelected()) return;
              final result = await ref
                  .read(exportMultiUrisUseCaseProvider)
                  .call(_selectedProfileIds.toList());
              if (!context.mounted) return;
              if (result is Success<void>) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('配置文件链接已复制到剪贴板')));
              } else if (result is Failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('导出失败: ${result.toString()}')),
                );
              }
            },
            icon: Icon(Icons.share),
            tooltip: '导出选中配置分享链接',
          ),
        ],
      ),
      body: ProfileSelectionView(
        multiSelect: true,
        onSelectionChanged: (Set<String> selectedProfileIds) {
          _selectedProfileIds = selectedProfileIds;
        },
      ),
    );
  }
}
