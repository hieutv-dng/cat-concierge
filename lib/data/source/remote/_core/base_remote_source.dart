/*
 * File: base_remote_source.dart
 * File Created: Friday, 26th August 2022 10:31:23 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Friday, 26th August 2022 10:31:45 pm
 * Modified By: Hieu Tran
 */

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'error_handlers.dart';
import 'exceptions/base_exception.dart';

abstract class BaseRemoteSource {
  Future<HttpResponse<T>> callApiWithErrorParser<T>(Future<HttpResponse<T>> api) async {
    try {
      final HttpResponse<T> response = await api;
      return response;
    } on DioError catch (dioError) {
      final Exception exception = handleDioError(dioError);
      // logger.e(
      //     "Throwing error from repository: >>>>>>> $exception : ${(exception as BaseException).message}");
      throw exception;
    } catch (error) {
      // logger.e("Generic error: >>>>>>> $error");
      if (error is BaseException) {
        rethrow;
      }
      throw handleError('$error');
    }
  }
}
