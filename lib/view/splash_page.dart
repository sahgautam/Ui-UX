import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourist_application/controller/animation_controller.dart';
import 'package:tourist_application/view/home_page.dart';

class SplashPage extends StatelessWidget {
  static const id = '/SplashPage';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    AnimationsController animationsController = Get.put(AnimationsController());
    animationsController.animateSplash();
    
    
    
    // go to homepage
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(HomePage.id);
    });
    
    return Scaffold(
      body: GetBuilder<AnimationsController>(
        init: animationsController,
        builder: (controller) => Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(
                seconds: 2,
              ), // Adjust duration as needed
              curve: Curves.easeInOut, // You can customize the animation curve
              left: controller.isSplashCentered
                  ? (width / 2) - 50 // Center horizontally
                  : 0, // Initial bottom-left position
              top: controller.isSplashCentered
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
