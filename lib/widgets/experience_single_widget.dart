import 'package:daily_utils/daily_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_website/utils/list_helpers.dart';
import 'package:personal_website/widgets/animated_fade_in_widget.dart';
import 'package:personal_website/widgets/bullet_point_section.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceSingleWidget extends StatelessWidget {
  final String position;
  final DateTime startDate;
  final DateTime? endDate;
  final String companyName;
  final String companyWebsite;
  final List<String> responsibilities;

  const ExperienceSingleWidget({
    super.key,
    required this.position,
    required this.startDate,
    this.endDate,
    required this.companyName,
    required this.companyWebsite,
    required this.responsibilities,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildPositionAndCompanyText(context),
        const VerticalGap(4),
        buildEmploymentDuration(context),
        const VerticalGap(4),
        buildResponsibilitiesList(context)
      ],
    );
  }

  Widget buildPositionAndCompanyText(BuildContext context) {
    TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 20.0);
    TextStyle linkStyle = TextStyle(color: Colors.blue);

    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: <TextSpan>[
          TextSpan(text: position, style: defaultStyle),
          TextSpan(text: ' @ ', style: defaultStyle),
          TextSpan(
              text: companyName,
              style: linkStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrl(Uri.parse(companyWebsite));
                }),
        ],
      ),
    );
  }

  Widget buildEmploymentDuration(
    BuildContext context,
  ) {
    final DateFormat formatter = DateFormat('MMM yyyy');
    final String dateText;

    if (endDate != null) {
      dateText =
          "${formatter.format(startDate)} - ${formatter.format(endDate!)}";
    } else {
      dateText = "${formatter.format(startDate)} - Present";
    }

    return Text(dateText);
  }

  Widget buildResponsibilitiesList(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: BulletPointWidget.fromList(responsibilities).fillSpaceInBetween(6),
    );
  }
}
