// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/view/auth/login_screen.dart';
import 'package:hotel/view/auth/signup_screen.dart';
import 'package:hotel/widget/custom_container.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                  size: 25,
                )
              ],
            ),
            Expanded(
              flex: 9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: SizedBox()),
                  Center(
                    child: Text(
                      "Inicia sesión con",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  socialButton(DefaultImages.s1, "Continuar con Facebook"),
                  const SizedBox(height: 10),
                  socialButton(DefaultImages.s2, "Continuar con Google"),
                  const SizedBox(height: 10),
                  socialButton(DefaultImages.s3, "Continuar con Apple"),
                  const SizedBox(height: 30),
                  // const Expanded(child: SizedBox()),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1.5,
                          color: const Color(0xffEEEEEE),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Text(
                        "o",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 18,
                              color: const Color(0xff616161),
                            ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Container(
                          height: 1.5,
                          color: const Color(0xffEEEEEE),
                        ),
                      )
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  CustomButton(
                    text: "Iniciar sesión con contraseña",
                    onTap: () {
                      Get.to(
                        const LoginScreen(),
                        transition: Transition.rightToLeft,
                      );
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(
                        const SignupScreen(),
                        transition: Transition.rightToLeft,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "¿No tienes una cuenta?  ",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 14,
                                    color: const Color(0xff9E9E9E),
                                  ),
                        ),
                        Text(
                          "registrarse", //al español: Regístrate
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                fontSize: 14,
                                color: HexColor(AppTheme.primaryColorString!),
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget socialButton(String image, String text) {
    return Container(
      height: 60,
      width: Get.width,
      decoration: BoxDecoration(
        color: AppTheme.isLightTheme == true
            ? Colors.white
            : const Color(0xff1F222A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: AppTheme.isLightTheme == true
                ? const Color(0xffEEEEEE)
                : const Color(0xff35383F)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image == DefaultImages.s3 && AppTheme.isLightTheme == false
              ? SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                    color: Colors.white,
                  ))
              : Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        image,
                      ),
                    ),
                  ),
                ),
          const SizedBox(width: 14),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 16,
                ),
          ),
        ],
      ),
    );
  }
}
