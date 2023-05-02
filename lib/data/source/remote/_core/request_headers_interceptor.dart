/*
 * File: request_headers_interceptor.dart
 * File Created: Friday, 26th August 2022 10:12:25 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Friday, 26th August 2022 10:15:33 pm
 * Modified By: Hieu Tran
 */

import 'package:dio/dio.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  RequestHeaderInterceptor();

  // final _authRepository = Get.find<AuthRepository>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {
    final customHeaders = {'content-type': 'application/json'};
    // final accessToken = _authRepository.currentUserToken;
    // customHeaders.addAll({'unitcode': '${EnvConfig.DF_FLAVOR.toUpperCase()}'});
    // if (accessToken?.isNotEmpty ?? false) customHeaders.addAll({'Authorization': 'Bearer $accessToken'});
    return customHeaders;
  }
}
