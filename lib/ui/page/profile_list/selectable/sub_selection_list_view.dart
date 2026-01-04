import 'package:flutter/material.dart';
import 'package:xray_flutter/data/config/sub_item_dto.dart';

class SubSelectionListView extends StatefulWidget {
  final List<SubItemDto> subList;
  final String? initialSelectedSubId;
  final void Function(String selectedSubId) onSelectionChanged;

  const SubSelectionListView({
    super.key,
    required this.subList,
    this.initialSelectedSubId,
    required this.onSelectionChanged,
  });

  @override
  State<SubSelectionListView> createState() => _SubSelectionListViewState();
}

class _SubSelectionListViewState extends State<SubSelectionListView> {
  late String _selectedSubId;

  @override
  void initState() {
    super.initState();
    _selectedSubId = widget.initialSelectedSubId ?? widget.subList.first.subId;
  }

  void _onSubSelected(SubItemDto subItem) {
    setState(() {
      _selectedSubId = subItem.subId;
    });
    widget.onSelectionChanged(_selectedSubId);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.subList.length,
      itemBuilder: (context, index) {
        final subItem = widget.subList[index];
        final isSelected = subItem.subId == _selectedSubId;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ChoiceChip(
            label: Text(subItem.subName),
            selected: isSelected,
            onSelected: (_) => _onSubSelected(subItem),
          ),
        );
      },
    );
  }
}
