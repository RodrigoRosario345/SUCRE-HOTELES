// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/controller/splash_controller.dart';
import 'package:hotel/view/onboarding/option_screen.dart';
import 'package:hotel/widget/custom_container.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final splashController = Get.put(SplashController());

  @override
  void initState() {
    splashController.flag.value = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 320),
                      GetX<SplashController>(
                        init: splashController,
                        builder: (splashController) => Text(
                          splashController.flag.value == 0
                              ? "\n\nDisfruta los mejores\nhoteles con nosotros"
                              : splashController.flag.value == 1
                                  ? "\n\nDescubre los lugares \ntesoros de Sucre"
                                  : "\n\nDescubramos\na Sucre juntos",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 33,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      GetX<SplashController>(
                        init: splashController,
                        builder: (splashController) => Text(
                          splashController.flag.value == 0
                              ? "Descubre su arquitectura colonial, sus calles empedradas y su rica historia. Visita la Casa de la Libertad, donde se firmó la independencia de Bolivia, o admira la belleza de la Catedral Metropolitana."
                              : splashController.flag.value == 1
                                  ? "Sumérgete en la cultura local explorando centros y lugares turisticos que hacen de Sucre la ciudad que es Ciudad Blanca de America."
                                  : "Podrás disfrutar de hermosos paisajes naturales como el Parque Cretácico o el Parque Bolívar. ¡Sucre te espera con los brazos abiertos para que vivas una experiencia inolvidable!",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontSize: 15,
                                height: 1.4,
                              ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: CustomButton(
                          text: "Siguiente",
                          onTap: () {
                            splashController.flag.value =
                                splashController.flag.value + 1;
                            if (splashController.flag.value == 3) {
                              Get.off(
                                const OptionScreen(),
                                transition: Transition.rightToLeft,
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: CustomButton(
                          text: "Saltar",
                          bgColor: AppTheme.isLightTheme == true
                              ? HexColor(AppTheme.primaryColorString!)
                                  .withOpacity(0.1)
                              : Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color!
                                  .withOpacity(0.1),
                          textColor: AppTheme.isLightTheme == true
                              ? HexColor(AppTheme.primaryColorString!)
                              : Colors.white,
                          onTap: () {
                            Get.off(
                              const OptionScreen(),
                              transition: Transition.rightToLeft,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          GetX<SplashController>(
            init: splashController,
            builder: (splashController) => SizedBox(
              width: Get.width,
              height: Get.height / 1.7,
              child: Image.asset(
                splashController.flag.value == 0
                    ? DefaultImages.o1
                    : splashController.flag.value == 1
                        ? DefaultImages.o2
                        : DefaultImages.o3,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
