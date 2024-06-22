// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/controller/profile_controller.dart';
import 'package:hotel/main.dart';
import 'package:hotel/view/onboarding/welcome_screen.dart';
import 'package:hotel/view/profile/edit_profile_scren.dart';
import 'package:hotel/view/profile/notification_screen.dart';
import 'package:hotel/view/profile/security_screen.dart';
import 'package:hotel/widget/custom_container.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final profileController = Get.put(ProfileController());
  int light = 1;
  int dark = 2;
  changeColor(int color) {
    if (color == light) {
      MyApp.setCustomeTheme(context, 6);
    } else {
      MyApp.setCustomeTheme(context, 7);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 20),
          Row(
            children: [
              Container(
                height: 52,
                width: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 255, 255, 255),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    DefaultImages.splashIcon,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                "Perfil",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const Expanded(child: SizedBox()),
              SizedBox(
                height: 28,
                width: 28,
                child: SvgPicture.asset(
                  DefaultImages.more,
                  fit: BoxFit.fill,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(DefaultImages.user),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Rodrigo Rosario",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "rodrigorosario@gmail.com",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                          ),
                    ),
                    const Divider(color: Color(0xffEEEEEE)),
                    const SizedBox(height: 20),
                    rowData(
                      DefaultImages.profile,
                      "Editar Perfil",
                      () {
                        Get.to(
                          const EditProfileScreen(),
                          transition: Transition.rightToLeft,
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    rowData(
                      DefaultImages.wallet,
                      "Pago",
                      () {},
                    ),
                    const SizedBox(height: 30),
                    rowData(
                      DefaultImages.notification,
                      "Notificaciones",
                      () {
                        Get.to(
                          const NotificationScreen(),
                          transition: Transition.rightToLeft,
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    rowData(
                      DefaultImages.shieldDone,
                      "Seguridad",
                      () {
                        Get.to(
                          const SecurityScreen(),
                          transition: Transition.rightToLeft,
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    rowData(
                      DefaultImages.infoSquare,
                      "Ayuda",
                      () {},
                    ),
                    const SizedBox(height: 30),
                    rowData(
                      DefaultImages.show,
                      "tema oscuro",
                      () {},
                    ),
                    const SizedBox(height: 30),
                    rowData(
                      DefaultImages.logout,
                      "cerrar sesión",
                      () {
                        Get.bottomSheet(
                          Container(
                            height: 300,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: AppTheme.isLightTheme == true
                                  ? Theme.of(context)
                                      .appBarTheme
                                      .backgroundColor
                                  : const Color(0xff1F222A),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  Text(
                                    "cerrar sesión",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontSize: 24,
                                          color: const Color(0xffF75555),
                                        ),
                                  ),
                                  const SizedBox(height: 15),
                                  const Divider(
                                      color:
                                          Color.fromARGB(255, 147, 137, 137)),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Estás seguro/a de que deseas cerrar sesión",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontSize: 20,
                                        ),
                                  ),
                                  const SizedBox(height: 30),
                                  CustomlabelLarge(
                                    text: "Sí, cerrar sesión",
                                    onTap: () {
                                      Get.offAll(
                                        const WelcomeScreen(),
                                        transition: Transition.rightToLeft,
                                      );
                                      // Get.offAll(
                                      //   const LoginScreen(),
                                      //   transition: Transition.rightToLeft,
                                      // );
                                    },
                                  ),
                                  const SizedBox(height: 15),
                                  CustomlabelLarge(
                                    text: "Cancelar",
                                    bgColor: AppTheme.isLightTheme == true
                                        ? HexColor(AppTheme.primaryColorString!)
                                            .withOpacity(0.1)
                                        : Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .color!
                                            .withOpacity(0.1),
                                    textColor: AppTheme.isLightTheme == true
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : Colors.white,
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 100),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget rowData(String image, String text, VoidCallback onTap) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Row(
        children: [
          SizedBox(
            height: 28,
            width: 28,
            child: SvgPicture.asset(
              image,
              color: text == "cerrar sesión"
                  ? const Color(0xffF75555)
                  : Theme.of(context).textTheme.bodyLarge!.color,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18,
                  color: text == "cerrar sesión"
                      ? const Color(0xffF75555)
                      : Theme.of(context).textTheme.bodyLarge!.color,
                ),
          ),
          const Expanded(child: SizedBox()),
          text == "tema oscuro"
              ? SizedBox(
                  height: 5,
                  child: CupertinoSwitch(
                    onChanged: (bool value) {
                      setState(() {
                        profileController.isDark.value = value;

                        if (value == true) {
                          changeColor(dark);
                        } else {
                          changeColor(light);
                        }
                      });
                    },
                    value: profileController.isDark.value,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
