import 'package:get/get.dart';
import 'package:tourist_application/model/trip.dart';

class FavoriteController extends GetxController {
  List<Trip> favoriteTrips = [];

  void addTripToFavorite(Trip trip) {
    favoriteTrips.add(trip);
    update();
  }

  void removeTripFromFavorite(Trip trip) {
    favoriteTrips.remove(trip);
    update();
  }
}
