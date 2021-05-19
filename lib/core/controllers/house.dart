import 'package:get/get.dart';

class HouseController extends GetxController {
  int indexImage = 0;
  bool showMore = false;

  slideImage(int index) {
    indexImage = index;
    update();
  }

  showLongText() {
    showMore = !showMore;
    update();
  }
}
