import 'package:flutter/material.dart';
import 'package:tourist_application/model/trip.dart';

class TripWidget extends StatelessWidget {
  TripWidget({
    required this.trip,
  });

  final Trip trip;

  String getSeason(Season season) {
    String seasonText = '';
    switch (season) {
      case Season.Summer:
        seasonText = 'الصيف';
      case Season.Spring:
        seasonText = 'الربيع';
      case Season.Winter:
        seasonText = 'الشتاء';
      case Season.Autumn:
        seasonText = 'الخريف';
      case Season.SummerAndWinter:
        seasonText = 'كل الفصول';
    }
    return seasonText;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print('width inside the Trip Widget is $width, and height is $height');
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        elevation: 7,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    trip.imageUrl,
                    fit: BoxFit.cover,
                    height: height / 5,
                    width: width - 9,
                    loadingBuilder: (context, child, loadingProgress) {
                      // Check if the image is still loading
                      if (loadingProgress == null) {
                        print('loading progress ended');
                        return child;
                      } else {
                        print('loading progress');
                        // Image is loading, show thumbnail or placeholder
                        return Image.asset(
                          'assets/images/image_thumbnail.png',
                          width: width - 9,
                          height: height / 5,
                          fit: BoxFit.cover,
                        );
                      }
                    },
                    errorBuilder: (context, child, loadingProgress) {
                      return Image.asset(
                        'assets/images/image_thumbnail.png',
                        width: width - 9,
                        height: height / 5,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                Container(
                  height: height / 5,
                  width: width - 9,
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.7)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.6, 1],
                    ),
                  ),
                  child: Text(
                    trip.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width / 19,
                      fontFamily: 'ElMessiri',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: Colors.amber,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text('${trip.duration} أيام'),
                  ],
                ),
                Row(
                  children: [
                    trip.season == Season.Summer
                        ? const Icon(
                            Icons.sunny,
                            color: Colors.amber,
                          )
                        : trip.season == Season.Winter
                            ? const Icon(
                                Icons.cloud,
                                color: Colors.amber,
                              )
                            : const Icon(
                                Icons.sunny_snowing,
                                color: Colors.amber,
                              ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text('${getSeason(trip.season)} '),
                  ],
                ),
                Row(
                  children: [
                    trip.isForFamilies == true
                        ? const Icon(
                            Icons.family_restroom,
                            color: Colors.amber,
                          )
                        : const Icon(
                            Icons.man_2,
                            color: Colors.amber,
                          ),
                    const SizedBox(
                      width: 2,
                    ),
                    trip.isForFamilies == true
                        ? const Text('عائلي')
                        : const Text('فردي'),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
