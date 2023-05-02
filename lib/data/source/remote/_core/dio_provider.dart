/*
 * File: dio_provider.dart
 * File Created: Friday, 26th August 2022 3:52:57 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Friday, 26th August 2022 3:53:06 pm
 * Modified By: Hieu Tran
 */

import 'dart:io';

import 'package:cat_concierge/data/index.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

import 'pretty_dio_logger.dart';
import 'request_headers_interceptor.dart';

class DioProvider {
  static const String _baseUrl = EnvConfig.BASE_URL;
  static String? get _proxy => EnvConfig.PROXY;
  static bool get _isApiLogger => kDebugMode && EnvConfig.API_LOGGER;

  static Dio? _instance;

  static const int _maxLineWidth = 90;
  static final _prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: kDebugMode,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: _maxLineWidth);

  static final BaseOptions _options = BaseOptions(
    baseUrl: _baseUrl,
    contentType: 'application/json',
    // connectTimeout: 60 * 1000, // 60s
    // receiveTimeout: 60 * 1000, // 60s
  );

  static Dio get httpDio {
    if (_instance == null) {
      _instance = Dio(_options);

      //trungdn: add proxy debugable base on https://flutterigniter.com/debugging-network-requests/
      if (kDebugMode) {
        if (_proxy?.isEmpty ?? true) {
          return _instance!;
        }

        // Tap into the onHttpClientCreate callback
        // to configure the proxy just as we did earlier.
        (_instance!.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (client) {
          // Hook into the findProxy callback to set the client's proxy.
          client.findProxy = (url) {
            return 'PROXY $_proxy';
          };

          // This is a workaround to allow Charles to receive
          // SSL payloads when your app is running on Android.
          client.badCertificateCallback = (X509Certificate cert, String host, int port) => Platform.isAndroid;

          //hieutv: Fix Connection closed before full header was received
          client.maxConnectionsPerHost = 10;

          return client;
        };
      } else {
        //hieutv: Fix Connection closed before full header was received
        (_instance!.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (client) {
          client.maxConnectionsPerHost = 10;

          return client;
        };
      }

      return _instance!;
    } else {
      _instance!.interceptors.clear();
      return _instance!;
    }
  }

  ///returns a Dio client with Access token in header
  static Dio get client => _addInterceptors();

  ///returns a Dio client with Access token in header
  ///Also adds a token refresh interceptor which retry the request when it's unauthorized
  static Dio get tokenClient => _addTokenInterceptors();

  static Dio _addInterceptors() {
    _instance ??= httpDio;
    _instance!.interceptors.clear();
    if (_isApiLogger) _instance!.interceptors.add(_prettyDioLogger);
    return _instance!;
  }

  static Dio _addTokenInterceptors() {
    _instance ??= httpDio;
    _instance!.interceptors.clear();
    _instance!.interceptors.add(RequestHeaderInterceptor());
    if (_isApiLogger) _instance!.interceptors.add(_prettyDioLogger);
    return _instance!;
  }
}
