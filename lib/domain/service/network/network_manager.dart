import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:xray_flutter/core/global_const.dart';

class NetworkManager {
  final int Function() proxyPortProvider;
  final bool Function() isProxyEnabledProvider;

  late final Dio dio;

  NetworkManager({
    required this.proxyPortProvider,
    required this.isProxyEnabledProvider,
  }) {
    dio = Dio();
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.findProxy = (uri) {
          if (isProxyEnabledProvider()) {
            final port = proxyPortProvider();
            return "PROXY ${GlobalConst.loopbackAddress}:$port";
          }
          return "DIRECT";
        };
        return client;
      },
    );
  }

  Future<Response<T>> getAsync<T>(
    String url, {
    Map<String, String>? header,
    int? timeout,
  }) async {
    final options = Options(headers: header);
    try {
      final future = dio.get<T>(url, options: options);
      if (timeout != null && timeout > 0) {
        return await future.timeout(Duration(milliseconds: timeout));
      }
      return await future;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> postAsync<T>(
    String url, {
    Map<String, String>? header,
    dynamic data,
    int? timeout,
  }) async {
    final options = Options(headers: header);
    try {
      final future = dio.post<T>(url, data: data, options: options);
      if (timeout != null && timeout > 0) {
        return await future.timeout(Duration(milliseconds: timeout));
      }
      return await future;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> getRealMuxDelay() async {
    final rmdDio = Dio();
    rmdDio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.findProxy = (uri) {
          if (isProxyEnabledProvider()) {
            final port = proxyPortProvider();
            return "PROXY ${GlobalConst.loopbackAddress}:$port";
          }
          return "DIRECT";
        };
        client.idleTimeout = const Duration(seconds: 10);
        return client;
      },
    );
    const testCount = 3;
    final delayList = List<int?>.filled(3, null, growable: false);
    for (int i = 0; i < testCount; i++) {
      try {
        final sw = Stopwatch()..start();
        final response = await rmdDio.get<String>(
          'https://www.google.com/generate_204',
        );
        sw.stop();
        if (response.statusCode != 204) {
          delayList[i] = null;
          continue;
        }
        delayList[i] = sw.elapsedMilliseconds;
      } catch (e) {
        delayList[i] = null;
      }
    }
    final validDelays = delayList
        .where((element) => element != null)
        .cast<int>()
        .toList();
    if (validDelays.isEmpty) {
      return -1;
    }
    final minDelay = validDelays.reduce((a, b) => a < b ? a : b);
    return minDelay;
  }
}
