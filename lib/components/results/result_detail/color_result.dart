/*
 * File: color_result.dart
 * File Created: Wednesday, 19th April 2023 1:43:17 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Wednesday, 19th April 2023 1:43:26 pm
 * Modified By: Hieu Tran
 */

import 'package:tuple/tuple.dart';

class ColorResult {
  final String name;
  final List<Tuple2<String, int>> colors;
  final bool isPositive;
  final int index;

  const ColorResult(
    this.name,
    this.colors,
    this.isPositive,
    this.index,
  );
}

const colorResults = [
  ColorResult(
    'Leukocytes',
    [
      Tuple2('1', 0xFFFEF8BC),
      Tuple2('15', 0xFFF9ECD4),
      Tuple2('75', 0xFFCDA3B5),
      Tuple2('125', 0xFFB591B7),
      Tuple2('500', 0xFFA07BAB),
    ],
    true,
    2,
  ),
  ColorResult(
    'Nitrite',
    [
      Tuple2('0', 0xFFF3EFD1),
      Tuple2('1', 0xFFFCEEE4),
      Tuple2('1', 0xFFEAB6C2),
    ],
    true,
    2,
  ),
  ColorResult(
    'Urobilinogen',
    [
      Tuple2('3.2', 0xFFEFBFBB),
      Tuple2('16', 0xFFF3D2C7),
      Tuple2('32', 0xFFF0BFBB),
      Tuple2('64', 0xFFE6A2C0),
      Tuple2('128', 0xFFE08DAD),
    ],
    false,
    0,
  ),
  ColorResult(
    'pH',
    [
      Tuple2('5', 0xFFE69C37),
      Tuple2('6', 0xFFEAAF3B),
      Tuple2('6.5', 0xFFE3AC42),
      Tuple2('7', 0xFFBDAD4A),
      Tuple2('7.5', 0xFF979E4B),
      Tuple2('8', 0xFF767B2E),
      Tuple2('8.5', 0xFF386C34),
    ],
    false,
    0,
  ),
  ColorResult(
    'Blood',
    [
      Tuple2('0', 0xFFF3C157),
      Tuple2('10', 0xFFDE963C),
      Tuple2('10', 0xFFD2BF40),
      Tuple2('25', 0xFFBBB83B),
      Tuple2('80', 0xFFC7B140),
      Tuple2('200', 0xFF3B6D36),
    ],
    false,
    0,
  ),
  ColorResult(
    'Specific Gravity',
    [
      Tuple2('1.000', 0xFF275D66),
      Tuple2('1.005', 0xFF587140),
      Tuple2('1.010', 0xFF849550),
      Tuple2('1.015', 0xFF93904D),
      Tuple2('1.020', 0xFFB7AA50),
      Tuple2('1.025', 0xFFC8B240),
      Tuple2('1.030', 0xFFD4A638),
    ],
    false,
    0,
  ),
  ColorResult(
    'Ketone',
    [
      Tuple2('0', 0xFFF6DBC9),
      Tuple2('0.5', 0xFFEBB6A6),
      Tuple2('1.5', 0xFFD18386),
      Tuple2('4.0', 0xFFBC5877),
      Tuple2('8.0', 0xFF9A3D70),
      Tuple2('16', 0xFF803956),
    ],
    true,
    2,
  ),
  ColorResult(
    'Bilirubin',
    [
      Tuple2('0', 0xFFFFFCDE),
      Tuple2('10', 0xFFDDA55F),
      Tuple2('20', 0xFFC7874F),
      Tuple2('50', 0xFFAD5B3F),
    ],
    true,
    2,
  ),
  ColorResult(
    'Bilirubin',
    [
      Tuple2('0', 0xFFB8D8E5),
      Tuple2('5', 0xFFC6DB8C),
      Tuple2('15', 0xFFC0BC4C),
      Tuple2('30', 0xFFBA9B35),
      Tuple2('60', 0xFF9F6531),
      Tuple2('110', 0xFF7B6041),
    ],
    false,
    0,
  ),
];
