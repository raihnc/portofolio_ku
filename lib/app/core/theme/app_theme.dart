import 'package:flutter/material.dart';

class AppTheme {
  // Neobrutalism Color Palette
  static const Color primary = Color(0xFF000000);
  static const Color secondary = Color(0xFFFFFF00);
  static const Color accent = Color(0xFFFF00FF);
  static const Color background = Color(0xFFFAFAFA);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color border = Color(0xFF000000);
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF666666);

  static ThemeData get theme {
    return ThemeData(
      primaryColor: primary,
      scaffoldBackgroundColor: background,
      fontFamily: 'Poppins',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w800,
          color: textPrimary,
        ),
        displayMedium: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          color: textPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: textSecondary,
        ),
      ),
    );
  }
}
