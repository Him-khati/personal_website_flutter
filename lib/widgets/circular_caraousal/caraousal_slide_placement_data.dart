import 'package:personal_website/widgets/circular_caraousal/caraousal_slide_data.dart';

class CarouselSlidePlacementAndData {
  final int index;
  late double x, y, z, angle;
  bool greyScale = false;
  late double maxX, maxZ;
  final CarouselSlideData data;

  CarouselSlidePlacementAndData(this.index, this.data,);
}
