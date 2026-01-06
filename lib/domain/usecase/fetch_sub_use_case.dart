import 'dart:convert';
import 'dart:typed_data';

import 'package:xray_flutter/core/utils.dart';
import 'package:xray_flutter/data/db/app_database.dart';
import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/handler/fmt/fmt_fact.dart';
import 'package:xray_flutter/domain/service/network/network_manager.dart';
import 'package:xray_flutter/domain/service/store/store_service.dart';

class FetchSubUseCase {
  final NetworkManager _networkManager;
  final StoreService _store;

  FetchSubUseCase(this._networkManager, this._store);

  Future<Result<List<ProfileItemData>>> call(String subIndexId) async {
    try {
      final subItem = _store.currentConfig.subItems.firstWhere(
        (item) => item.subId == subIndexId,
      );
      // TODO: default ua with app version and platform info
      final response = await _networkManager.getAsync(
        subItem.subUrl!,
        header: {
          'User-Agent': subItem.userAgent?.isNotEmpty == true
              ? subItem.userAgent!
              : 'XRayFlutterApp',
        },
      );
      if (response.statusCode != 200) {
        return Failure(
          NetworkError(
            'Failed to fetch subscription: HTTP ${response.statusCode}',
          ),
        );
      }
      final data = response.data;
      String body;
      if (data is String) {
        body = data;
      } else if (data is List<int>) {
        body = utf8.decode(data);
      } else if (data is Uint8List) {
        body = utf8.decode(data);
      } else {
        body = data?.toString() ?? '';
      }

      final result = FmtFact.resolveImportData(body);
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
          isSub: true,
          subid: subIndexId,
        );
      }
      final list = await _store.profileRepo.updateProfilesFromSubscription(
        dataList,
        subIndexId,
      );
      if (list.isNotEmpty) {
        return Success(list);
      } else {
        return Failure(
          UnexpectedError('Profile import failed for unknown reason'),
        );
      }
    } catch (e) {
      return Failure(UnexpectedError(e));
    }
  }
}
