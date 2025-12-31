import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_field_editor/json_field_editor.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/di/use_case_provider.dart';
import 'package:xray_flutter/domain/core/result.dart';

class ProfilePreviewView extends ConsumerStatefulWidget {
  final ProfileItemData initialProfile;
  final Stream<ProfileItemData> profileStream;

  const ProfilePreviewView({
    super.key,
    required this.initialProfile,
    required this.profileStream,
  });

  @override
  ConsumerState<ProfilePreviewView> createState() => _ProfilePreviewViewState();
}

class _ProfilePreviewViewState extends ConsumerState<ProfilePreviewView> {
  late final JsonTextFieldController _jsonController;
  late String _sharedUri;

  @override
  void initState() {
    super.initState();
    _jsonController = JsonTextFieldController();
    updateJsonPreview(ref, widget.initialProfile);
    _sharedUri = _getProfileSharedUri(ref, widget.initialProfile) ?? '';
    widget.profileStream.listen((profile) {
      if (!mounted) return;
      updateJsonPreview(ref, profile);
      setState(() {
        _sharedUri = _getProfileSharedUri(ref, profile) ?? '';
      });
    });
  }

  @override
  void dispose() {
    _jsonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ProfileItemData>(
      stream: widget.profileStream,
      builder: (context, snapshot) {
        var profile = widget.initialProfile;
        if (snapshot.hasData) {
          profile = snapshot.data!;
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Profile Name: ${profile.remarks}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16.0),
                JsonField(
                  controller: _jsonController,
                  readOnly: true,
                  isFormatting: true,
                  showErrorMessage: false,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 3,
                ),
                if (_sharedUri.isNotEmpty) ...[
                  const SizedBox(height: 16.0),
                  const Text(
                    '共享链接:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  AspectRatio(
                    aspectRatio: 1,
                    child: PrettyQrView.data(data: _sharedUri),
                  ),
                  const SizedBox(height: 8.0),
                  SelectableText(
                    _sharedUri,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ],
            ),
          );
        }
      },
    );
  }

  void updateJsonPreview(WidgetRef ref, ProfileItemData profile) {
    final getProfileOutboundUseCase = ref.read(
      getProfileOutboundUseCaseProvider,
    );
    final result = getProfileOutboundUseCase.call(profile);
    if (result is Success<String>) {
      _jsonController.text = result.data;
    } else if (result is Failure) {
      _jsonController.text =
          'Error generating preview: ${(result as Failure).toString()}';
    }
  }

  String? _getProfileSharedUri(WidgetRef ref, ProfileItemData profile) {
    final getUriByDataUseCase = ref.read(getUriByDataUseCaseProvider);
    final sharedUriResult = getUriByDataUseCase.call(profile);
    if (sharedUriResult is Failure) {
      return null;
    }
    final sharedUri = (sharedUriResult as Success).data;
    return sharedUri;
  }
}
