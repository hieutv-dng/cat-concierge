part of 'app_theme.dart';

const kBodyFont = 'Inter';
const kDisplayFont = 'Inter';

const kAssetFonts = [
  kBodyFont,
  kDisplayFont,
];

const _fontFamilyFallback = ['Inter'];

class AppTextTheme {
  AppTextTheme({
    required Brightness brightness,
    required double fontSizeDelta,
    required String displayFont,
    required String bodyFont,
  })  : _brightness = brightness,
        _fontSizeDelta = fontSizeDelta,
        _displayFont = displayFont,
        _bodyFont = bodyFont {
    _setupTextTheme();
  }

  final Brightness _brightness;
  final double _fontSizeDelta;
  final String _displayFont;
  final String _bodyFont;

  late final TextTheme textTheme;

  void _setupTextTheme() {
    final typography = _brightness == Brightness.light ? Typography.blackRedmond : Typography.whiteMountainView;

    textTheme = typography.merge(
      TextTheme(
        // display
        displayLarge: _applyDisplayFont(
          const TextStyle(
            fontSize: 64,
            fontFamilyFallback: _fontFamilyFallback,
          ),
        ),
        displayMedium: _applyDisplayFont(
          const TextStyle(
            fontSize: 48,
            fontFamilyFallback: _fontFamilyFallback,
          ),
        ),
        displaySmall: _applyDisplayFont(
          const TextStyle(
            fontSize: 32,
            fontFamilyFallback: _fontFamilyFallback,
          ),
        ),

        // headline
        headlineLarge: _applyDisplayFont(
          const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamilyFallback: _fontFamilyFallback,
          ),
        ),
        headlineMedium: _applyDisplayFont(
          const TextStyle(
            fontSize: 20,
            fontFamilyFallback: _fontFamilyFallback,
          ),
        ),
        headlineSmall: _applyDisplayFont(
          const TextStyle(
            fontSize: 18,
            fontFamilyFallback: _fontFamilyFallback,
          ),
        ),

        // title
        titleLarge: _applyDisplayFont(
          const TextStyle(
            fontSize: 20,
            fontFamilyFallback: _fontFamilyFallback,
          ),
        ),
        titleMedium: _applyDisplayFont(
          const TextStyle(
            fontSize: 18,
            fontFamilyFallback: _fontFamilyFallback,
          ),
        ),
        titleSmall: _applyDisplayFont(
          const TextStyle(
            fontSize: 16,
            fontFamilyFallback: _fontFamilyFallback,
          ),
        ),

        // body
        bodyLarge: _applyBodyFont(
          const TextStyle(
            fontSize: 16,
            fontFamilyFallback: _fontFamilyFallback,
          ),
        ),
        bodyMedium: _applyBodyFont(
          const TextStyle(
            fontSize: 14,
            fontFamilyFallback: _fontFamilyFallback,
          ),
        ),
        bodySmall: _applyBodyFont(
          const TextStyle(
            fontSize: 12,
            fontFamilyFallback: _fontFamilyFallback,
          ),
        ),

        // label
        labelLarge: _applyDisplayFont(
          const TextStyle(
            fontSize: 16,
            fontFamilyFallback: _fontFamilyFallback,
          ),
        ),
        labelMedium: _applyDisplayFont(
          const TextStyle(
            fontSize: 14,
            fontFamilyFallback: _fontFamilyFallback,
          ),
        ),
        labelSmall: _applyDisplayFont(
          const TextStyle(
            fontSize: 10,
            fontFamilyFallback: _fontFamilyFallback,
          ),
        ),
      ).apply(
        fontSizeDelta: _fontSizeDelta,
        bodyColor: AppColors.text,
        displayColor: AppColors.text,
      ),
    );
  }

  TextStyle _applyDisplayFont(TextStyle textStyle) {
    return applyFontFamily(
      textStyle: textStyle,
      fontFamily: _displayFont,
      fallback: kDisplayFont,
    );
  }

  TextStyle _applyBodyFont(TextStyle textStyle) {
    return applyFontFamily(
      textStyle: textStyle,
      fontFamily: _bodyFont,
      fallback: kBodyFont,
    );
  }
}

TextStyle applyFontFamily({
  required TextStyle textStyle,
  required String fontFamily,
  String? fallback,
}) {
  if (kAssetFonts.contains(fontFamily)) {
    return textStyle.copyWith(fontFamily: fontFamily);
  }

  try {
    return GoogleFonts.getFont(fontFamily, textStyle: textStyle);
  } catch (e) {
    return fallback != null ? textStyle.copyWith(fontFamily: fallback) : textStyle;
  }
}
