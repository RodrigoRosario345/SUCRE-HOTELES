// ignore_for_file: deprecated_member_use
// //PAGINA CREAR CONTRASEÑA

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/controller/auth_controller.dart';
import 'package:hotel/view/tab_screen.dart';
import 'package:hotel/widget/custom_container.dart';
import 'package:hotel/widget/custom_textfield.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
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
            color: Theme.of(context).textTheme.bodyText1!.color,
            size: 25,
          ),
        ),
        title: Text(
          "Crear nueva contraseña",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                      const SizedBox(height: 20),
                      Center(
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                DefaultImages.p1,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Crear tu nueva contraseña",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff212121),
                            ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        hintText: "Contraseña",
                        textFieldController:
                            TextEditingController(text: "123456789"),
                        prefix: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                            DefaultImages.lock,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                        ),
                        sufix: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                            DefaultImages.eye,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                        ),
                        onChanged: (value) {},
                        suffix: const InkWell(),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        hintText: "password",
                        textFieldController:
                            TextEditingController(text: "123456789"),
                        prefix: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                            DefaultImages.lock,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                        ),
                        sufix: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                            DefaultImages.eye,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                        ),
                        onChanged: (value) {},
                        suffix: const InkWell(),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                authController.passwordRemember.value =
                                    !authController.passwordRemember.value;
                              });
                            },
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                color: authController.passwordRemember.value ==
                                        true
                                    ? HexColor(AppTheme.primaryColorString!)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  width: 2,
                                  color: HexColor(AppTheme.primaryColorString!),
                                ),
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Text(
                            "Recordarme",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ],
              ),
            ),
            CustomButton(
              text: "Continuar",
              onTap: () {
                Get.dialog(
                  AlertDialog(
                    buttonPadding: EdgeInsets.zero,
                    titlePadding: EdgeInsets.zero,
                    actionsPadding: EdgeInsets.zero,
                    insetPadding: const EdgeInsets.only(left: 30, right: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    backgroundColor: AppTheme.isLightTheme == true
                        ? Colors.white
                        : const Color(0xff1F222A),
                    content: Container(
                      height: 400,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: AppTheme.isLightTheme == true
                            ? const Color(0xffFAFAFA)
                            : const Color(0xff1F222A),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 180,
                            width: 185,
                            child: Image.asset(
                              DefaultImages.p3,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Felicidades!",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: HexColor(AppTheme.primaryColorString!),
                                ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Tu cuenta está lista para usar",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                  fontSize: 18,
                                  color: HexColor(AppTheme.primaryColorString!),
                                ),
                          ),
                          const SizedBox(height: 30),
                          CustomButton(
                            text: "Ir a la página de inicio",
                            onTap: () {
                              Get.offAll(
                                const TabScreen(),
                                transition: Transition.rightToLeft,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
