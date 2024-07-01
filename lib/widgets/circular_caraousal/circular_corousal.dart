import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personal_website/colors.dart';
import 'package:personal_website/utils.dart';
import 'package:personal_website/utils/screen_size_util.dart';
import 'package:personal_website/widgets/circular_caraousal/caraousal_data.dart';

import 'carousal_slide.dart';

class CircularImageCarousalWidget extends StatefulWidget {
  final List<Widget> images;

  const CircularImageCarousalWidget({
    super.key,
    required this.images,
  });

  @override
  State<CircularImageCarousalWidget> createState() =>
      _CircularImageCarousalWidgetState();
}

class _CircularImageCarousalWidgetState
    extends State<CircularImageCarousalWidget>
    with SingleTickerProviderStateMixin {
  ///By default when we


  // Carousal Data
  List<CarouselData> carousalData = [];
  double widgetSeparationAngleInRadian = 0;
  double angleRotatedSoFarFromInitialPosition = 0;
  double offsetAngle = 0;

  late AnimationController _animationController;
  late Animation<double> rotationAnimation;

  @override
  void initState() {
    super.initState();
    _createCarousalFromProvidedWidgets();

    //Dividing 360 (2pi) into equal angles
    offsetAngle = -((pi / 2 ) - widgetSeparationAngleInRadian) ;
    widgetSeparationAngleInRadian = (2 * pi) / widget.images.length;

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          angleRotatedSoFarFromInitialPosition += widgetSeparationAngleInRadian;
          _animationController.reset();
        }
      });

    rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));
  }

  void _createCarousalFromProvidedWidgets() {
    carousalData = List.generate(widget.images.length, (index) {
      return CarouselData(
        index,
        widget.images[index]
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late double radius = min(
        ScreenSizeUtil.getScreenHeight(context),
        ScreenSizeUtil.getScreenWidth(context)
    ) / 6;

    final maxZ = radius * sin(pi / 2);
    final maxX = radius * cos(-2 * pi) * 3.5 ;

    for (int i = 0; i < carousalData.length; i++) {
      final cSlide = carousalData[i];

      final rotationAngle = cSlide.index * widgetSeparationAngleInRadian // Angle Calculated
          + angleRotatedSoFarFromInitialPosition //Angle Rotated So Far from Start
          + offsetAngle //By default Slides are laid from right side side of screen but we need card from Center of screen
          + rotationAnimation.value * widgetSeparationAngleInRadian; // Animation Done in current cycle so far

      final x = radius * cos(rotationAngle) * 3.5;
      final z = radius * sin(rotationAngle);

      cSlide.angle = rotationAngle;
      cSlide.x = x;
      cSlide.y = 0;
      cSlide.z = z;

      cSlide.maxZ = maxZ;
      cSlide.maxX = maxX;

      print("Index : ${cSlide.index} x= $x ,z : $z maxX= $maxX, maxZ= $maxZ , opacity : ${roundToTwoDecimalPlaces(x)/maxX}");

      cSlide.greyScale = cSlide.angle % (pi / 2) != 0;
    }
    carousalData.sort((a, b) => b.z.compareTo(a.z));

    List<Widget> slides = carousalData.map((slide) {
      return Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..translate(
            slide.x,
            slide.y,
            slide.z,
          ),
        alignment: FractionalOffset.center,
        child: CarousalSlideWidget(data: slide,),
      );
    }).toList();

    return GestureDetector(
      onPanEnd: (e) {
        _animationController.forward();
      },
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: slides,
        ),
      ),
    );
  }
}
