import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/data/dto/profile_extra_item_dto.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_setting_widget.dart';
import 'package:xray_flutter/ui/page/shared/json_edit_widget.dart';

class CustomSettingWidget extends ConsumerStatefulWidget {
  final ProfileItemData profile;
  final bool isNew;
  final String? subId;

  const CustomSettingWidget({
    super.key,
    required this.profile,
    required this.isNew,
    this.subId,
  });

  @override
  ConsumerState<CustomSettingWidget> createState() =>
      _CustomSettingWidgetState();
}

class _CustomSettingWidgetState extends ConsumerState<CustomSettingWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ProfileExtraItemDto _extraDto;
  late TextEditingController _remarkController;
  late bool _isOutboundOnly;
  late String _customJson;

  @override
  void initState() {
    super.initState();
    if (widget.profile.jsonData.isNotEmpty) {
      _extraDto = ProfileExtraItemDto.fromString(widget.profile.jsonData);
    } else {
      _extraDto = const ProfileExtraItemDto();
    }
    _remarkController = TextEditingController(text: widget.profile.remarks);
    _isOutboundOnly = widget.profile.customOutbound.isNotEmpty;
    _customJson = _isOutboundOnly
        ? widget.profile.customOutbound
        : widget.profile.customConfig;
  }

  @override
  void dispose() {
    _remarkController.dispose();
    super.dispose();
  }

  ProfileItemData _buildProfile() {
    return widget.profile.copyWith(
      remarks: _remarkController.text,
      customConfig: _isOutboundOnly ? '' : _customJson,
      customOutbound: _isOutboundOnly ? _customJson : '',
      jsonData: _extraDto.toString(),
    );
  }

  Widget _buildFormContent(BuildContext context) {
    return Column(
      children: [
        const Text('配置项'),
        TextFormField(
          controller: _remarkController,
          decoration: const InputDecoration(labelText: '配置名称'),
          validator: (value) => value?.isEmpty == true ? '请输入配置名称' : null,
        ),
        const Divider(),
        SwitchListTile(
          title: const Text('仅自定义出站配置'),
          value: _isOutboundOnly,
          onChanged: (value) {
            setState(() {
              _isOutboundOnly = value;
            });
          },
        ),
        ListTile(
          title: const Text('自定义配置内容'),
          subtitle: Text(
            _customJson.isEmpty ? '未设置' : '已设置 ${_customJson.length} 字符',
          ),
          onTap: () async {
            final result = await Navigator.of(context).push<String>(
              MaterialPageRoute(
                builder: (context) =>
                    JsonEditWidget(title: '编辑自定义配置', initialJson: _customJson),
              ),
            );
            if (result != null) {
              setState(() {
                _customJson = result;
              });
            }
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProfileSettingWidget(
      title: 'Custom Setting',
      profile: widget.profile,
      isNew: widget.isNew,
      formKey: _formKey,
      formContent: _buildFormContent(context),
      onBuildProfile: _buildProfile,
      subId: widget.subId,
    );
  }
}
