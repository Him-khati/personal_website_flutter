import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_website/theme/text_themes.dart';
import 'package:personal_website/theme/theme_buttons.dart';

import '../colors.dart';
import 'color_scheme.dart';

extension ColorSchemeExtensions on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;

  /// Light Theme
  ThemeData lightTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        elevatedButtonTheme: getElevatedButtonThemeData(context),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: lightColors,
        textTheme: context.defaultTextTheme,
      );

  /// Dark Theme
  ThemeData darkTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: getElevatedButtonThemeData(context),
        colorScheme: darkColors,
        textTheme: context.defaultTextTheme,
      );
}
