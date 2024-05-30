import 'dart:ui';

import 'package:flutter/material.dart';

import 'circle_arc_painter.dart';

class CircleArcWidget extends StatefulWidget {

  final Color color;
  final double startFromAngle;
  final double drawTillAngle;

  const CircleArcWidget({
    super.key,
    required this.color,
    required this.startFromAngle,
    required this.drawTillAngle
  });

  @override
  State<CircleArcWidget> createState() => _CircleArcWidgetState();
}

class _CircleArcWidgetState extends State<CircleArcWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CircleArcPainter(
        color: widget.color,
        startAngle: widget.startFromAngle,
        sweepAngle: widget.drawTillAngle,
      ),
      child: const SizedBox(
        width: 400,
        height: 400,
      ),
    );
  }
}
