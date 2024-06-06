import 'package:daily_utils/daily_utils.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/colors.dart';
import 'package:personal_website/widgets/experience_single_widget.dart';
import 'package:personal_website/widgets/master_detail/master_detail_widget.dart';

import '../widgets/animated_slide_text/animated_slide_text_reveal_widget.dart';

class WorkExperienceWidget extends StatelessWidget {
  const WorkExperienceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            const AnimatedSlideTextRevealWidget(
              text: "Where I have worked",
              textStyle: TextStyle(fontSize: 42),
              coverColor: kDeepBlack,
            ),
            const VerticalGap(2),
            MasterDetailsWidget(
              masterDetailData: [
                MasterDetailData(
                    id: "gigforce",
                    title: "Gigforce",
                    widget: ExperienceSingleWidget(
                      companyName: "Gigforce",
                      companyWebsite: "https://gigforce.in/",
                      position: "Android Deve",
                      startDate: DateTime(2021, 9),
                      endDate: null,
                      responsibilities: const [
                        "Developed and maintained Gigforce App",
                        "Built and shipped Chat module in Gigforce App using Firebase supporting notifications, text, image, video, location messages",
                        "Built Udemy styled Learning module to educate end users",
                        "Developed Giger attendance marking system and added various fraud checks like fake location check, distance deviation check face detection"
                      ],
                    )),
                MasterDetailData(
                  id: "vinners",
                  title: "Vinners",
                  widget: ExperienceSingleWidget(
                    companyName: "Vinners",
                    companyWebsite: "https://vinnersolutions.com/",
                    position: "Co-founder and Lead Android Developer",
                    startDate: DateTime(2021, 9),
                    endDate: DateTime(2021, 9),
                    responsibilities: const [
                      "Building features of various apps in Kotlin and Java Like Ticketing system, User location tracking, User Schedule Mgmt., Dynamic forms, Inventory Mgmt. etc.",
                      "Creating and maintaining company internal libraries.",
                      "Releasing updates and monitoring health of various apps.",
                      "Setting up and maintaining CI/CD pipelines using Circle-CI and Fastlane.",
                      "Working with external security team in identifying and fixing security issues.",
                      "Automated code testing by introducing Unit and Intrumentaion test and testing as a step in CI piplines and code reviews.",
                      "Interviewing candidates for mobile apps and upskilling them.",
                      "Researching and implementing android architectures and best practices."
                    ],
                  ),
                ),
                MasterDetailData(
                  id: "vinners",
                  title: "Vinners",
                  widget: ExperienceSingleWidget(
                    companyName: "Vinners",
                    companyWebsite: "https://vinnersolutions.com/",
                    position: "Co-founder and Lead Android Developer",
                    startDate: DateTime(2021, 9),
                    endDate: DateTime(2021, 9),
                    responsibilities: const [
                      "Building features of various apps in Kotlin and Java Like Ticketing system, User location tracking, User Schedule Mgmt., Dynamic forms, Inventory Mgmt. etc.",
                      "Creating and maintaining company internal libraries.",
                      "Releasing updates and monitoring health of various apps.",
                      "Setting up and maintaining CI/CD pipelines using Circle-CI and Fastlane.",
                      "Working with external security team in identifying and fixing security issues.",
                      "Automated code testing by introducing Unit and Intrumentaion test and testing as a step in CI piplines and code reviews.",
                      "Interviewing candidates for mobile apps and upskilling them.",
                      "Researching and implementing android architectures and best practices."
                    ],
                  ),
                ),
                MasterDetailData(
                  id: "vinners",
                  title: "Vinners",
                  widget: ExperienceSingleWidget(
                    companyName: "Vinners",
                    companyWebsite: "https://vinnersolutions.com/",
                    position: "Co-founder and Lead Android Developer",
                    startDate: DateTime(2021, 9),
                    endDate: DateTime(2021, 9),
                    responsibilities: const [
                      "Building features of various apps in Kotlin and Java Like Ticketing system, User location tracking, User Schedule Mgmt., Dynamic forms, Inventory Mgmt. etc.",
                      "Creating and maintaining company internal libraries.",
                      "Releasing updates and monitoring health of various apps.",
                      "Setting up and maintaining CI/CD pipelines using Circle-CI and Fastlane.",
                      "Working with external security team in identifying and fixing security issues.",
                      "Automated code testing by introducing Unit and Intrumentaion test and testing as a step in CI piplines and code reviews.",
                      "Interviewing candidates for mobile apps and upskilling them.",
                      "Researching and implementing android architectures and best practices."
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
