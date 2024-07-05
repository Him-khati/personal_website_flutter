import 'caraousal_slide_data.dart';

///Callbacks
typedef CarouselScrollEndCallback = void Function(CarouselSlideData slide);

class CarouselOptions {
  final CarouselScrollEndCallback? onSlideChangeCallback;

  CarouselOptions({
   this.onSlideChangeCallback
  });
}
