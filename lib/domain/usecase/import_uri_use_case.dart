import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/handler/fmt/fmt_fact.dart';
import 'package:xray_flutter/domain/service/store/store_service.dart';
import 'package:xray_flutter/domain/usecase/upsert_profile_use_case.dart';

class ImportUriUseCase {
  final StoreService _store;

  ImportUriUseCase(this._store);

  Future<Result<void>> call(String uriStr) async {
    final result = FmtFact.resolveSharedUri(
      uriStr,
      await _store.generateNewProfile(),
    );
    if (result is Failure) {
      return Failure.from(result as Failure);
    }
    return UpsertProfileUseCase(_store).call((result as Success).data);
  }
}
