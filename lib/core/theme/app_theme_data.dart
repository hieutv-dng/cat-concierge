import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

part 'app_theme_data.freezed.dart';
part 'app_theme_data.g.dart';

@freezed
class AppThemeData with _$AppThemeData {
  const factory AppThemeData({
    required String name,
    required List<int> backgroundColors,
    required int primaryColor,
    required int secondaryColor,
    required int cardColor,
    required int statusBarColor,
    required int navBarColor,
  }) = _AppThemeData;

  /// Creates the [AppThemeData] based on the [CorePalette] used by Material
  /// You.
  factory AppThemeData.fromCorePalette(
    CorePalette palette, {
    required Brightness brightness,
    required String name,
  }) {
    final colorScheme = palette.toColorScheme(brightness: brightness);

    return AppThemeData(
      name: name,
      backgroundColors: [colorScheme.background.value],
      primaryColor: colorScheme.primary.value,
      secondaryColor: colorScheme.tertiary.value,
      cardColor:
          brightness == Brightness.dark ? Color(palette.neutral.get(30)).withOpacity(.3).value : Color(palette.neutral.get(80)).withOpacity(.3).value,
      statusBarColor: colorScheme.background.withOpacity(0).value,
      navBarColor: colorScheme.background.withOpacity(0).value,
    );
  }

  factory AppThemeData.fromJson(Map<String, dynamic> json) => _$AppThemeDataFromJson(json);
}
