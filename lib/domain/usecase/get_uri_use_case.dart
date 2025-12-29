import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/handler/fmt/fmt_fact.dart';
import 'package:xray_flutter/domain/service/store/store_service.dart';

class GetUriUseCase {
  final StoreService _storeService;

  GetUriUseCase(this._storeService);

  Future<Result<String>> call(String profileIndexId) async {
    final profile = await _storeService.profileRepo.getProfileById(
      profileIndexId,
    );
    if (profile == null) {
      return Failure(ValidationError('指定的配置文件不存在'));
    }
    final sharedUriResult = FmtFact.buildSharedUri(profile);
    if (sharedUriResult is Failure) {
      return Failure.from(sharedUriResult as Failure);
    }
    final sharedUri = (sharedUriResult as Success).data;
    return Success(sharedUri);
  }
}
