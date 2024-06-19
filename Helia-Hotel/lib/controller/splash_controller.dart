import 'dart:async';

import 'package:get/get.dart';
import 'package:hotel/view/onboarding/onboarding_screen.dart';
import 'package:hotel/view/onboarding/welcome_screen.dart';

class SplashController extends GetxController {
  RxInt flag = 0.obs;
  customInit() {
    Timer(const Duration(seconds: 5), () {
      Get.off(
        const WelcomeScreen(),
        transition: Transition.rightToLeft,
      );
    });
  }

  welcomeInit() {
    Timer(const Duration(seconds: 5), () {
      Get.off(
        const OnBoardingScreen(),
        transition: Transition.rightToLeft,
      );
    });
  }
}
