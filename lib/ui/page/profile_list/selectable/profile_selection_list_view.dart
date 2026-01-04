import 'package:flutter/material.dart';
import 'package:xray_flutter/core/global_const.dart';
import 'package:xray_flutter/data/db/app_database.dart';

class ProfileSelectionListView extends StatefulWidget {
  final bool multiSelect;
  final List<ProfileItemData> profiles;
  final Set<String>? initiallySelectedProfileIds;
  final void Function(Set<String> selectedProfileIds) onSelectionChanged;

  const ProfileSelectionListView({
    super.key,
    this.multiSelect = false,
    required this.profiles,
    this.initiallySelectedProfileIds,
    required this.onSelectionChanged,
  });

  @override
  State<ProfileSelectionListView> createState() =>
      _ProfileSelectionListViewState();
}

class _ProfileSelectionListViewState extends State<ProfileSelectionListView> {
  late Set<String> _selectedProfileIds;

  @override
  void initState() {
    super.initState();
    _selectedProfileIds = widget.initiallySelectedProfileIds != null
        ? Set<String>.from(widget.initiallySelectedProfileIds!)
        : <String>{};
  }

  void _onProfileTap(String profileId) {
    setState(() {
      if (widget.multiSelect) {
        if (_selectedProfileIds.contains(profileId)) {
          _selectedProfileIds.remove(profileId);
        } else {
          _selectedProfileIds.add(profileId);
        }
      } else {
        _selectedProfileIds = {profileId};
      }
    });
    widget.onSelectionChanged(_selectedProfileIds);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.profiles.isEmpty) return const Center(child: Text('无配置'));
    return ListView.builder(
      itemCount: widget.profiles.length,
      itemBuilder: (context, index) {
        final p = widget.profiles[index];
        final selected = _selectedProfileIds.contains(p.indexId);
        return ListTile(
          key: ValueKey(p.indexId),
          leading: widget.multiSelect
              ? Checkbox(
                  value: selected,
                  onChanged: (_) => _onProfileTap(p.indexId),
                )
              : null,
          title: Text(p.remarks),
          subtitle: Text(
            GlobalConst.configTypeNameMap[p.configType] ??
                '未知类型 (${p.configType.name})',
          ),
          selected: selected,
          onTap: () => _onProfileTap(p.indexId),
        );
      },
    );
  }
}
