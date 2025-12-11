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

  static String generateUUID() {
    var uuid = const Uuid();
    return uuid.v4();
  }
}