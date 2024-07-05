import 'package:flutter/material.dart';
import 'package:personal_website/pages/about_me_widget.dart';
import 'package:personal_website/pages/intro_widget.dart';
import 'package:personal_website/pages/portfolio_widget.dart';
import 'package:personal_website/pages/portfolio_widget_experimentak.dart';
import 'package:personal_website/pages/work_experience_widget.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/utils/response_widget.dart';
import 'package:personal_website/widgets/scroll_indicator/scroll_indicator_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with TickerProviderStateMixin {
  late IntroWidget introWidget = const IntroWidget();
  late AboutMeWidget aboutMeWidget = const AboutMeWidget();
  late WorkExperienceWidget workExperienceWidget = const WorkExperienceWidget();
  late PortfolioWidget portfolioWidget = const PortfolioWidget();

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  Animation<Offset> get hideToolBarAnimationOffset =>
      Tween<Offset>(begin: Offset.zero, end: const Offset(0, -1))
          .animate(_animationController);

  PageController _pageController = PageController();

  // Flags
  bool showAppBar = true;
  bool areWeOnFirstPage = true;
  double currentPageIndex = 0.0;

  @override
  void initState() {
    super.initState();
    _initMainPageScrollListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        smallScreenWidget: _buildSmallHomeScreen(context),
        mediumScreenWidget: _buildMediumHomeScreen(context),
        largeScreenWidget: _buildLargeHomeScreen(
          context,
        ),
      ),
    );
  }

  Widget _buildSmallHomeScreen(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: _buildHomeScreenContent(context: context),
    );
  }

  Widget _buildMediumHomeScreen(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: _buildHomeScreenContent(context: context),
    );
  }

  Widget _buildLargeHomeScreen(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 160),
      child: _buildHomeScreenContent(
        context: context,
        showScrollMouseWidget: areWeOnFirstPage,
      ),
    );
  }

  Widget _buildHomeScreenContent({
    required BuildContext context,
    bool showScrollMouseWidget = false,
  }) {
    return Stack(children: [

      PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: [
          introWidget,
          aboutMeWidget,
         // workExperienceWidget,

        ],
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: areWeOnFirstPage ? 1 : 0,
          child: ScrollIndicatorWidget(
            color: context.colors.primary,
          ),
        ),
      ),

      SlideTransition(
        position: hideToolBarAnimationOffset,
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: AppBar(
            foregroundColor: null,
            backgroundColor: null,
            surfaceTintColor: null,
            scrolledUnderElevation: 0.0,
            actions: [
              TextButton(
                onPressed: () {},
                child: TextButton(child: const Text("Home"),onPressed: (){
                  _pageController.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                },),
              ),TextButton(
                onPressed: () {},
                child: TextButton(child: const Text("About"),onPressed: (){
                  _pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                },),
              ),TextButton(
                onPressed: () {},
                child: TextButton(child: const Text("Work"),onPressed: (){
                  _pageController.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                },),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text("Resume"),
              )
            ],
          ),
        ),
      ),
    ]);
  }

  void _initMainPageScrollListener() {
    _pageController = PageController();
    _pageController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final lastScrollPosition = currentPageIndex;
    final newScrollPosition = _pageController.page!;
    currentPageIndex = newScrollPosition;
    areWeOnFirstPage = newScrollPosition == 0.0;

    if (newScrollPosition > lastScrollPosition) {
      // Scroll Down
      if (showAppBar) {
        showAppBar = false;
       _animationController.forward();
        setState(() {});
      }
    } else {
      //Scroll Up
      if (!showAppBar) {
        showAppBar = true;
       _animationController.reverse();
        setState(() {});
      }
    }
  }
}
