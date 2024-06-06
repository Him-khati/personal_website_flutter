import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final Color color;

  const CirclePainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2, // Assuming Circle is Drawn in a square
      Paint()..color = color,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
