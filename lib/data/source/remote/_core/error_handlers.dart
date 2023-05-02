/*
 * File: error_handlers.dart
 * File Created: Friday, 26th August 2022 10:17:47 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Friday, 26th August 2022 10:18:06 pm
 * Modified By: Hieu Tran
 */

import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import 'exceptions/api_exception.dart';
import 'exceptions/app_exception.dart';
import 'exceptions/network_exception.dart';
import 'exceptions/not_found_exception.dart';
import 'exceptions/service_unavailable_exception.dart';
import 'exceptions/unauthorize_exception.dart';

Exception handleError(String error) {
  return AppException(message: error);
}

Exception handleDioError(DioError dioError) {
  switch (dioError.type) {
    case DioErrorType.cancel:
      return AppException(message: 'Request to API server was cancelled');
    case DioErrorType.connectionTimeout:
      return AppException(message: 'Connection timeout with API server');
    case DioErrorType.connectionError:
      return NetworkException('There is no internet connection');
    case DioErrorType.unknown:
      return NetworkException(dioError.error.toString());
    case DioErrorType.receiveTimeout:
      return TimeoutException('Receive timeout in connection with API server');
    case DioErrorType.sendTimeout:
      return TimeoutException('Send timeout in connection with API server');
    case DioErrorType.badCertificate:
    case DioErrorType.badResponse:
      return _parseDioErrorResponse(dioError);
  }
}

Exception _parseDioErrorResponse(DioError dioError) {
  int statusCode = dioError.response?.statusCode ?? -1;
  String? status;
  String? error;
  String? serverMessage;

  try {
    if (statusCode == -1 || statusCode == HttpStatus.ok) {
      statusCode = dioError.response?.data['statusCode'] as int;
    }
    status = dioError.response?.data['status'] as String?;
    error = dioError.response?.data['error'] as String?;
    serverMessage = dioError.response?.data['error_description'] as String?;
  } catch (e, _) {
    serverMessage = 'Something went wrong. Please try again later.';
  }

  switch (statusCode) {
    case HttpStatus.unauthorized:
      return UnauthorizedException(serverMessage ?? '');
    case HttpStatus.serviceUnavailable:
      return ServiceUnavailableException('Service Temporarily Unavailable');
    case HttpStatus.notFound:
      return NotFoundException(serverMessage ?? '', status ?? '');
    default:
      return ApiException(httpCode: statusCode, status: status ?? '', error: error, message: serverMessage ?? '');
  }
}
