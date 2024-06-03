import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_utils/daily_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_website/colors.dart';
import 'package:personal_website/theme/text_themes.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/utils/response_widget.dart';
import 'package:personal_website/utils/screen_size_util.dart';
import 'package:personal_website/widgets/bullet_point_section.dart';
import 'package:personal_website/widgets/rotating_arcs/animated_rotating_circles_widget.dart';
import 'package:personal_website/widgets/rotating_arcs/arcs_data_generator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../gen/assets.gen.dart';
import '../widgets/animated_slide_text/animated_slide_text_reveal_widget.dart';
import '../widgets/rotating_arcs/circle_arc_widget.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenSizeUtil.getScreenWidth(context) * 0.2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSlideTextRevealWidget(
            text: "About me",
            coverColor: kDeepBlack,
            textStyle: context.highlightTextTheme.displayMedium,
            duration: const Duration(milliseconds: 1500),
          ),
          const VerticalGap(40),
          Text(
            "My name is Himanshu Khati. I am software engineer developing native Android, apps for more than 6 Years. I am passionate about mobile and I'm always seeking to grow my skills and work with teams who share the same passion. Currently I am exploring Flutter, iOS, Kotlin Multiplatform, and Jetpack Compose. I am currently working @gigforce as Lead mobile developer Here are a few technologies I’ve worked with:",
            style: context.textTheme.bodyLarge,
          ),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: BulletPointSectionWidget(
              points: [
                "Android",
                "Flutter",
                "Kotlin",
                "Firebase",
                "Android Jetpack",
              ],
            ),
          )
        ],
      ),
    );
  }
}
