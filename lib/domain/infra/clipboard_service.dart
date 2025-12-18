abstract class ClipboardService {
  Future<void> copyToClipboard(String text);
  Future<String?> pasteFromClipboard();
}