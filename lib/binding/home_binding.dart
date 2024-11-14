import 'package:get/get.dart';
import 'package:tourist_application/controller/favorite_controller.dart';
import 'package:tourist_application/controller/filtered_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    print('HomeBinding, dependencies()');
    Get.put(FilteredController(), permanent: true);
    Get.put(FavoriteController(), permanent: true);
  }
}
