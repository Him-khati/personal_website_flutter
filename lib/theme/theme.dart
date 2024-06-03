import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_website/theme/text_themes.dart';
import 'package:personal_website/theme/theme_buttons.dart';

import '../colors.dart';

extension ColorSchemeExtensions on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;

  /// Light Theme
  ThemeData lightTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        elevatedButtonTheme: getElevatedButtonThemeData(context),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          //Background color for primary elements , like Raised button
          primary: kBabyPink,
          //Content color on primary elements
          onPrimary: Color(0xFF323232),

          //Background color for variant of primary elements ,like Raised button, toolbar
          secondary: const Color(0xFFF3F3F3),
          onSecondary: const Color(0xFF323232),

          error: const Color(0xFFF3F3F3),
          onError: Colors.white,
          surface: const Color(0xFFF3F3F3),
          onSurface: const Color(0xFF323232),
          onTertiary: const Color(0xFFF3F3F3),

          //Container :Fill color for foreground elements like buttons. They should not be used for text or icons
          primaryContainer: const Color(0xFFF3F3F3),
          onPrimaryContainer: Colors.white,
        ),
        textTheme: context.defaultTextTheme,
      );

  /// Dark Theme
  ThemeData darkTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: getElevatedButtonThemeData(context),
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          //Background color for primary elements , like Raised button
          primary: kBabyPink,
          //Content color on primary elements
          onPrimary: Colors.white,

          //Background color for variant of primary elements ,like Raised button, toolbar
          secondary: const Color(0xFFF3F3F3),
          onSecondary: const Color(0xFFF3F3F3),

          error: const Color(0xFFF3F3F3),
          onError: Colors.white,
          surface: const Color(0xFFF3F3F3),
          onSurface: const Color(0xFFF3F3F3),
          onTertiary: const Color(0xFFF3F3F3),

          //Container :Fill color for foreground elements like buttons. They should not be used for text or icons
          primaryContainer: const Color(0xFFF3F3F3),
          onPrimaryContainer: Colors.white,
        ),
        textTheme: context.defaultTextTheme,
      );
}
