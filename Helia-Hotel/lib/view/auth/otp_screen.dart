// ignore_for_file: deprecated_member_use
//PAGINA OLVIDE MI CONTRASEÑA
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/view/auth/create_password_screen.dart';
import 'package:hotel/widget/custom_container.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Se ha enviado el código a +591 77******42",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const SizedBox(height: 50),
                Pinput(
                  defaultPinTheme: PinTheme(
                    height: 61,
                    width: 78,
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppTheme.isLightTheme == true
                          ? const Color(0xffFAFAFA)
                          : const Color(0xff1F222A),
                      border: Border.all(
                        color: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .color!
                            .withOpacity(0.1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Volver a enviar el código en ",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    Text(
                      "53 ",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: HexColor(AppTheme.primaryColorString!),
                          ),
                    ),
                    Text(
                      "segundos",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: CustomlabelLarge(
              text: "verificar",
              onTap: () {
                Get.to(
                  const CreatePasswordScreen(),
                  transition: Transition.rightToLeft,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
