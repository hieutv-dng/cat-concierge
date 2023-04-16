/*
 * File: app_text_style.dart
 * File Created: Saturday, 15th April 2023 11:01:32 pm
 * Author: Dương Trí
 * -----
 * Last Modified: Saturday, 15th April 2023 11:01:35 pm
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/core/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppTextStyle with Diagnosticable {
  AppTextStyle();

  late TextStyle headingH1;
  late TextStyle headingH2;
  late TextStyle headingH3;
  late TextStyle headingH4;
  late TextStyle headingH5;
  late TextStyle bodyXL;
  late TextStyle bodyL;
  late TextStyle bodyM;
  late TextStyle bodyS;
  late TextStyle bodyXS;
  late TextStyle captionM;
  late TextStyle actionL;
  late TextStyle actionM;
  late TextStyle actionS;

  // Builds the Custom Themes, based on the currently defined based Themes
  // ignore: avoid_unused_constructor_parameters
  factory AppTextStyle.fromContext(BuildContext context) {
    // final ThemeData themeData = Theme.of(context);
    final AppTextStyle theme = AppTextStyle();

    theme.headingH1 = const TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.normal,
      fontSize: 24,
      color: AppColors.text1F1F1F,
    );
    theme.headingH2 = theme.headingH1.copyWith(fontSize: 18.0);
    theme.headingH3 = theme.headingH1.copyWith(fontSize: 16.0);
    theme.headingH4 = theme.headingH1.copyWith(fontWeight: FontWeight.w800, fontSize: 14.0);
    theme.headingH5 = theme.headingH1.copyWith(fontWeight: FontWeight.w700, fontSize: 12.0);

    theme.bodyXL = theme.headingH1.copyWith(fontWeight: FontWeight.w400, fontSize: 18.0);
    theme.bodyL = theme.bodyXL.copyWith(fontSize: 16.0);
    theme.bodyM = theme.bodyXL.copyWith(fontSize: 14.0);
    theme.bodyS = theme.bodyXL.copyWith(fontSize: 12.0);
    theme.bodyXS = theme.bodyXL.copyWith(fontSize: 10.0);

    theme.actionL = theme.headingH1.copyWith(fontWeight: FontWeight.w600, fontSize: 14.0);
    theme.actionM = theme.actionL.copyWith(fontSize: 12.0);
    theme.actionS = theme.actionL.copyWith(fontSize: 10.0);

    theme.captionM = theme.actionL.copyWith(fontSize: 10.0);

    return theme;
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }

    return other is AppTextStyle &&
        other.headingH1 == headingH1 &&
        other.headingH2 == headingH2 &&
        other.headingH3 == headingH3 &&
        other.headingH4 == headingH4 &&
        other.headingH5 == headingH5 &&
        other.bodyXL == bodyXL &&
        other.bodyL == bodyL &&
        other.bodyM == bodyM &&
        other.bodyS == bodyS &&
        other.bodyXS == bodyXS &&
        other.captionM == captionM &&
        other.actionL == actionL &&
        other.actionM == actionM &&
        other.actionS == actionS;
  }

  @override
  int get hashCode => Object.hashAll([
        headingH1,
        headingH2,
        headingH3,
        headingH4,
        headingH5,
        bodyXL,
        bodyL,
        bodyM,
        bodyS,
        bodyXS,
        captionM,
        actionL,
        actionM,
        actionS,
      ]);
}
