import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one/one.dart';

part 'app_text_theme.dart';
part 'app_theme_colors.dart';

class AppTheme {
  AppTheme({
    required this.data,
    required double fontSizeDelta,
    required String displayFont,
    required String bodyFont,
    required bool compact,
  })  : _fontSizeDelta = fontSizeDelta,
        _paddingValue = compact ? 12 : 16 {
    name = data.name;
    colors = AppThemeColors(data: data);

    text = AppTextTheme(
      brightness: colors.brightness,
      fontSizeDelta: fontSizeDelta,
      displayFont: displayFont,
      bodyFont: bodyFont,
    );

    _setupThemeData();
  }

  final AppThemeData data;

  final double _fontSizeDelta;
  final double _paddingValue;

  late final String name;

  late final AppThemeColors colors;
  late final AppTextTheme text;

  late final ThemeData themeData;

  void _setupThemeData() {
    final shapeTheme = OneShapeTheme(radius: const Radius.circular(12));

    final theme = OneTheme(
      colorScheme: ColorScheme(
        brightness: colors.brightness,
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        secondary: colors.secondary,
        onSecondary: colors.onSecondary,
        error: colors.error,
        onError: colors.onError,
        background: colors.averageBackgroundColor,
        onBackground: colors.onBackground,
        surface: colors.averageBackgroundColor,
        onSurface: colors.onBackground,
      ),
      spacing: OneSpacingTheme(base: _paddingValue),
      shape: shapeTheme,
    );

    themeData = theme.data.copyWith(
      textTheme: text.textTheme,

      //
      iconTheme: IconThemeData(
        color: colors.onBackground,
        opacity: 1,
        size: 20 + _fontSizeDelta,
      ),
      cardTheme: CardTheme(
        color: colors.cardColor,
        shape: shapeTheme.shape,
        elevation: 0,
        margin: EdgeInsets.zero,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.alternateCardColor,
        actionTextColor: colors.primary,
        disabledActionTextColor: colors.primary.withOpacity(.5),
        contentTextStyle: text.textTheme.titleSmall,
        elevation: 0,
        shape: shapeTheme.shape,
        behavior: SnackBarBehavior.floating,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(_paddingValue),
        border: OutlineInputBorder(borderRadius: shapeTheme.borderRadius),
      ),

      // only used in license page
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        color: colors.averageBackgroundColor,
        centerTitle: true,
      ),
      dividerTheme: DividerThemeData(thickness: .6, color: theme.data.dividerColor),
    );
  }

  @override
  String toString() {
    return '$runtimeType: $name';
  }
}
