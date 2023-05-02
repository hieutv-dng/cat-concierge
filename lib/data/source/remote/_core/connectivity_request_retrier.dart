/*
 * File: connectivity_request_retrier.dart
 * File Created: Friday, 26th August 2022 9:31:04 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Friday, 26th August 2022 10:16:03 pm
 * Modified By: Hieu Tran
 */

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class ConnectivityRequestRetrier {
  ConnectivityRequestRetrier({
    required Dio dio,
    required Connectivity connectivity,
  })  : _dio = dio,
        _connectivity = connectivity;

  final Dio _dio;
  final Connectivity _connectivity;

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    late StreamSubscription streamSubscription;
    final responseCompleter = Completer<Response>();

    streamSubscription = _connectivity.onConnectivityChanged.listen(
      (connectivityResult) {
        if (connectivityResult != ConnectivityResult.none) {
          streamSubscription.cancel();
          responseCompleter.complete(
            _dio.request(
              requestOptions.path,
              cancelToken: requestOptions.cancelToken,
              data: requestOptions.data,
              onReceiveProgress: requestOptions.onReceiveProgress,
              onSendProgress: requestOptions.onSendProgress,
              queryParameters: requestOptions.queryParameters,
              options: Options(
                headers: requestOptions.headers,
                method: requestOptions.method,
              ),
            ),
          );
        }
      },
    );

    return responseCompleter.future;
  }
}
