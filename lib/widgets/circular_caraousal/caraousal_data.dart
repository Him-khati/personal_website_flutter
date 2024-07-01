import 'package:flutter/material.dart';

class CarouselData {
  final int index;
  late double x, y, z, angle;
  bool greyScale = false;
  late double maxX, maxZ;
  final Widget image;

  CarouselData(this.index, this.image);
}
