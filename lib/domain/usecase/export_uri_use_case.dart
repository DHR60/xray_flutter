import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/infra/clipboard_service.dart';
import 'package:xray_flutter/domain/usecase/get_uri_use_case.dart';
import 'package:xray_flutter/infra/clipboard_service_impl.dart';

class ExportUriUseCase {
  final GetUriUseCase _getUriUseCase;

  ExportUriUseCase(this._getUriUseCase);

  Future<Result<void>> call(String profileIndexId) async {
    final sharedUriResult = await _getUriUseCase.call(profileIndexId);
    if (sharedUriResult is Failure) {
      return Failure.from(sharedUriResult as Failure);
    }
    final sharedUri = (sharedUriResult as Success).data;
    ClipboardService clipboardService = ClipboardServiceImpl();
    await clipboardService.copyToClipboard(sharedUri);
    return const Success(null);
  }
}
