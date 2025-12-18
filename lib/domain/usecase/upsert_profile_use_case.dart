import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/service/store/store_service.dart';

class UpsertProfileUseCase {
  final StoreService _store;

  UpsertProfileUseCase(this._store);

  Future<Result<void>> call(ProfileItemData profile) async {
    if (profile.address.isEmpty) {
      return Failure(ValidationError('地址不能为空'));
    }
    if (profile.port <= 0 || profile.port > 65535) {
      return Failure(ValidationError('端口号无效'));
    }

    try {
      await _store.upsertProfile(profile);
    } catch (e) {
      return Failure(UnexpectedError(e));
    }

    return const Success(null);
  }
}
