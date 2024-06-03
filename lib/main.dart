import 'package:flutter/material.dart';
import 'package:personal_website/pages/work_experience_widget.dart';
import 'package:personal_website/scroll_home_screen_behaviour.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/utils/response_widget.dart';
import 'package:personal_website/pages/about_me_widget.dart';
import 'package:personal_website/pages/intro_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Himanshu Khati',
      scrollBehavior: AppScrollBehavior(),
      theme: context.lightTheme(context),
      darkTheme: context.darkTheme(context),
      home: Scaffold(
        body: ResponsiveWidget(
          smallScreenWidget: _buildSmallHomeScreen(),
          mediumScreenWidget: _buildMediumHomeScreen(),
          largeScreenWidget: _buildLargeHomeScreen(),
        ),
      ),
    );
  }

  Widget _buildSmallHomeScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: _buildHomeScreenContent(),
    );
  }

  Widget _buildMediumHomeScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: _buildHomeScreenContent(),
    );
  }

  Widget _buildLargeHomeScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 160),
      child: _buildHomeScreenContent(),
    );
  }

  Widget _buildHomeScreenContent() {
    return PageView(
      scrollDirection: Axis.vertical,
      children: const [
        IntroWidget(),
        AboutMeWidget(),
        WorkExperienceWidget()
      ],
    );
  }
}

