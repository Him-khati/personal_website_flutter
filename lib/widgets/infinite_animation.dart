import 'dart:math';

import 'package:flutter/material.dart';

class InfiniteRotationAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const InfiniteRotationAnimation({
    super.key,
    required this.child,
    required this.duration,
  });

  @override
  State<InfiniteRotationAnimation> createState() =>
      _InfiniteRotationAnimationState();
}

class _InfiniteRotationAnimationState extends State<InfiniteRotationAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  )
    ..forward()
    ..repeat();

  Animation<double> get rotationAnimation =>
      Tween<double>(begin: 0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.linear,
        ),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: rotationAnimation,
      child: widget.child,
    );

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Transform.rotate(
          angle: rotationAnimation.value,
          child: widget.child,
        );
      },
    );
  }
}
