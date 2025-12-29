import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/handler/fmt/fmt_fact.dart';
import 'package:xray_flutter/domain/infra/clipboard_service.dart';
import 'package:xray_flutter/domain/service/store/store_service.dart';
import 'package:xray_flutter/infra/clipboard_service_impl.dart';

class ExportUriUseCase {
  final StoreService _storeService;

  ExportUriUseCase(this._storeService);

  Future<Result<void>> call(String profileIndexId) async {
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
    ClipboardService clipboardService = ClipboardServiceImpl();
    await clipboardService.copyToClipboard(sharedUri);
    return const Success(null);
  }
}
