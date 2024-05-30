import 'package:flutter/material.dart';
import 'package:personal_website/colors.dart';
import 'package:personal_website/theme/text_themes.dart';
import 'package:personal_website/theme/theme.dart';

ElevatedButtonThemeData getElevatedButtonThemeData(
    BuildContext context,
    ) => ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    textStyle: context
        .textTheme
        .labelLarge,
    backgroundColor: kBabyPink,
    foregroundColor: context.colors.onPrimary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(36)),
    ),
  ),
);