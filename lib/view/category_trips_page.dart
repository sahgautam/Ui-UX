import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourist_application/controller/filtered_controller.dart';
import 'package:tourist_application/model/trip.dart';
import 'package:tourist_application/statics/static.dart';
import 'package:tourist_application/view/trip_details_page.dart';
import 'package:tourist_application/widgets/trip_widget.dart';

class CategoryTripsPage extends StatelessWidget {
  static String id = '/category_trips';

  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    print('arguments is $arguments');

    FilteredController filteredController = Get.find<FilteredController>();

    // Get trips for this category
    List<Trip> trips = filteredController.trips.where((trip) {
      return trip.categories.contains(arguments[0]) ? true : false;
    }).toList();
    print('trips is $trips');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: main_color,
        foregroundColor: Colors.white,
        title: Text(
          arguments[1],
          style: const TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
          ),
        ),
      ),
      body: (trips.isNotEmpty)
          ? ListView.builder(
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Get.toNamed(
                    TripDetailsPage.id,
                    arguments: trips[index],
                  );
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: TripWidget(
                    trip: trips[index],
                  ),
                ),
              ),
              itemCount: trips.length,
            )
          : Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 5,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('assets/images/trips_empty.png'),
                        ),
                      ),
                    ),
                    const Text(
                      'No trips available in this category',
                      style: TextStyle(fontSize: 18, fontFamily: 'OpenSans'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
