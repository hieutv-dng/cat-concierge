/*
 * File: display_preferences.dart
 * File Created: Monday, 3rd October 2022 3:23:39 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Monday, 3rd October 2022 3:24:12 pm
 * Modified By: Hieu Tran
 */

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:one/one.dart';

part 'display_preferences.freezed.dart';

class DisplayPreferencesController extends GetxService {
  DisplayPreferencesController({
    required Preferences preferences,
  }) : _preferences = preferences {
    _displayPreferencesController = DisplayPreferences(
      compactMode: _preferences.getBool('compactMode', false),
      displayFont: preferences.getString(
        'displayFontFamily',
        kDisplayFont,
      ),
      bodyFont: preferences.getString(
        'bodyFontFamily',
        kBodyFont,
      ),
      fontSizeDeltaId: preferences.getInt('fontSizeDeltaId', 0),
    ).obs;
  }
  final Preferences _preferences;
  late final Rx<DisplayPreferences> _displayPreferencesController;
  DisplayPreferences get displayPreferences => _displayPreferencesController.value;

  void defaultSettings() {
    setCompactMode(false);
    setDisplayFont(kDisplayFont);
    setBodyFont(kBodyFont);
    setFontSizeDeltaId(0);
  }

  void setCompactMode(bool value) {
    _displayPreferencesController(displayPreferences.copyWith(compactMode: value));
    _preferences.setBool('compactMode', value);
  }

  void setDisplayFont(String value) {
    _displayPreferencesController(displayPreferences.copyWith(displayFont: value));
    _preferences.setString('displayFontFamily', value);
  }

  void setBodyFont(String value) {
    _displayPreferencesController(displayPreferences.copyWith(bodyFont: value));
    _preferences.setString('bodyFontFamily', value);
  }

  void setFontSizeDeltaId(int value) {
    _displayPreferencesController(displayPreferences.copyWith(fontSizeDeltaId: value));
    _preferences.setInt('fontSizeDeltaId', value);
  }
}

@freezed
class DisplayPreferences with _$DisplayPreferences {
  factory DisplayPreferences({
    required bool compactMode,
    required String displayFont,
    required String bodyFont,
    required int fontSizeDeltaId,
  }) = _DisplayPreferences;

  DisplayPreferences._();

  late final fontSizeDelta = _fontSizeDeltaIdMap[fontSizeDeltaId] ?? 0;
}

/// Maps the id of the font size to the font size delta value.
const _fontSizeDeltaIdMap = <int, double>{
  -2: -4,
  -1: -2,
  0: 0,
  1: 2,
  2: 4,
};
