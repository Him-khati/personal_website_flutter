import 'package:daily_utils/daily_utils.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/colors.dart';
import 'package:personal_website/gen/assets.gen.dart';
import 'package:personal_website/theme/text_themes.dart';
import 'package:personal_website/utils/screen_size_util.dart';
import 'package:personal_website/widgets/circular_caraousal/caraousal_slide_data.dart';
import 'package:personal_website/widgets/circular_caraousal/carousal_options.dart';
import 'package:personal_website/widgets/circular_caraousal/circular_corousal.dart';
import 'package:personal_website/widgets/experience_single_widget.dart';
import 'package:personal_website/widgets/master_detail/master_detail_widget.dart';

import '../widgets/animated_slide_text/animated_slide_text_reveal_widget.dart';

class PortfolioWidget extends StatelessWidget {
  const PortfolioWidget({super.key});

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
        CircularImageCarousalWidget(
          options: CarouselOptions(
            onSlideChangeCallback: (slideData){
              print(slideData.title);
            }
          ),
          images: [
            CarouselSlideData(id: 1, image: Image.asset(Assets.images.abstractWallpaperImage.path), title: "title 1", subtitle: "subtitle"),
            CarouselSlideData(id: 2, image: Image.asset(Assets.images.abstractWallpaperImage.path), title: "title 2", subtitle: "subtitle"),
            CarouselSlideData(id: 3, image: Image.asset(Assets.images.abstractWallpaperImage.path), title: "title 3", subtitle: "subtitle"),
            CarouselSlideData(id: 4, image: Image.asset(Assets.images.abstractWallpaperImage.path), title: "title 4", subtitle: "subtitle"),
            CarouselSlideData(id: 5, image: Image.asset(Assets.images.abstractWallpaperImage.path), title: "title 5", subtitle: "subtitle"),
            CarouselSlideData(id: 6, image: Image.asset(Assets.images.abstractWallpaperImage.path), title: "title 6", subtitle: "subtitle"),
            CarouselSlideData(id: 7, image: Image.asset(Assets.images.abstractWallpaperImage.path), title: "title 7", subtitle: "subtitle"),
            CarouselSlideData(id: 8, image: Image.asset(Assets.images.abstractWallpaperImage.path), title: "title 8", subtitle: "subtitle"),
          ],
        )
      ],
    );
  }
}
