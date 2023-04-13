/*
 * File: theme_preferences.dart
 * File Created: Thursday, 22nd December 2022 4:10:42 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Thursday, 22nd December 2022 4:12:05 pm
 * Modified By: Hieu Tran
 */

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';

part 'theme_preferences.freezed.dart';

class ThemePreferencesController extends GetxController with LoggerMixin {
  ThemePreferencesController({
    required Preferences preferences,
  }) : _preferences = preferences {
    _themePreferencesController = ThemePreferences(
      lightThemeId: preferences.getInt('lightThemeId', 1),
      darkThemeId: preferences.getInt('darkThemeId', 3),
      customThemes: preferences.getStringList('customThemes', []).toBuiltList(),
    ).obs;
  }

  final Preferences _preferences;

  late final Rx<ThemePreferences> _themePreferencesController;
  ThemePreferences get themePreferences => _themePreferencesController.value;

  void setThemeId({
    int? lightThemeId,
    int? darkThemeId,
  }) {
    _themePreferencesController(themePreferences.copyWith(
      lightThemeId: lightThemeId ?? themePreferences.lightThemeId,
      darkThemeId: darkThemeId ?? themePreferences.darkThemeId,
    ));

    if (lightThemeId != null) {
      _preferences.setInt('lightThemeId', lightThemeId);
    }

    if (darkThemeId != null) {
      _preferences.setInt('darkThemeId', darkThemeId);
    }
  }

  void addCustomTheme({
    required AppThemeData themeData,
    required int? themeId,
    bool updateLightThemeSelection = false,
    bool updateDarkThemeSelection = false,
  }) {
    try {
      if (themeId != null) {
        // update existing theme
        _themePreferencesController(themePreferences.copyWith(
          customThemes: themePreferences.customThemes.rebuild(
            (builder) => builder[themeId - 10] = jsonEncode(themeData.toJson()),
          ),
        ));
      } else {
        // add new theme
        _themePreferencesController(themePreferences.copyWith(
          customThemes: themePreferences.customThemes.rebuild(
            (builder) => builder.add(jsonEncode(themeData.toJson())),
          ),
        ));
      }

      _preferences.setStringList('customThemes', themePreferences.customThemes.toList());

      if (updateLightThemeSelection || updateDarkThemeSelection) {
        setThemeId(
          lightThemeId: updateLightThemeSelection ? themeId ?? themePreferences.customThemes.length - 1 + 10 : null,
          darkThemeId: updateDarkThemeSelection ? themeId ?? themePreferences.customThemes.length - 1 + 10 : null,
        );
      }
    } catch (e, st) {
      log.severe('unable to add custom theme', e, st);
    }
  }

  void removeCustomTheme({
    required int themeId,
  }) {
    _themePreferencesController(themePreferences.copyWith(
      customThemes: themePreferences.customThemes.rebuild(
        (builder) => builder.removeAt(themeId - 10),
      ),
    ));

    _preferences.setStringList('customThemes', themePreferences.customThemes.toList());

    if (themeId <= themePreferences.lightThemeId || themeId <= themePreferences.darkThemeId) {
      setThemeId(
        lightThemeId: themeId == themePreferences.lightThemeId
            ? 0
            : themeId < themePreferences.lightThemeId
                ? themePreferences.lightThemeId - 1
                : null,
        darkThemeId: themeId == themePreferences.darkThemeId
            ? 0
            : themeId < themePreferences.darkThemeId
                ? themePreferences.darkThemeId - 1
                : null,
      );
    }
  }
}

@freezed
class ThemePreferences with _$ThemePreferences {
  const factory ThemePreferences({
    required int lightThemeId,
    required int darkThemeId,
    required BuiltList<String> customThemes,
  }) = _ThemePreferences;
}
