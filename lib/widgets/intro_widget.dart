import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_utils/daily_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_website/colors.dart';
import 'package:personal_website/theme/text_themes.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/widgets/rotating_arcs/animated_rotating_circles_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../gen/assets.gen.dart';
import 'animated_slide_text_reveal_widget.dart';
import 'circle_arc_widget.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, I am",
                style: TextStyle(
                  fontSize: 42
                ),
              ),
              AnimatedSlideTextRevealWidget(
                text : "Hi, I am",
                textStyle: TextStyle(
                    fontSize: 42
                ),
                coverColor: kDeepBlack,
              ),
              const VerticalGap(2),
              AnimatedSlideTextRevealWidget(
                text : "Himanshu Khati",
                textStyle: context.highlightTextTheme.headlineLarge?.copyWith(
                  fontSize: 96
                ),
                coverColor: kDeepBlack,
              ),
              const VerticalGap(8),
              AnimatedSlideTextRevealWidget(
                text : "Android & Flutter dev with more than 6 years of experience",
                textStyle: context.highlightTextTheme.headlineLarge?.copyWith(
                    fontSize: 22
                ),
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
                          print("object wrr");
                          launchUrl(Uri.parse("https://himanshu-khati.netlify.app/resume-himanshu.pdf"));
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
                      launchUrl(Uri.parse("https://stackoverflow.com/users/8224232/m3g4tr0n"));
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
        Column(
          children: [

            AnimatedRotatingCircleWidget(
              splitCircleInNumberOfArcs: 4,
              colors: [
                kBabyPink,
                kDeepBlack,
                kBlue50,
                kCoffee,
                kGreen,
                kGrey
              ],
            )
          ],
        )
      ],
    );
  }
}
