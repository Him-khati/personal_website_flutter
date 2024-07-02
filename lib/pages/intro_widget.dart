import 'dart:math';

import 'package:daily_utils/daily_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_website/colors.dart';
import 'package:personal_website/theme/text_themes.dart';
import 'package:personal_website/utils/screen_size_util.dart';
import 'package:personal_website/widgets/rotating_arcs/animated_rotating_circles_widget.dart';
import 'package:personal_website/widgets/rotating_arcs/arcs_data_generator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../gen/assets.gen.dart';
import '../widgets/animated_slide_text/animated_slide_text_reveal_widget.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = ScreenSizeUtil.isLargeScreen(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedSlideTextRevealWidget(
                text: "Hi, I am",
                textStyle: context.highlightTextTheme.headlineSmall,
                coverColor: kDeepBlack,
              ),
              const VerticalGap(2),
              AnimatedSlideTextRevealWidget(
                text: "Himanshu Khati",
                textStyle: context.highlightTextTheme.displayLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
                coverColor: kDeepBlack,
              ),
              const VerticalGap(8),
              AnimatedSlideTextRevealWidget(
                text:
                    "Android & Flutter dev",
                textStyle: context.highlightTextTheme.headlineMedium,
                coverColor: kDeepBlack,
              ),
              const VerticalGap(16),
              Row(
                children: [
                  SizedBox(
                      width: 180,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          launchUrl(Uri.parse(
                              "https://himanshu-khati.netlify.app/resume-himanshu.pdf"));
                        },
                        child: const Text("View Resume"),
                      )),
                  const HorizonatalGapWidget(30),
                  IconButton(
                    icon: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        Assets.images.icStackOverflow64x.path,
                      ),
                    ),
                    iconSize: 10,
                    highlightColor: Colors.blueAccent,
                    onPressed: () {
                      launchUrl(Uri.parse(
                          "https://stackoverflow.com/users/8224232/m3g4tr0n"));
                    },
                  ),
                  IconButton(
                    icon: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        Assets.images.icLinkedIn64x.path,
                      ),
                    ),
                    iconSize: 10,
                    highlightColor: Colors.blueAccent,
                    onPressed: () {
                      launchUrl(Uri.parse("https://github.com/Him-khati"));
                    },
                  ),

                  //
                  IconButton(
                    icon: SizedBox(
                      height: 40,
                      width: 40,
                      child: SvgPicture.asset(
                        Assets.images.icGithub,
                      ),
                    ),
                    iconSize: 10,
                    onPressed: () {
                      launchUrl(Uri.parse("https://github.com/Him-khati"));
                    },
                  )
                ],

              ),

            ]),
        if (isLargeScreen) _createArcsAndPhotoAnimation()
      ],
    );
  }

  Widget _createArcsAndPhotoAnimation() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: AnimatedRotatingCircleWidget(
            arcData: [
              ArcData(
                  startFromAngle: 100 * pi / 180,
                  drawTillAngle: pi / 4,
                  fillColor: Colors.black,
                  size: const Size(300, 300),
                  scaleAnimate: true,
                  scaleMin: 1.0,
                  scaleMax: 0.9,
                  scaleAnimDuration: const Duration(seconds: 2)),
              ArcData(
                  startFromAngle: 3 * pi / 4,
                  drawTillAngle: pi / 4,
                  fillColor: lighterPink,
                  size: const Size(800, 800),
                  scaleAnimate: true,
                  scaleMin: 1.0,
                  scaleMax: 0.9,
                  scaleAnimDuration: const Duration(seconds: 2)),
              ArcData(
                  startFromAngle: pi,
                  drawTillAngle: pi / 4,
                  fillColor: darkerPink,
                  size: const Size(500, 500),
                  scaleAnimate: true,
                  scaleMin: 1.0,
                  scaleMax: 1.2,
                  scaleAnimDuration: const Duration(seconds: 2)),
              ArcData(
                  startFromAngle: 21 * pi / 18,
                  drawTillAngle: 3 * pi / 8,
                  fillColor: moreSaturatedPink,
                  size: const Size(350, 350),
                  scaleAnimate: true,
                  scaleMin: 1.0,
                  scaleMax: 1.3,
                  scaleAnimDuration: const Duration(seconds: 2)),
              ArcData(
                startFromAngle: 21 * pi / 18,
                drawTillAngle: 3 * pi / 8,
                fillColor: lessSaturatedPink,
                size: const Size(600, 600),
              ),
              ArcData(
                  startFromAngle: 3 * pi / 2,
                  drawTillAngle: 3 * pi / 4,
                  fillColor: dullerPink,
                  scaleAnimate: true,
                  scaleMin: 1.0,
                  scaleMax: 1.2,
                  scaleAnimDuration: const Duration(seconds: 2)),
              ArcData(
                startFromAngle: 0,
                drawTillAngle: 110 * pi / 180,
                fillColor: moreGreenPink,
                size: const Size(500, 500),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Image.asset(Assets.images.imageHimanshu.path),
        )
      ],
    );
  }
}
