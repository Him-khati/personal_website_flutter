import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ArcData {
  double startFromAngle;
  double drawTillAngle;
  Color fillColor;
  Size? size;
  bool scaleAnimate;
  Duration? scaleAnimDuration;
  double? scaleMin;
  double? scaleMax;

  ArcData({
    required this.startFromAngle,
    required this.drawTillAngle,
    required this.fillColor,
    this.size,
    this.scaleAnimate = false,
    this.scaleMin,
    this.scaleMax,
    this.scaleAnimDuration
  });

  @override
  String toString() {
    return "startAngle : $startFromAngle, drawTillAngle : $drawTillAngle, color : $fillColor";
  }
}

List<ArcData> generateArcData(
  int numberOfArcsToDivideACircleIn,
  List<Color> fillColors,
) {
  List<double> arcAngleArray = divide360IntoUnequalParts(
    numberOfArcsToDivideACircleIn,
  );
  List<ArcData> arcData = [];
  Random random = Random();

  for (int i = 0; i < arcAngleArray.length; i++) {
    if (i == arcAngleArray.length - 1) {
      arcData.add(ArcData(
        startFromAngle: arcAngleArray[i],
        drawTillAngle: arcAngleArray[0],
        fillColor: fillColors[random.nextInt(arcAngleArray.length - 1)],
      ));
    } else {
      arcData.add(ArcData(
        startFromAngle: arcAngleArray[i],
        drawTillAngle: arcAngleArray[i+1],
        fillColor: fillColors[random.nextInt(arcAngleArray.length - 1)],
      ));
    }
  }

  return arcData;
}

List<double> divide360IntoUnequalParts(int parts) {
  int number = 360;

  if (parts <= 0 || number <= 0) {
    throw ArgumentError("Number and parts must be greater than 0");
  }
  if (parts == 1) {
    return [number / 180];
  }

  Random random = Random();
  List<int> partSizes = List<int>.generate(parts, (_) => 1);

  int sum = parts; // Initial sum with all parts having at least size 1

  for (int i = 0; i < parts - 1; i++) {
    int add = random.nextInt(number - sum + 1);
    partSizes[i] += add;
    sum += add;
  }
  partSizes[parts - 1] += number - sum;
  partSizes.shuffle(); // Shuffle to ensure the parts are in random order

  return partSizes.map((e) {
    print(e);
    return e / 45;
  }).toList();
}
