import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/handler/fmt/fmt_fact.dart';
import 'package:xray_flutter/domain/service/store/store_service.dart';
import 'package:xray_flutter/domain/usecase/upsert_profile_use_case.dart';

class ImportUriUseCase {
  final StoreService _store;
  final UpsertProfileUseCase _upsertProfileUseCase;

  ImportUriUseCase(this._store, this._upsertProfileUseCase);

  Future<Result<List<ProfileItemData>>> call(
    String uriStr, {
    String? subId,
  }) async {
    try {
      final result = FmtFact.resolveImportData(uriStr);
      if (result is Failure) {
        return Failure.from(result as Failure<dynamic>);
      }
      final dataList = (result as Success<List<ProfileItemData>>).data;
      if (dataList.isEmpty) {
        return Failure(ValidationError('No valid profile found in the data'));
      }
      for (var i = 0; i < dataList.length; i++) {
        dataList[i] = dataList[i].copyWith(
          indexId: Utils.generateUUID(),
          isSub: false,
          subid: subId ?? _store.currentConfig.stateItem.subId,
          remarks: dataList[i].remarks.isNotEmpty
              ? dataList[i].remarks
              : 'Profile ${i + 1}',
        );
      }
      var results = <Result<void>>[];
      for (final data in dataList) {
        final upsertResult = await _upsertProfileUseCase.call(data);
        results.add(upsertResult);
      }
      if (results.any((r) => r is Failure)) {
        final firstFailure =
            results.firstWhere((r) => r is Failure) as Failure<void>;
        return Failure.from(firstFailure);
      }
      return Success(dataList);
    } catch (e) {
      return Failure(UnexpectedError(e));
    }
  }
}
