import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';

class Utils {
  static Future<Directory> getTargetDirectory() async {
    if (Platform.isWindows) {
      return File(Platform.resolvedExecutable).parent;
    } else {
      final directory = await getApplicationDocumentsDirectory();
      return directory;
    }
  }

  static Future<Directory> getTemporaryDirectory() async {
    final directory = await getTargetDirectory();
    final tempDir = Directory(p.join(directory.path, 'temp'));
    if (!await tempDir.exists()) {
      await tempDir.create(recursive: true);
    }
    return tempDir;
  }

  static Future<Directory> getDataDirectory() async {
    final directory = await getTargetDirectory();
    final dataDir = Directory(p.join(directory.path, 'data'));
    if (!await dataDir.exists()) {
      await dataDir.create(recursive: true);
    }
    return dataDir;
  }

  static Future<Directory> getBinDirectory() async {
    final directory = await getTargetDirectory();
    final binDir = Directory(p.join(directory.path, 'bin'));
    if (!await binDir.exists()) {
      await binDir.create(recursive: true);
    }
    return binDir;
  }

  static Future<Directory> getBinConfigDirectory() async {
    final binDir = await getBinDirectory();
    final configDir = Directory(p.join(binDir.path, 'config'));
    if (!await configDir.exists()) {
      await configDir.create(recursive: true);
    }
    return configDir;
  }

  static String generateUUID() {
    var uuid = const Uuid();
    return uuid.v4();
  }

  static String? prettyJson(String jsonString) {
    try {
      final jsonObject = jsonString.isNotEmpty ? jsonDecode(jsonString) : {};
      final encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(jsonObject);
    } catch (e) {
      return null; // Return original string if parsing fails
    }
  }

  static String toJsonString(Map<String, dynamic> jsonMap) {
    return jsonEncode(jsonMap);
  }

  static Map<String, dynamic>? fromJsonString(String jsonString) {
    try {
      final decoded = jsonDecode(jsonString);
      if (decoded is Map<String, dynamic>) {
        return decoded;
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  static List<String> splitRules(String rulesString) {
    return rulesString
        .replaceAll('\r', '')
        .replaceAll('\n', '')
        .split(',')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList();
  }

  static String convert2Comma(String str) {
    return str.replaceAll('，', ',').replaceAll('\n', ',').replaceAll('\r', ',');
  }

  static List<String> normalizeRulesToList(String str) {
    return convert2Comma(
      str,
    ).split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
  }

  static String normalizeRulesToString(String str) {
    final list = normalizeRulesToList(str);
    return list.join(',');
  }

  static bool isIPv6(String str) {
    final address = InternetAddress.tryParse(str);
    return address?.type == InternetAddressType.IPv6;
  }

  static bool isDomain(String str) {
    if (InternetAddress.tryParse(str) != null) {
      return false;
    }
    final regex = RegExp(
      r'^([a-zA-Z0-9]([a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,}$',
    );
    return regex.hasMatch(str);
  }

  static String base64Encode(String input) {
    final bytes = utf8.encode(input);
    return base64Url.encode(bytes);
  }

  static String? base64Decode(String input) {
    try {
      final bytes = base64Url.decode(input);
      return utf8.decode(bytes);
    } catch (_) {
      return null;
    }
  }

  static String base64EncodeUrlSafe(String input) {
    final bytes = utf8.encode(input);
    return base64Url.encode(bytes);
  }

  static String? base64DecodeUrlSafe(String input) {
    try {
      String normalized = input;
      final remainder = input.length % 4;
      if (remainder > 0) {
        normalized += '=' * (4 - remainder);
      }
      final bytes = base64Url.decode(normalized);
      return utf8.decode(bytes);
    } catch (_) {
      return null;
    }
  }
}
