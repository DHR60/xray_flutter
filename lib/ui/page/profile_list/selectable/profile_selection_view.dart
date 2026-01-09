import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/data/config/sub_item_dto.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/di/app_config_provider.dart';
import 'package:xray_flutter/di/profile_filter_provider.dart';
import 'package:xray_flutter/di/provider.dart';
import 'package:xray_flutter/ui/model/profile_filter.dart';
import 'package:xray_flutter/ui/page/profile_list/selectable/profile_selection_list_view.dart';
import 'package:xray_flutter/ui/page/profile_list/selectable/sub_selection_list_view.dart';

class ProfileSelectionView extends ConsumerStatefulWidget {
  final bool multiSelect;
  final void Function(Set<String> selectedProfileIds) onSelectionChanged;

  const ProfileSelectionView({
    super.key,
    this.multiSelect = false,
    required this.onSelectionChanged,
  });

  @override
  ConsumerState<ProfileSelectionView> createState() =>
      _ProfileSelectionViewState();
}

class _ProfileSelectionViewState extends ConsumerState<ProfileSelectionView> {
  late Set<String> _selectedProfileIds;
  late ProfileFilter _profileFilter;
  late Stream<List<ProfileItemData>> _profileStream;
  late final List<SubItemDto> _subList;
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _selectedProfileIds = <String>{};
    _profileFilter = ProfileFilter(
      keyword: '',
      subId: ref.read(profileFilterProvider).subId,
    );
    _profileStream = ref
        .read(profileRepoProvider)
        .watchProfiles(
          keyword: _profileFilter.keyword,
          subId: _profileFilter.subId,
        );
    _subList = ref.read(appConfigProvider.select((value) => value.subItems));
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSelectionChanged(Set<String> selectedProfileIds) {
    setState(() {
      _selectedProfileIds = selectedProfileIds;
    });
    widget.onSelectionChanged(_selectedProfileIds);
  }

  void _updateProfileFilter(ProfileFilter newFilter) {
    setState(() {
      _profileFilter = newFilter;
      _profileStream = ref
          .read(profileRepoProvider)
          .watchProfiles(
            keyword: _profileFilter.keyword,
            subId: _profileFilter.subId,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: '搜索配置',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (value) {
            _updateProfileFilter(_profileFilter.copyWith(keyword: value));
          },
        ),
        SizedBox(
          height: 48.0,
          child: SubSelectionListView(
            subList: _subList,
            initialSelectedSubId: _profileFilter.subId,
            onSelectionChanged: (selectedSubId) {
              _updateProfileFilter(
                _profileFilter.copyWith(subId: selectedSubId),
              );
            },
          ),
        ),
        StreamBuilder<List<ProfileItemData>>(
          stream: _profileStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              final profiles = snapshot.data!;
              return Expanded(
                child: ProfileSelectionListView(
                  profiles: profiles,
                  multiSelect: widget.multiSelect,
                  initiallySelectedProfileIds: _selectedProfileIds,
                  onSelectionChanged: _onSelectionChanged,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
