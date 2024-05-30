
import 'package:flutter/material.dart';
import 'package:personal_website/widgets/circle_arc_widget.dart';
import 'package:personal_website/widgets/rotating_arcs/arcs_data_generator.dart';

class AnimatedRotatingCircleWidget extends StatefulWidget {

  final int splitCircleInNumberOfArcs;
  final List<Color> colors;

  const AnimatedRotatingCircleWidget({
    super.key,
    required this.splitCircleInNumberOfArcs,
    required this.colors
  });

  @override
  State<AnimatedRotatingCircleWidget> createState() => _AnimatedRotatingCircleWidgetState();
}

class _AnimatedRotatingCircleWidgetState extends State<AnimatedRotatingCircleWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<ArcData> arcData = List.empty();

  @override
  void initState() {
    super.initState();

    arcData = generateArcData(
      widget.splitCircleInNumberOfArcs,
      widget.colors
    );
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: generateCircleArcWidgetFromArcData()
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
          )
      );
    }

    return circleArcWidgets;
  }
}
