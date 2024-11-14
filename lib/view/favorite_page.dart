import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourist_application/controller/favorite_controller.dart';
import 'package:tourist_application/model/trip.dart';
import 'package:tourist_application/view/trip_details_page.dart';
import 'package:tourist_application/widgets/trip_widget.dart';

class FavoritePage extends StatelessWidget {
  static const id = '/FavoritePage';

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = Get.find<FavoriteController>();
    
    return Container(
      child: GetBuilder<FavoriteController>(
        init: favoriteController,
        builder:(controller)=> ListView.builder(
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Get.toNamed(
                TripDetailsPage.id,
                arguments: controller.favoriteTrips[index],
              );
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height / 3.5,
              child: TripWidget(
                trip: controller.favoriteTrips[index],
              ),
            ),
          ),
          itemCount: controller.favoriteTrips.length,
        ),
      ),
    );
  }
}
