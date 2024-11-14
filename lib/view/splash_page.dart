import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourist_application/controller/splash_controller.dart';
import 'package:tourist_application/view/home_page.dart';

class SplashPage extends StatelessWidget {
  static const id = '/SplashPage';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(HomePage.id);
    });

    return Scaffold(
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) => Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(
                seconds: 2,
              ), // Adjust duration as needed
              curve: Curves.easeInOut, // You can customize the animation curve
              left: controller.isCentered
                  ? (width / 2) - 50 // Center horizontally
                  : 0, // Initial bottom-left position
              top: controller.isCentered
                  ? (height / 2) - 50// Center vertically
                  : height - 190, // Start near the bottom
              child: SizedBox(
                child: Image.asset(
                  'assets/images/plane.png',
                  width: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
