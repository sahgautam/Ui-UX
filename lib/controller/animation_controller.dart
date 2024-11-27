import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  bool isSplashCentered = false;
  bool isFilteredAnimated = false;
  bool isDetailsAnimated = false;
  late Animation tripDetailsAnimation;
  late AnimationController tripDetailsAnimationController;

  @override
  onInit() {
    super.onInit();
    // declare animation and animationController
    // 1- animationController
    tripDetailsAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    // 2- animation
    Tween tween = Tween<double>(begin: 60, end: 0);
    tripDetailsAnimation = tween.animate(
      CurvedAnimation(
        parent: tripDetailsAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void animateTripDetails(){
    // begin the animation
    tripDetailsAnimationController.forward();
  }

  void animateSplash() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        isSplashCentered = true;
        update();
      });
    });
  }

  void animateFilters() {
    Future.delayed(const Duration(milliseconds: 300), () {
      isFilteredAnimated = true;
      update();
    });
  }

  void animateDetails() {
    Future.delayed(const Duration(milliseconds: 300), () {
      isDetailsAnimated = true;
      update();
    });
  }

}
