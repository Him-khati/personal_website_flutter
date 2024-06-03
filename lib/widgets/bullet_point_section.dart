import 'dart:math';

import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:daily_utils/daily_utils.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/theme/theme.dart';

class BulletPointSectionWidget extends StatelessWidget {
  final List<String> points;

  const BulletPointSectionWidget({
    super.key,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {

    return AutoHeightGridView(
      itemCount: points.length,
      builder: (context,index){
        return BulletPointWidget(points[index]);
      },
    );
  }
}

class BulletPointWidget extends StatelessWidget {
  final String text;

  const BulletPointWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomPaint(
          painter: BulletPainter(context.colors.primary),
          child: const SizedBox(height: 10, width: 10),
        ),
        const HorizonatalGapWidget(8),
        Text(text)
      ],
    );
  }
}

class BulletPainter extends CustomPainter {
  final Color color;

  BulletPainter(this.color,);

  late Paint bulletPaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = color
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    final path = createPath(3, 9);
    canvas.drawPath(path, bulletPaint);
  }

  Path createPath(int sides, double radius) {
    var path = Path();
    var angle = (pi * 2) / sides;
    path.moveTo(radius * cos(0.0), radius * sin(0.0));
    for (int i = 1; i <= sides; i++) {
      double x = radius * cos(angle * i);
      double y = radius * sin(angle * i);
      path.lineTo(x, y);
    }
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
