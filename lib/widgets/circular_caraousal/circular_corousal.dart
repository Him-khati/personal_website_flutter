import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:personal_website/colors.dart';
import 'package:personal_website/extensions/list_extensions.dart';
import 'package:personal_website/utils.dart';
import 'package:personal_website/utils/screen_size_util.dart';
import 'package:personal_website/widgets/circular_caraousal/caraousal_slide_placement_data.dart';

import 'caraousal_slide_data.dart';
import 'carousal_options.dart';
import 'carousal_slide.dart';

class CircularImageCarousalWidget extends StatefulWidget {
  final List<CarouselSlideData> images;
  final CarouselOptions? options;

  const CircularImageCarousalWidget({
    super.key,
    required this.images,
    this.options
  });

  @override
  State<CircularImageCarousalWidget> createState() =>
      _CircularImageCarousalWidgetState();
}

class _CircularImageCarousalWidgetState
    extends State<CircularImageCarousalWidget>
    with TickerProviderStateMixin {

  // Carousal Data
  List<CarouselSlidePlacementAndData> carousalData = [];
  double widgetSeparationAngleInRadian = 0;
  double angleRotatedSoFarFromInitialPosition = 0;
  double offsetAngle = 0;

  late AnimationController _rotateCarousalAntiClockWiseAnimationController;
  late AnimationController _rotateCarousalClockWiseAnimationController;

  late Animation<double> rotateAntiClockWiseAnimation;
  late Animation<double> rotateClockWiseAnimation;

  @override
  void initState() {
    super.initState();
    _createCarousalFromProvidedWidgets();

    //Dividing 360 (2pi) into equal angles
    offsetAngle = -((pi / 2 ) - widgetSeparationAngleInRadian) ;
    widgetSeparationAngleInRadian = (2 * pi) / widget.images.length;

    _rotateCarousalAntiClockWiseAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          angleRotatedSoFarFromInitialPosition += widgetSeparationAngleInRadian;
          _rotateCarousalAntiClockWiseAnimationController.reset();

          final slideInFront = carousalData.minValue((s){
            return s.z;
          });

          if(slideInFront != null && widget.options?.onSlideChangeCallback != null) {
            widget.options!.onSlideChangeCallback!(
                slideInFront.data
            );
          }
        }
      });

    _rotateCarousalClockWiseAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          angleRotatedSoFarFromInitialPosition -= widgetSeparationAngleInRadian;
          _rotateCarousalClockWiseAnimationController.reset();

          final slideInFront = carousalData.minValue((s){
            return s.z;
          });

         if(slideInFront != null && widget.options?.onSlideChangeCallback != null) {
           widget.options!.onSlideChangeCallback!(
               slideInFront.data
           );
         }
        }
      });

    rotateAntiClockWiseAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _rotateCarousalAntiClockWiseAnimationController,
      curve: Curves.fastOutSlowIn,
    ));

    rotateClockWiseAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _rotateCarousalClockWiseAnimationController,
      curve: Curves.fastOutSlowIn,
    ));
  }

  void _createCarousalFromProvidedWidgets() {
    carousalData = List.generate(widget.images.length, (index) {
      return CarouselSlidePlacementAndData(
        index,
        widget.images[index]
      );
    });
  }

  @override
  void dispose() {
    _rotateCarousalAntiClockWiseAnimationController.dispose();
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
          + rotateAntiClockWiseAnimation.value * widgetSeparationAngleInRadian // Animation Done in current cycle so far
          - rotateClockWiseAnimation.value * widgetSeparationAngleInRadian;

      final x = radius * cos(rotationAngle) * 3.5;
      final z = radius * sin(rotationAngle);

      cSlide.angle = rotationAngle;
      cSlide.x = x;
      cSlide.y = 0;
      cSlide.z = z;

      cSlide.maxZ = maxZ;
      cSlide.maxX = maxX;

   //   print("Index : ${cSlide.index} x= $x ,z : $z maxX= $maxX, maxZ= $maxZ , opacity : ${roundToTwoDecimalPlaces(x)/maxX}");

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

    return SwipeDetector(

      onSwipeLeft: (x){
        print("Pan Clockwise");
        _rotateCarousalClockWiseAnimationController.forward();
      },

      onSwipeRight: (x){
        print("Pan Anticlockwise");
        _rotateCarousalAntiClockWiseAnimationController.forward();
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
