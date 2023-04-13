/*
 * File: theme_controller.dart
 * File Created: Friday, 23rd December 2022 11:35:58 am
 * Author: Hieu Tran
 * -----
 * Last Modified: Friday, 23rd December 2022 11:41:34 am
 * Modified By: Hieu Tran
 */

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

class ThemeController extends GetxService {
  @override
  void onInit() {
    final display = _displayPreferencesController.displayPreferences;
    final lightThemeId = _themePreferencesController.themePreferences.lightThemeId;
    _lightThemeController = AppTheme(
      data: _themeDataFromId(
            lightThemeId,
            customThemes: _customThemes,
            materialYouLight: null,
            materialYouDark: null,
          ) ??
          predefinedThemes[1],
      fontSizeDelta: display.fontSizeDelta,
      displayFont: display.displayFont,
      bodyFont: display.bodyFont,
      compact: display.compactMode,
    ).obs;

    final darkThemeId = _themePreferencesController.themePreferences.darkThemeId;
    _darkThemeController = AppTheme(
      data: _themeDataFromId(
            darkThemeId,
            customThemes: _customThemes,
            materialYouLight: null,
            materialYouDark: null,
          ) ??
          predefinedThemes[3],
      fontSizeDelta: display.fontSizeDelta,
      displayFont: display.displayFont,
      bodyFont: display.bodyFont,
      compact: display.compactMode,
    ).obs;
    super.onInit();
  }

  final _displayPreferencesController = Get.find<DisplayPreferencesController>();
  final _themePreferencesController = Get.find<ThemePreferencesController>();
  BuiltList<AppThemeData> get _customThemes => _themePreferencesController.themePreferences.customThemes
      .map(_decodeThemeData)
      .whereType<AppThemeData>()
      .toBuiltList();

  late final Rx<AppTheme> _lightThemeController;
  AppTheme get lightTheme => _lightThemeController.value;

  late final Rx<AppTheme> _darkThemeController;
  AppTheme get darkTheme => _darkThemeController.value;

  AppTheme get appTheme => Get.isDarkMode ? darkTheme : lightTheme;

  void updateTheme() {
    final display = _displayPreferencesController.displayPreferences;
    final lightThemeId = _themePreferencesController.themePreferences.lightThemeId;
    final darkThemeId = _themePreferencesController.themePreferences.darkThemeId;
    _lightThemeController(AppTheme(
      data: _themeDataFromId(
            lightThemeId,
            customThemes: _customThemes,
            materialYouLight: null,
            materialYouDark: null,
          ) ??
          predefinedThemes[1],
      fontSizeDelta: display.fontSizeDelta,
      displayFont: display.displayFont,
      bodyFont: display.bodyFont,
      compact: display.compactMode,
    ));

    _darkThemeController(AppTheme(
      data: _themeDataFromId(
            darkThemeId,
            customThemes: _customThemes,
            materialYouLight: null,
            materialYouDark: null,
          ) ??
          predefinedThemes[0],
      fontSizeDelta: display.fontSizeDelta,
      displayFont: display.displayFont,
      bodyFont: display.bodyFont,
      compact: display.compactMode,
    ));
  }

  // Future<CorePalette?> get _corePaletteProvider => DynamicColorPlugin.getCorePalette().handleError(logErrorHandler);

  // Future<AppThemeData?> get _materialYouLight async {
  //   final corePalette = await _corePaletteProvider;

  //   return corePalette != null
  //       ? AppThemeData.fromCorePalette(
  //           corePalette,
  //           brightness: Brightness.light,
  //           name: 'Material You · light',
  //         )
  //       : null;
  // }

  // Future<AppThemeData?> get _materialYouDark async {
  //   final corePalette = await _corePaletteProvider;

  //   return corePalette != null
  //       ? AppThemeData.fromCorePalette(
  //           corePalette,
  //           brightness: Brightness.dark,
  //           name: 'Material You · dark',
  //         )
  //       : null;
  // }
}

/// Returns the appropriate theme data based on the id.
///
/// -2: material you light
/// -1: material you dark
/// 0..10: predefined theme (+ reserved)
/// 11+: custom theme
AppThemeData? _themeDataFromId(
  int id, {
  required BuiltList<AppThemeData> customThemes,
  required AppThemeData? materialYouLight,
  required AppThemeData? materialYouDark,
}) {
  if (id == -2) {
    return materialYouLight;
  } else if (id == -1) {
    return materialYouDark;
  } else if (id >= 0 && id < predefinedThemes.length) {
    return predefinedThemes[id];
  } else if (id >= 10) {
    if (id - 10 < customThemes.length) {
      return customThemes[id - 10];
    }
  }

  return null;
}

AppThemeData? _decodeThemeData(String themeDataJson) {
  try {
    return AppThemeData.fromJson(
      jsonDecode(themeDataJson) as Map<String, dynamic>,
    );
  } catch (e, st) {
    Logger.detached('_decodeThemeData').warning('unable to decode custom theme data', e, st);
    return null;
  }
}
