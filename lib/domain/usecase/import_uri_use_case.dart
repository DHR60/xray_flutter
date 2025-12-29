import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/handler/fmt/fmt_fact.dart';
import 'package:xray_flutter/domain/service/store/store_service.dart';
import 'package:xray_flutter/domain/usecase/upsert_profile_use_case.dart';

class ImportUriUseCase {
  final StoreService _store;

  ImportUriUseCase(this._store);

  Future<List<Result<void>>> call(String uriStr) async {
    final uriList = uriStr
        .replaceAll('\r\n', '\n')
        .split('\n')
        .where((line) => line.trim().isNotEmpty);
    var results = <Result<void>>[];
    for (final uri in uriList) {
      final result = FmtFact.resolveSharedUri(
        uri,
        await _store.generateNewProfile(),
      );
      if (result is Failure) {
        continue;
      }
      final upsertResult = await UpsertProfileUseCase(
        _store,
      ).call((result as Success).data);
      results.add(upsertResult);
    }
    return results;
  }
}
