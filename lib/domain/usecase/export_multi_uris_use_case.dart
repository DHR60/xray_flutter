import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/infra/clipboard_service.dart';
import 'package:xray_flutter/domain/usecase/get_uri_use_case.dart';
import 'package:xray_flutter/infra/clipboard_service_impl.dart';

class ExportMultiUrisUseCase {
  final GetUriUseCase _getUriUseCase;

  ExportMultiUrisUseCase(this._getUriUseCase);

  Future<Result<void>> call(List<String> profileIds) async {
    try {
      final uris = <String>[];
      for (final profileId in profileIds) {
        final result = await _getUriUseCase(profileId);
        if (result is Success<String>) {
          uris.add(result.data);
        } else {
          return Failure.from(result as Failure);
        }
      }
      final buffer = StringBuffer();
      for (final uri in uris) {
        buffer.writeln(uri);
      }
      final exportedUris = buffer.toString().trim();
      ClipboardService clipboardService = ClipboardServiceImpl();
      await clipboardService.copyToClipboard(exportedUris);
      return Success(null);
    } catch (e) {
      return Failure(UnexpectedError(e));
    }
  }
}
