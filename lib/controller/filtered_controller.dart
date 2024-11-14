import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tourist_application/model/app_data.dart';
import 'package:tourist_application/model/trip.dart';

class FilteredController extends GetxController {
  var isSummer = true;
  var isWinter = true;
  var isForFamily = true;

  List<Trip> trips = [];

  @override
  void onInit() {
    super.onInit();

    changeTripsWithFilter();
  }

  void chanageValueForSummer() {
    isSummer = !isSummer;
    print('isSummer is $isSummer');
    changeTripsWithFilter();
    update();
  }

  void chanageValueForWinter() {
    isWinter = !isWinter;
    changeTripsWithFilter();
    update();
  }

  void chanageValueForForFamily() {
    isForFamily = !isForFamily;
    changeTripsWithFilter();
    update();
  }

  void changeTripsWithFilter() {
    // add the filterd for this category tips
    print('summer is $isSummer, winter is $isWinter, family $isForFamily');
    trips = Trips_data.where((trip) {
      if (isSummer == true && trip.isInSummer == true ||
          isWinter == true && trip.isInWinter == true ||
          isForFamily == true && trip.isForFamilies == true) {
        return true;
      }
      return false;
    }).toList();
    update();
  }
}

