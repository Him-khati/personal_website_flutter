import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_utils/daily_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_website/colors.dart';
import 'package:personal_website/pages/experimental_widget.dart';
import 'package:personal_website/theme/text_themes.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/widgets/master_detail/master_detail_data.dart';
import 'package:personal_website/widgets/master_detail/master_details_widget.dart';
import 'package:personal_website/widgets/rotating_arcs/animated_rotating_circles_widget.dart';
import 'package:personal_website/widgets/rotating_arcs/arcs_data_generator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../gen/assets.gen.dart';
import '../widgets/animated_slide_text/animated_slide_text_reveal_widget.dart';
import '../widgets/rotating_arcs/circle_arc_widget.dart';

class WorkExperienceWidget extends StatelessWidget {
  const WorkExperienceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AnimatedSlideTextRevealWidget(
                text: "Where I have worked",
                textStyle: TextStyle(fontSize: 42),
                coverColor: kDeepBlack,
              ),
              const VerticalGap(2),
              MasterDetailsWidget(
                masterDetailData: [
                  MasterDetailData(id: "id-1", title: "title", widget: Text("Yeaaah")),
                  MasterDetailData(id: "id-2", title: "title - 2", widget: Text("Yeaaah")),
                  MasterDetailData(id: "id-3", title: "title - 3", widget: Text("Yeaaah")),
                  MasterDetailData(id: "id-4", title: "title - 4", widget: Text("Yeaaah"))
                ],
              )
          ],
        )
      ],
    );
  }
}
