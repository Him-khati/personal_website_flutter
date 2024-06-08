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
    this.duration = const Duration(seconds: 3),
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

  Animation<double> get pos =>
      Tween<double>(begin: textSize.height, end: 0).animate(CurvedAnimation(
          parent: animationController,
          curve: Interval(0.7, 1.0, curve: Curves.easeIn)));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    textSize = computeTextWidgetSize(
      context,
      widget.text,
      widget.textStyle,
    );

    return SizedBox(
      height: textSize.height,
      width: textSize.width + 40,
      child: Stack(children: [
        AnimatedBoxRevealAnimationWidget(
          animationController: animationController,
          height: textSize.height,
          width: textSize.width + 40,
          boxColor: Colors.black87,
          surfaceColor: Theme.of(context).colorScheme.surface,
        ),
        AnimatedBuilder(
            animation: animationController,
            builder: (c, v) {
              return Positioned(
                  top: pos.value,
                  child: Text(
                    widget.text,
                    softWrap: true,
                    maxLines: 3,
                    style: widget.textStyle,
                  ));
            })
      ]),
    );
  }
}
