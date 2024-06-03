import 'package:flutter/material.dart';
import 'package:personal_website/widgets/text_size_helper.dart';

import 'animated_box_reveal_widget.dart';

class AnimatedSlideTextRevealWidget extends StatefulWidget {
  final String text;
  final Color coverColor;
  final TextStyle? textStyle;
  final Duration duration;

  const AnimatedSlideTextRevealWidget({
    super.key,
    required this.text,
    required this.coverColor,
    required this.textStyle,
    this.duration = const Duration(seconds: 3)
  });

  @override
  State<AnimatedSlideTextRevealWidget> createState() =>
      _AnimatedSlideTextRevealWidgetState();
}

class _AnimatedSlideTextRevealWidgetState
    extends State<AnimatedSlideTextRevealWidget> with TickerProviderStateMixin {
  late Size textSize;

  late AnimationController animationController = AnimationController(
    vsync: this,
    duration: widget.duration,
  )..forward();

  late Animation<RelativeRect> textSlideUpAnimation = RelativeRectTween(
    begin: RelativeRect.fromSize(
      Rect.fromLTWH(0, textSize.height, textSize.width, textSize.height),
      Size(textSize.width, textSize.height),
    ),
    end: RelativeRect.fromSize(
      Rect.fromLTWH(0, 0, textSize.width, textSize.height),
      Size(textSize.width, textSize.height),
    ),
  ).animate(CurvedAnimation(
    parent: animationController,
    curve: const Interval(0.7, 1.0, curve: Curves.easeIn),
  ));

  @override
  void initState() {
    super.initState();
    textSize = computeTextWidgetSize(
      widget.text,
      widget.textStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      AnimatedBoxRevealAnimationWidget(
        animationController: animationController,
        height: textSize.height,
        width: textSize.width,
        boxColor: Colors.blueGrey,
        surfaceColor: Theme.of(context).colorScheme.surface,
      ),
      PositionedTransition(
        rect: textSlideUpAnimation,
        child: Text(
          widget.text,
          style: widget.textStyle,
        ),
      )
    ]);
  }
}
