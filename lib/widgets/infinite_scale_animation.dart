import 'dart:math';

import 'package:flutter/material.dart';

class InfiniteScaleAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double minScale;
  final double maxScale;

  const InfiniteScaleAnimation({
    super.key,
    required this.child,
    required this.duration,
    required this.minScale,
    required this.maxScale
  });

  @override
  State<InfiniteScaleAnimation> createState() =>
      _InfiniteScaleAnimationState();
}

class _InfiniteScaleAnimationState extends State<InfiniteScaleAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  )
    ..repeat(reverse: true);

  Animation<double> get rotationAnimation =>
      Tween<double>(begin: widget.minScale, end: widget.maxScale).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: rotationAnimation,
      child: widget.child,
    );
  }
}
