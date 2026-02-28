import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

/// Stores a UUID string as a 16-byte BLOB in the database for
/// faster index lookups while keeping [String] on the Dart side.
class UuidBlobConverter extends TypeConverter<String, Uint8List> {
  const UuidBlobConverter();

  @override
  String fromSql(Uint8List fromDb) {
    return Uuid.unparse(fromDb);
  }

  @override
  Uint8List toSql(String value) {
    return Uint8List.fromList(Uuid.parse(value));
  }
}
