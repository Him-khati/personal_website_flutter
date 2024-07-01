import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_website/colors.dart';
import 'package:personal_website/utils/screen_size_util.dart';

//
// L I G H T - THEME
//
ColorScheme lightColors = const ColorScheme(
  brightness: Brightness.light,
  //Background color for primary elements , like Raised button
  primary: kBabyPink,
  //Content color on primary elements
  onPrimary: Color(0xFF323232),

  //Background color for variant of primary elements ,like Raised button, toolbar
  secondary: Color(0xFFF3F3F3),
  onSecondary: Color(0xFF323232),

  error: Color(0xFFF3F3F3),
  onError: Colors.white,
  surface: Color(0xFFF3F3F3),
  onSurface: Color(0xFF323232),
  onTertiary: Color(0xFFF3F3F3),

  //Container :Fill color for foreground elements like buttons. They should not be used for text or icons
  primaryContainer: Color(0xFFF3F3F3),
  onPrimaryContainer: Colors.white,
);

//
// D A R K - THEME
//
ColorScheme darkColors = const ColorScheme(
  brightness: Brightness.dark,
  //Background color for primary elements , like Raised button
  primary: kBabyPink,
  //Content color on primary elements
  onPrimary: Colors.white,

  //Background color for variant of primary elements ,like Raised button, toolbar
  secondary: Color(0xFFF3F3F3),
  onSecondary: Color(0xFFF3F3F3),

  error: Color(0xFFF3F3F3),
  onError: Colors.white,
  surface: Color(0xFFF3F3F3),
  onSurface: Color(0xFFF3F3F3),
  onTertiary: Color(0xFFF3F3F3),

  //Container :Fill color for foreground elements like buttons. They should not be used for text or icons
  primaryContainer: Color(0xFFF3F3F3),
  onPrimaryContainer: Colors.white,
);

extension ColorSchemeExtensions on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}
