import 'package:flutter/material.dart';

class CapsulePainter extends CustomPainter {
  final Color outlineColor;

  const CapsulePainter({
    required this.outlineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paddingHorizontal = size.width * 0.05;
    final paddingVertical = size.height * 0.07;
    final straightLinePadding = size.height * 0.30;


    final paint = Paint()
      ..color = outlineColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(
        paddingHorizontal,
        straightLinePadding,
      )
      ..lineTo(
          paddingHorizontal,
          size.height - straightLinePadding,
      )
      ..arcToPoint(
        Offset(size.width - paddingHorizontal, size.height - straightLinePadding),
        largeArc: true,
        clockwise: false,
        radius: const Radius.circular(12),
      )
      ..lineTo(
        size.width - paddingHorizontal,
        straightLinePadding,
      )
      ..arcToPoint(
        Offset(paddingHorizontal, straightLinePadding),
        largeArc: true,
        clockwise: false,
        radius: const Radius.circular(12),
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
