import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/core/app_initializer.dart';
import 'package:xray_flutter/core/app_runtime.dart';
import 'package:xray_flutter/ui/page/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppRuntime.init();
  await AppInitializer.ensureDefaults();
  runApp(const ProviderScope(child: MyApp()));
}
