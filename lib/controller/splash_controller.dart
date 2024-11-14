
import 'package:get/get.dart';

class SplashController extends GetxController {
  bool isCentered = false;
   
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 300), () {
        isCentered = true;
        update();
    });
  }
}