import 'package:flutter/material.dart';
import 'package:personal_website/pages/about_me_widget.dart';
import 'package:personal_website/pages/about_me_widget.dart';
import 'package:personal_website/pages/home_widget.dart';
import 'package:personal_website/pages/intro_widget.dart';
import 'package:personal_website/pages/work_experience_widget.dart';
import 'package:personal_website/scroll_home_screen_behaviour.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/utils/response_widget.dart';
import 'package:personal_website/widgets/scroll_indicator/scroll_indicator_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Himanshu Khati',
      scrollBehavior: AppScrollBehavior(),
      theme: context.lightTheme(context),
      darkTheme: context.lightTheme(context),
      themeMode: ThemeMode.system,
      home: const HomeWidget(),
    );
  }
}
