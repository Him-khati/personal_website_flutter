import 'package:flutter/material.dart';

class AnimatedFadeInWidget extends AnimatedWidget {
  final Widget child;
  final Duration duration;
  final AnimationController animationController;

  const AnimatedFadeInWidget({
    super.key,
    required this.animationController,
    required this.child,
    this.duration = const Duration(milliseconds: 700),
  }) : super(listenable: animationController);

  Animation<double> get opacity =>
      Tween<double>(begin: 0.2, end: 0.5).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn),
      );

  @override
  Widget build(BuildContext context) {
    throw FadeTransition(
      opacity: opacity,
      child: child,
    );
  }
}