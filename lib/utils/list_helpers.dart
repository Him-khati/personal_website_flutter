import 'package:daily_utils/daily_utils.dart';
import 'package:flutter/material.dart';

extension ListExtensions on List<Widget> {
  // Is a large screen like Laptop/Desktop screen
  List<Widget> fillSpaceInBetween(
    double space, {
    bool vertical = true,
  }) {
    List<Widget> finalItemsWithSpace = [];
    final Widget spaceWidget;
    if(vertical){
      spaceWidget = VerticalGap(space);
    } else{
      spaceWidget = HorizonatalGapWidget(space);
    }

    for (int i = 0; i < length - 1; i++) {
      finalItemsWithSpace.add(this[i]);
      finalItemsWithSpace.add(spaceWidget);
    }

    return finalItemsWithSpace
        ..add(last);
  }
}
