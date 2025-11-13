import 'package:flutter/material.dart';

abstract class AppColors {
  static const background = Color(0xFF0B1623);
  static const surface = Color(0xFF0E1B2B);

  static const primary = Color(0xFF2FAF66);
  static const primaryLight = Color(0xFF46C175);
  static const primaryDark = Color(0xFF1E7D4B);

  static const goldLight = Color(0xFFF6C65B);
  static const gold = Color(0xFFE3B13E);
  static const goldDark = Color(0xFFC9911E);

  static const onDarkHigh = Color(0xFFE9EDF2);
  static const onDarkMed = Color(0xFFB9C3CF);
  static const onDarkLow = Color(0xFF90A0B3);

  static const outline = Color(0xFF1E2A38);
  static const error = Color(0xFFD04444);

  static const overlayDark = Color(0xAA0A0E14);

  static const brandBgStart = Color(0xFF0E1B2B);
  static const brandBgEnd = Color(0xFF0B1623);
}

MaterialColor buildPrimarySwatch() {
  const base = AppColors.primary;
  return const MaterialColor(0xFF2FAF66, <int, Color>{
    50: Color(0xFFE6F5EC),
    100: Color(0xFFC1E7D1),
    200: Color(0xFF97D8B3),
    300: Color(0xFF6ECA95),
    400: Color(0xFF4FC07E),
    500: base,
    600: Color(0xFF2AA95F),
    700: Color(0xFF239F55),
    800: Color(0xFF1D964B),
    900: Color(0xFF128538),
  });
}
