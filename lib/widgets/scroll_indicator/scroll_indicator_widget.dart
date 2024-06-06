import 'package:flutter/material.dart';
import 'package:personal_website/widgets/painters/circle_painter.dart';
import 'package:personal_website/widgets/scroll_indicator/mouse_outline_painter.dart';

class ScrollIndicatorWidget extends StatefulWidget {
  final double width;
  final double height;
  final Color color;

  const ScrollIndicatorWidget({
    super.key,
    required this.color,
    this.height = 80,
    this.width = 35,
  });

  @override
  State<ScrollIndicatorWidget> createState() => _ScrollIndicatorWidgetState();
}

class _ScrollIndicatorWidgetState extends State<ScrollIndicatorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> mouseCircleOffset;
  late Animation<double> opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..forward()
      ..reset()
      ..repeat();

    mouseCircleOffset = Tween<double>(
      begin: widget.height * 0.1, // Start off the screen (below)
      end: widget.height * 0.6,
    ).animate(_controller);

    opacity = Tween<double>(
      begin: 1, // Start off the screen (below)
      end: 0.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomPaint(
        painter: CapsulePainter(outlineColor: widget.color),
        child: SizedBox(
          width: widget.width,
          height: widget.height,
        ),
      ),

      AnimatedBuilder(
          animation: mouseCircleOffset,
          builder: (context, child) {
            return Positioned(
                left: widget.width / 2 - 6,
                top: mouseCircleOffset.value,
                child: Opacity(
                  opacity: opacity.value,
                  child: CustomPaint(
                    painter: CirclePainter(color: widget.color),
                    child: const SizedBox(
                      width: 12,
                      height: 12,
                    ),
                  ),
                ));
          })
    ]);
  }
}
