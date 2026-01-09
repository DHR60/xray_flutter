import 'package:flutter/services.dart';
import 'package:xray_flutter/domain/infra/clipboard_service.dart';

class ClipboardServiceImpl implements ClipboardService {
  @override
  Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Future<String?> pasteFromClipboard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    return data?.text;
  }
}
