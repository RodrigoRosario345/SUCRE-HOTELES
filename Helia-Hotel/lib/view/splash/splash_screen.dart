import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hotel/config/images.dart';
import 'package:hotel/controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashController = Get.put(SplashController());
  @override
  void initState() {
    splashController.customInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 230, 227, 227),
              Color.fromARGB(255, 230, 227, 227),
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 320,
                  width: 206,
                  child: Image.asset(
                    DefaultImages.splashIcon,
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: CupertinoActivityIndicator(
                color: Color.fromARGB(255, 63, 61, 61),
                radius: 20,
                animating: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
