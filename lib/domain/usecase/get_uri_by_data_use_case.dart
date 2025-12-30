import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/handler/fmt/fmt_fact.dart';

class GetUriByDataUseCase {
  GetUriByDataUseCase();

  Result<String> call(ProfileItemData profile) {
    final sharedUriResult = FmtFact.buildSharedUri(profile);
    if (sharedUriResult is Failure) {
      return Failure.from(sharedUriResult as Failure);
    }
    final sharedUri = (sharedUriResult as Success).data;
    return Success(sharedUri);
  }
}
