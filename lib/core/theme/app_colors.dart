import 'package:flutter/material.dart';

abstract class AppColors {
  static const bgPage = Color(0xFFECF1F8);
  static const bgListPage = Color(0xFFE5E5E5);

  static const neutralLightDark = Color(0xFFC5C6CC);
  static const neutralLightMedium = Color(0xFFD4D6DD);
  static const neutralLight = Color(0xFFE8E9F1);
  static const neutralLightest = Color(0xFFC5C6CC);

  static const primary = Color(0xFF275FC4);
  static const primaryDarkest = Color(0xFF0B2A60);
  static const primaryDark = Color(0xFF1A4287);
  static const primaryLight = Color(0xFF98B6ED);
  static const primaryLightest = Color(0xFFECF3FF);

  static const textHintColor = Color(0xFF8F9098);

  static const LinearGradient gradientMain = LinearGradient(
    colors: [Color(0xFFB9D2FF), Color(0xFFFFFFFF)],
    begin: Alignment(0, -1),
    end: Alignment(0, 1),
  );
}
