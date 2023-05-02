/*
 * File: connection_change_interceptor.dart
 * File Created: Friday, 26th August 2022 9:37:14 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Friday, 26th August 2022 10:15:55 pm
 * Modified By: Hieu Tran
 */

import 'dart:io';

import 'package:dio/dio.dart';

import 'connectivity_request_retrier.dart';

class ConnectionChangeInterceptor extends Interceptor {
  ConnectionChangeInterceptor({
    required ConnectivityRequestRetrier requestRetrier,
  }) : _requestRetrier = requestRetrier;

  final ConnectivityRequestRetrier _requestRetrier;

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      try {
        final response = await _requestRetrier.scheduleRequestRetry(err.requestOptions);
        handler.resolve(response);
      } on DioError catch (dioError) {
        handler.next(dioError);
      } catch (error) {
        handler.next(DioError(requestOptions: err.requestOptions, error: error));
      }
    }
    super.onError(err, handler);
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.unknown && err.error != null && err.error is SocketException;
  }
}
