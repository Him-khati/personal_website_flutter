import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:personal_website/widgets/infinite_scale_animation.dart';

import 'circle_arc_painter.dart';

class CircleArcWidget extends StatelessWidget {

  final Color color;
  final double startFromAngle;
  final double drawTillAngle;
  final Size size;
  final bool animateScale;
  final double? scaleMin;
  final double? scaleMax;
  final Duration? scaleAnimDuration;

  const CircleArcWidget({
    super.key,
    required this.color,
    required this.startFromAngle,
    required this.drawTillAngle,
    required this.size,
    this.animateScale = false,
    this.scaleMin = 1.0,
    this.scaleMax = 1.0,
    this.scaleAnimDuration = const Duration(seconds: 4)
  });

  bool get shouldAnimateScale {
    if(animateScale){
      return scaleMin != 1.0 || scaleMax != 1.0;
    } else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final arcWidget =   CustomPaint(
      painter: CircleArcPainter(
        color: color,
        startAngle: startFromAngle,
        sweepAngle: drawTillAngle,
      ),
      child: SizedBox(
        width: size.width,
        height: size.height,
      ),
    );

    if(shouldAnimateScale){
      return InfiniteScaleAnimation(
        duration: scaleAnimDuration!,
        minScale: scaleMin!,
        maxScale: scaleMax!,
        child: arcWidget,
      );
    } else{
      return arcWidget;
    }
  }
}