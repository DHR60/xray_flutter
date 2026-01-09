import 'package:drift/drift.dart';

class ProfileStatItem extends Table {
  late final indexId = text()();
  late final totalUp = int64().clientDefault(() => BigInt.zero)();
  late final totalDown = int64().clientDefault(() => BigInt.zero)();
  late final todayUp = int64().clientDefault(() => BigInt.zero)();
  late final todayDown = int64().clientDefault(() => BigInt.zero)();
  late final dateNow = int64().clientDefault(() => BigInt.zero)();

  @override
  Set<Column<Object>> get primaryKey => {indexId};
}
