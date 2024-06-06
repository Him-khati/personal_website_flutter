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
      mainAxisSpacing: 0,
      builder: (context, index) {
        return BulletPointWidget(points[index]);
      },
    );
  }
}

class BulletPointWidget extends StatelessWidget {
  final String text;

  const BulletPointWidget(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomPaint(
          painter: BulletPainter(context.colors.primary),
          child: const SizedBox(height: 8, width: 8),
        ),
        const HorizonatalGapWidget(8),
        Text(text)
      ],
    );
  }

  static List<Widget> fromList(List<String> responsibilities) =>
      responsibilities.map((e) {
        return BulletPointWidget(e);
      }).toList();
}

class BulletPainter extends CustomPainter {
  final Color color;

  BulletPainter(
    this.color,
  );

  late Paint bulletPaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = color
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    final path = createPath(size);
    canvas.drawPath(path, bulletPaint);
  }

  Path createPath(Size size) {
    return Path()
      ..lineTo(
        size.width,
        size.height / 2,
      )
      ..lineTo(
        0,
        size.height,
      )
      ..close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
