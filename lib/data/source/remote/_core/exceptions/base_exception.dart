/*
 * File: base_exception.dart
 * File Created: Friday, 26th August 2022 10:18:38 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Friday, 26th August 2022 10:20:52 pm
 * Modified By: Hieu Tran
 */

abstract class BaseException implements Exception {
  final String message;

  BaseException({this.message = ''});

  @override
  String toString() {
    return 'Exception: $message';
  }
}
