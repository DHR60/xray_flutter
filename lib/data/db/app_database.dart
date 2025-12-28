import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/db/tables/profile_item.dart';
import 'package:xray_flutter/core/enum/config_type.dart';
import 'package:xray_flutter/core/enum/core_type.dart';
import 'package:xray_flutter/data/db/tables/profile_stat_item.dart';
import 'package:xray_flutter/data/db/tables/profile_test_item.dart';

part 'app_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await Utils.getDataDirectory();
    final file = File(p.join(dbFolder.path, 'database.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [
  ProfileItem,
  ProfileTestItem,
  ProfileStatItem,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? e]) : super(e ?? _openConnection());

  @override
  int get schemaVersion => 1;
}