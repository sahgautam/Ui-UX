import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:tourist_application/controller/animation_controller.dart';
import 'package:tourist_application/controller/favorite_controller.dart';
import 'package:tourist_application/model/trip.dart';
import 'package:tourist_application/statics/static.dart';
import 'package:tourist_application/widgets/trip_other_info.dart';

class TripDetailsPage extends StatelessWidget {
  static const String id = '/TripDetailsPage';

  @override
  Widget build(BuildContext context) {
    Trip tripDetails = Get.arguments as Trip;
    print('arguments from cateogry_trips is $tripDetails');
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    FavoriteController favoriteController = Get.find<FavoriteController>();

    // intialize animation controller
    AnimationsController animationsController = Get.put(AnimationsController());
    animationsController.animateTripDetails();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: main_color,
        foregroundColor: Colors.white,
        title: Text(
          tripDetails.title,
          style: const TextStyle(
            fontFamily: 'ElMessiri',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              tripDetails.imageUrl,
              fit: BoxFit.cover,
              height: height / 3,
              width: width,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Image.asset(
                    'assets/images/image_thumbnail.png',
                    width: width,
                    height: height / 3,
                    fit: BoxFit.cover,
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/image_thumbnail.png',
                  width: width / 2.10,
                  height: 230,
                  fit: BoxFit.cover,
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8.0,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'الأنشطة',
                  style: Get.theme.textTheme.headlineMedium,
                ),
              ),
            ),
            GetBuilder<AnimationsController>(
              init: animationsController,
              builder: (controller) => AnimatedBuilder(
                animation: controller.tripDetailsAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, controller.tripDetailsAnimation.value),
                    child: TripOtherInfo(
                      tripListInfo: tripDetails.activities,
                      isProgram: false,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8.0,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'البرنامج اليومي',
                  style: Get.theme.textTheme.headlineMedium,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GetBuilder<AnimationsController>(
              builder: (controller) => AnimatedBuilder(
                animation: controller.tripDetailsAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, controller.tripDetailsAnimation.value),
                    child: TripOtherInfo(
                      tripListInfo: tripDetails.program,
                      isProgram: true,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GetBuilder<FavoriteController>(
        init: favoriteController,
        builder: (controller) => FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {
            if (controller.favoriteTrips.contains(tripDetails)) {
              print('trip ${tripDetails.title} will removed from favorites');
              controller.removeTripFromFavorite(tripDetails);
            } else {
              print('trip ${tripDetails.title} will added to favorites');
              controller.addTripToFavorite(tripDetails);
            }
          },
          shape: const CircleBorder(),
          child: controller.favoriteTrips.contains(tripDetails)
              ? const Icon(Icons.star)
              : const Icon(Icons.star_border),
        ),
      ),
    );
  }
}
