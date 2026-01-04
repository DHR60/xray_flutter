import 'package:xray_flutter/domain/core/domain_error.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/domain/service/network/network_manager.dart';

class GetIpUseCase {
  final NetworkManager _networkManager;

  GetIpUseCase(this._networkManager);

  Future<Result<String>> call() async {
    try {
      final response = await _networkManager.getAsync<String>(
        'https://www.cloudflare.com/cdn-cgi/trace',
        timeout: 5000,
      );
      if (response.statusCode == 200) {
        final body = response.data ?? '';
        final lines = body.split('\n');
        for (final line in lines) {
          if (line.startsWith('ip=')) {
            return Success(line.substring(3).trim());
          }
        }
        return Failure(UnexpectedError('无法解析IP地址'));
      } else {
        return Failure(UnexpectedError('请求失败，状态码：${response.statusCode}'));
      }
    } catch (e) {
      return Failure(UnexpectedError(e));
    }
  }
}
