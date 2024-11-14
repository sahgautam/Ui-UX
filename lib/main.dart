import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:tourist_application/binding/home_binding.dart';
import 'package:tourist_application/controller/favorite_controller.dart';
import 'package:tourist_application/controller/filtered_controller.dart';
import 'package:tourist_application/view/favorite_page.dart';
import 'package:tourist_application/view/home_page.dart';
import 'package:tourist_application/view/category_trips_page.dart';
import 'package:tourist_application/view/filter_page.dart';
import 'package:tourist_application/view/splash_page.dart';
import 'package:tourist_application/view/trip_details_page.dart';

void main() {
  Get.put(FilteredController(), permanent: true);
  Get.put(FavoriteController(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('ar', ''), // Arabic
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('ar'),
      theme: ThemeData(
        textTheme: Get.theme.textTheme.copyWith(
          headlineMedium: TextStyle(
            color: const Color(0xff1c8aec), // 0xfff1c8aec
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width / 19,
          ),
          headlineLarge: TextStyle(
            color: Colors.white, // 0xfff1c8aec
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width / 19,
          ),
        ),
      ),
      initialRoute: SplashPage.id,
      getPages: [
        GetPage(name: HomePage.id, page: () => HomePage()),
        GetPage(name: CategoryTripsPage.id, page: () => CategoryTripsPage()),
        GetPage(name: FilterPage.id, page: () => FilterPage()),
        GetPage(name: TripDetailsPage.id, page: () => TripDetailsPage()),
        GetPage(name: FavoritePage.id, page: () => FavoritePage()),
        GetPage(name: SplashPage.id, page: () => SplashPage())
      ],
    );
  }
}
