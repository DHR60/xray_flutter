import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/data/config/sub_item_dto.dart';
import 'package:xray_flutter/ui/page/sub/sub_setting_result.dart';

class SubSettingWidget extends ConsumerStatefulWidget {
  const SubSettingWidget({
    super.key,
    required this.subItem,
    required this.isNew,
  });

  final SubItemDto subItem;
  final bool isNew;

  @override
  ConsumerState<SubSettingWidget> createState() => _SubSettingWidgetState();
}

class _SubSettingWidgetState extends ConsumerState<SubSettingWidget> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _urlController;
  late TextEditingController _uaController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.subItem.subName);
    _urlController = TextEditingController(text: widget.subItem.subUrl);
    _uaController = TextEditingController(text: widget.subItem.userAgent);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _urlController.dispose();
    _uaController.dispose();
    super.dispose();
  }

  SubItemDto _updateSubItem() {
    return widget.subItem.copyWith(
      subName: _nameController.text,
      subUrl: _urlController.text,
      userAgent: _uaController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isNew ? 'Add Sub Item' : 'Edit Sub Item'),
        actions: [
          if (!widget.isNew)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                Navigator.pop(context, SubSettingDelete(_updateSubItem()));
              },
              tooltip: '删除订阅',
            ),
          IconButton(
            onPressed: () {
              Navigator.pop(context, SubSettingUpsert(_updateSubItem()));
            },
            icon: const Icon(Icons.save),
            tooltip: '保存订阅',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Sub Name'),
              ),
              TextFormField(
                controller: _urlController,
                decoration: const InputDecoration(labelText: 'Sub URL'),
              ),
              TextFormField(
                controller: _uaController,
                decoration: const InputDecoration(labelText: 'User Agent'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
