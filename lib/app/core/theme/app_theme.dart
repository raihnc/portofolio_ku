import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Analog Drift - Neo-Vintage Color Palette
  static const Color primary = Color(0xFFa13b00);
  static const Color secondary = Color(0xFFfdc339);
  static const Color tertiary = Color(0xFF068282);
  static const Color background = Color(0xFFfcf9f8);
  static const Color surface = Color(0xFFfcf9f8);
  static const Color surfaceContainer = Color(0xFFF0eded);
  static const Color surfaceContainerHigh = Color(0xFFEAE7E7);
  static const Color cardBg = Color(0xFFfcf9f8);
  static const Color border = Color(0xFF1c1b1b);
  static const Color outline = Color(0xFF8c7167);
  static const Color outlineVariant = Color(0xFFE0C0B4);
  static const Color textPrimary = Color(0xFF1c1b1b);
  static const Color textSecondary = Color(0xFF584239);
  static const Color inverseSurface = Color(0xFF313030);
  static const Color inverseOnSurface = Color(0xFFF3F0EF);

  static TextStyle _displayLarge = GoogleFonts.ebGaramond(
    fontSize: 84,
    fontWeight: FontWeight.w700,
    height: 1.09,
    letterSpacing: -0.02,
  );

  static TextStyle _displayLargeMobile = GoogleFonts.ebGaramond(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    height: 1.08,
    letterSpacing: -0.01,
  );

  static TextStyle _headlineLg = GoogleFonts.ebGaramond(
    fontSize: 48,
    fontWeight: FontWeight.w600,
    height: 1.17,
  );

  static TextStyle _headlineMd = GoogleFonts.ebGaramond(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );

  static TextStyle _bodyLg = GoogleFonts.spaceMono(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.56,
  );

  static TextStyle _bodyMd = GoogleFonts.spaceMono(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle _labelSm = GoogleFonts.spaceMono(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 1.33,
  );

  static ThemeData get theme {
    return ThemeData(
      primaryColor: primary,
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.light(
        primary: primary,
        onPrimary: Colors.white,
        secondary: secondary,
        onSecondary: Color(0xFF6F5100),
        tertiary: tertiary,
        surface: surface,
        onSurface: textPrimary,
        outline: outline,
        outlineVariant: outlineVariant,
        surfaceContainerHighest: surfaceContainerHigh,
      ),
      textTheme: TextTheme(
        displayLarge: _displayLarge.copyWith(color: textPrimary),
        displayMedium: _displayLargeMobile.copyWith(color: textPrimary),
        headlineLarge: _headlineLg.copyWith(color: textPrimary),
        headlineMedium: _headlineMd.copyWith(color: textPrimary),
        bodyLarge: _bodyLg.copyWith(color: textPrimary),
        bodyMedium: _bodyMd.copyWith(color: textSecondary),
        labelLarge: _labelSm.copyWith(color: textPrimary),
      ),
    );
  }
}
