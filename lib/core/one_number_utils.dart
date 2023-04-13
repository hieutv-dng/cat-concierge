/*
 * File: one_number_utils.dart
 * File Created: Friday, 24th March 2023 2:05:12 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Friday, 24th March 2023 2:06:11 pm
 * Modified By: Hieu Tran
 */

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class OneNumberUtils {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  OneNumberUtils._();

  static NumberFormat decimalInputFormat = NumberFormat('###.##', 'en');
  static NumberFormat decimalFormat = NumberFormat.decimalPattern('en');
  static TextInputFormatter allowOnlyDigitsAndCommaDot = FilteringTextInputFormatter.allow(RegExp(r'[0-9 .,+-]'));

  static double? tryParseRound(String source, {int numberDecimal = 2}) {
    final parse = double.tryParse(source);
    if (parse != null) {
      return double.parse(parse.toStringAsFixed(numberDecimal));
    }
    return null;
  }
}

class CommaTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String truncated = newValue.text;
    final newSelection = newValue.selection;

    if (newValue.text.contains(',')) {
      truncated = newValue.text.replaceFirst(RegExp(','), '.');
    }
    return TextEditingValue(
      text: truncated,
      selection: newSelection,
    );
  }
}
