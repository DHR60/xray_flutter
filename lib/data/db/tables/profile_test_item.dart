import 'package:drift/drift.dart';

class ProfileTestItem extends Table {
  late final indexId = text()();
  late final testTime = text()();
  late final latency = text().clientDefault(() => '')();
  late final speed = text().clientDefault(() => '')();
  late final testResult = text().clientDefault(() => '')();

  @override
  Set<Column<Object>> get primaryKey => {indexId};
}
