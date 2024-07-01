import 'package:daily_utils/daily_utils.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/colors.dart';
import 'package:personal_website/gen/assets.gen.dart';
import 'package:personal_website/theme/text_themes.dart';
import 'package:personal_website/utils/screen_size_util.dart';
import 'package:personal_website/widgets/circular_caraousal/circular_corousal.dart';
import 'package:personal_website/widgets/experience_single_widget.dart';
import 'package:personal_website/widgets/master_detail/master_detail_widget.dart';

import '../widgets/animated_slide_text/animated_slide_text_reveal_widget.dart';

class PortfolioWidgetExperimental extends StatelessWidget {
  const PortfolioWidgetExperimental({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = ScreenSizeUtil.isLargeScreen(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: AnimatedSlideTextRevealWidget(
            text: "Where I've Built'",
            textStyle: context.highlightTextTheme.displayMedium,
            coverColor: kDeepBlack,
            duration: Duration(milliseconds: 1500),
          ),
        ),
        isLargeScreen ? const VerticalGap(50) : const VerticalGap(20),
        Stack(
          children: [
            Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(282.8427124746192, 0, -141.4213562373094),
              alignment: FractionalOffset.center,
              child: SizedBox(
                key: Key("Brown"),
                height: 400,
                width: 220,
                child: ColoredBox(color: Colors.brown),
              ),
            ),
            Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(397.484883957297, 0, 22.3928952206617),
              alignment: FractionalOffset.center,
              child: SizedBox(
                key: Key("Black"),
                height: 400,
                width: 220,
                child: ColoredBox(color: Colors.black),
              ),
            ),


          ],
        )

      ],
    );
  }
}
