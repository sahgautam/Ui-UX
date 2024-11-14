import 'package:get/get.dart';

class HomeController extends GetxController {
  int pageIndex = 0;

  changeIndex() {
    pageIndex = (pageIndex == 0) ? 1 : 0;
    update();
  }
}
