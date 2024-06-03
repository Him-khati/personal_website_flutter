
import 'package:flutter/material.dart';
import 'package:personal_website/widgets/rotating_arcs/circle_arc_widget.dart';
import 'package:personal_website/widgets/infinite_animation.dart';
import 'package:personal_website/widgets/rotating_arcs/arcs_data_generator.dart';

class AnimatedRotatingCircleWidget extends StatelessWidget {
  final List<ArcData> arcData;

  const AnimatedRotatingCircleWidget({
    super.key,
    required this.arcData
  });

  @override
  Widget build(BuildContext context) {
    return InfiniteRotationAnimation(
      duration: const Duration(seconds: 40),
      child: Stack(
          alignment: Alignment.center,
          children: generateCircleArcWidgetFromArcData()
      ),
    );
  }

  List<Widget> generateCircleArcWidgetFromArcData() {
    List<Widget> circleArcWidgets = [];

    for (var value in arcData) {
      circleArcWidgets.add(
          CircleArcWidget(
            color: value.fillColor,
            startFromAngle: value.startFromAngle,
            drawTillAngle: value.drawTillAngle,
            size: value.size ?? const Size(400, 400),
            animateScale: value.scaleAnimate,
            scaleMin: value.scaleMin,
            scaleMax: value.scaleMax,
            scaleAnimDuration: value.scaleAnimDuration,
          )
      );
    }

    return circleArcWidgets;
  }
}

