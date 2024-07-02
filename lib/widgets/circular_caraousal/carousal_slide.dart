import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:personal_website/colors.dart';
import 'package:personal_website/widgets/circular_caraousal/caraousal_data.dart';

import '../../utils.dart';

class CarousalSlideWidget extends StatelessWidget {
  final CarouselData data;

  const CarousalSlideWidget({
    super.key,
    required this.data,
  });

  double get slideLeftOpacity =>
      max(0, data.z) / data.maxZ + min(0, data.x) / data.maxX;

  double get slideMidOpacity =>
      max(0, data.z) / data.maxZ + min(0, data.x) / data.maxX;

  double get slideRightOpacity =>
      max(0, data.z) / data.maxZ + max(0, data.x) / data.maxX;

  @override
  Widget build(BuildContext context) {
    final slideLeftOpc = min(slideLeftOpacity.abs(), 0.9);
    final slideMidOpc = min(slideMidOpacity.abs(), 0.6);
    final slideRightOpc = min(slideRightOpacity.abs(), 0.9);

    print("Ops Left ${data.index} : $slideLeftOpc");
    print("Ops Mid ${data.index} : $slideMidOpc");
    print("Ops Right ${data.index} : $slideRightOpc");

    return SizedBox(
      key: Key("image${data.index}"),
      height: 400,
      width: 220,
      child: ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                kGrey300.withOpacity(
                  slideLeftOpc,
                ),
                kGrey300.withOpacity(
                  slideMidOpc,
                ),
                kGrey300.withOpacity(
                  slideRightOpc,
                ),
              ],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcOver,
          child: data
              .image /*ColoredBox(
          color : getColor(data.index)
        ),*/
          // child: Image.asset(
          //   data.image,
          //   colorBlendMode: true ? BlendMode.saturation : null,
          //   color: true ? getColor(data.index) : null,
          // ),
          ),
    );
  }

  Color getColor(int index) {
    if (index == 0) {
      return Colors.red;
    } else if (index == 1) {
      return Colors.black;
    } else if (index == 2) {
      return Colors.blue;
    } else if (index == 3) {
      return Colors.yellow;
    }

    return Colors.cyanAccent;
  }
}
