import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/service/store/store_service.dart';

class DeleteProfileUseCase {
  final StoreService _storeService;

  DeleteProfileUseCase(this._storeService);

  Future<Result<void>> call(String profileId) async {
    try {
      await _storeService.deleteProfile(profileId);
      return const Success(null);
    } catch (e) {
      return Failure(UnexpectedError(e));
    }
  }
}