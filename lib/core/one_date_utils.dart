/*
 * File: one_date_utils.dart
 * File Created: Tuesday, 3rd January 2023 10:10:59 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Tuesday, 3rd January 2023 10:11:15 pm
 * Modified By: Hieu Tran
 */
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

/// Utility functions for working with dates.
class OneDateUtils {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  OneDateUtils._();

  static DateTime dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  static String convertFrom(DateTime date, {required String toFormat}) {
    return DateFormat(toFormat).format(date);
  }

  static String? convertFromStrTo(
    String? dateStr, {
    required String fromFormat,
    required String toFormat,
  }) {
    if (dateStr == null) return null;
    try {
      return DateFormat(toFormat).format(DateFormat(fromFormat).parse(dateStr));
    } catch (e, st) {
      Logger('OneDateUtils').severe('unable to convertFromStrTo', e, st);
    }
    return null;
  }

  static DateTime? convertToDateFrom(
    String? dateStr, {
    required String fromFormat,
  }) {
    if (dateStr == null) return null;
    try {
      return DateFormat(fromFormat).parse(dateStr);
    } catch (e, st) {
      Logger('OneDateUtils').severe('unable to convertToDateFrom', e, st);
    }
    return null;
  }
}
