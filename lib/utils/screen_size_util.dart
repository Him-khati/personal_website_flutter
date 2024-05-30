import 'package:flutter/material.dart';

class ScreenSizeUtil {

  static bool isAtLeastLargeScreen(BuildContext context) {
    return isLargeScreen(context) && !isMediumScreen(context);
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 768;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 768 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

}

extension ScreenSizeExtensions on BuildContext{

  // Is a large screen like Laptop/Desktop screen
  bool get isLargeScreen => ScreenSizeUtil.isLargeScreen(this);

  // Is a large screen like Tablet screen
  bool get isMediumScreen => ScreenSizeUtil.isMediumScreen(this);

  // Is a large screen like Phone screen
  bool get isSmallScreen => ScreenSizeUtil.isSmallScreen(this);


}
