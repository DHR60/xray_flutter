import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/service/store/store_service.dart';
import 'package:xray_flutter/domain/usecase/get_uri_by_data_use_case.dart';

class GetUriUseCase {
  final StoreService _storeService;
  final GetUriByDataUseCase _getUriByDataUseCase;

  GetUriUseCase(this._storeService, this._getUriByDataUseCase);

  Future<Result<String>> call(String profileIndexId) async {
    final profile = await _storeService.profileRepo.getProfileById(
      profileIndexId,
    );
    if (profile == null) {
      return Failure(ValidationError('指定的配置文件不存在'));
    }
    return _getUriByDataUseCase.call(profile);
  }
}
