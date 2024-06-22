// ignore_for_file: deprecated_member_use
//PAGINA RESTABLECER CONTRASEÑA
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/controller/auth_controller.dart';
import 'package:hotel/view/auth/otp_screen.dart';
import 'package:hotel/widget/custom_container.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.bodyLarge!.color,
            size: 25,
          ),
        ),
        title: Text(
          "Olvidé mi contraseña",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 24,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Center(
                        child: Container(
                          height: 240,
                          width: 240,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                DefaultImages.passwordLock,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Selecciona qué detalles de contacto debemos usar para restablecer \ntu contraseña",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 16,
                            ),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => card(
                          DefaultImages.chat,
                          "via SMS:",
                          "+1 111 ******99",
                          () {
                            authController.isPassword.value = false;
                          },
                          authController.isPassword.value == false
                              ? HexColor(AppTheme.primaryColorString!)
                              : const Color(0xffEEEEEE),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => card(
                          DefaultImages.passwordEmail,
                          "via Correo Electronico:",
                          "rodrigo***ruz@gmail.com",
                          () {
                            authController.isPassword.value = true;
                          },
                          authController.isPassword.value == true
                              ? HexColor(AppTheme.primaryColorString!)
                              : const Color(0xffEEEEEE),
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ],
              ),
            ),
            CustomlabelLarge(
              text: "Continuar",
              onTap: () {
                Get.off(
                  const OTPScreen(),
                  transition: Transition.rightToLeft,
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget card(String image, String text1, String text2, VoidCallback onTap,
      Color color) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 128,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: color,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.isLightTheme == true
                      ? const Color(0xffE8F8EF)
                      : const Color(0xff1F222A),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SvgPicture.asset(
                    image,
                    color: HexColor(AppTheme.primaryColorString!),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text1,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    text2,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
