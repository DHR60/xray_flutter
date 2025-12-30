import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/infra/clipboard_service.dart';
import 'package:xray_flutter/domain/usecase/get_profile_config_use_case.dart';
import 'package:xray_flutter/infra/clipboard_service_impl.dart';

class ExportProfileConfigUseCase {
  final GetProfileConfigUseCase _getProfileConfigUseCase;
  ExportProfileConfigUseCase(this._getProfileConfigUseCase);

  Future<Result<void>> call(String profileIndexId) async {
    try {
      final result = await _getProfileConfigUseCase(profileIndexId);
      if (result is Failure<String>) {
        return Failure.from(result);
      }
      final configString = result is Success<String> ? result.data : '';
      ClipboardService clipboardService = ClipboardServiceImpl();
      await clipboardService.copyToClipboard(
        Utils.prettyJson(configString) ?? configString,
      );
      return const Success(null);
    } catch (e) {
      return Failure(UnexpectedError(e));
    }
  }
}
