import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension TextThemeExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Returns base text Theme
  TextTheme get defaultTextTheme => _buildTheme(
        this,
        GoogleFonts.notoSansHanunoo(),
      );

  /// returns the highlighted text theme
  TextTheme get highlightTextTheme => _buildTheme(
        this,
        GoogleFonts.playfairDisplay(),
      );

  TextTheme _buildTheme(
    BuildContext context,
    TextStyle textStyle,
  ) {
    //TODO set font size based on device's size

    return TextTheme(
      displayLarge: textStyle.copyWith(
        fontSize: 57,
        fontWeight: FontWeight.normal,
      ),
      displayMedium: textStyle.copyWith(
        fontSize: 45,
        fontWeight: FontWeight.normal,
      ),
      displaySmall: textStyle.copyWith(
        fontSize: 36,
        fontWeight: FontWeight.normal,
      ),
      headlineLarge: textStyle.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: textStyle.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: textStyle.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: textStyle.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: textStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: textStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: textStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: textStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: textStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: textStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: textStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      labelSmall: textStyle.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
