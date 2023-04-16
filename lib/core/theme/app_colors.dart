import 'package:flutter/material.dart';

abstract class AppColors {
  static const bgPage = Color(0xFFECF1F8);
  static const bgListPage = Color(0xFFE5E5E5);

  static const primary = Color(0xFF275FC4);
  static const primaryDarkest = Color(0xFF0B2A60);
  static const primaryDark = Color(0xFF1A4287);
  static const primaryLight = Color(0xFF98B6ED);
  static const primaryLightest = Color(0xFFECF3FF);

  static const highlightDarkest = Color(0xFFC65313);
  static const highlightDark = Color(0xFFE87738);
  static const highlight = Color(0xFFFF9255);
  static const highlightLight = Color(0xFFFFDDBD);
  static const highlightLightest = Color(0xFFFFF7F0);

  static const lightGreyDarkest = Color(0xFFC5C6CC);
  static const lightGreyDark = Color(0xFFD4D6DD);
  static const lightGrey = Color(0xFFE8E9F1);
  static const lightGreyLightest = Color(0xFFF8F9FE);

  static const darkGreyDarkest = Color(0xFF1F2024);
  static const darkGreyDark = Color(0xFF2F3036);
  static const darkGrey = Color(0xFF494A50);
  static const darkGreyLight = Color(0xFF71727A);
  static const darkGreyLightest = Color(0xFF8F9098);

  static const errorDark = Color(0xFFEB8087);
  static const errorLight = Color(0xFFFFBDC1);
  static const successDark = Color(0xFF4CC792);
  static const successLight = Color(0xFFBCE8D5);

  static const text = Color(0xFF171332);
  static const textHintColor = Color(0xFF8F9098);
  static const text1F1F1F = Color(0xFF1F1F1F);

  static const LinearGradient gradientMain = LinearGradient(
    colors: [Color(0xFFB9D2FF), Color(0xFFFFFFFF)],
    begin: Alignment(0, -1),
    end: Alignment(0, 1),
  );
}
