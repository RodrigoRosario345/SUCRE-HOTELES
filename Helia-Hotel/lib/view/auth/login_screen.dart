// ignore_for_file: deprecated_member_use
// PAGINA INICIO DE SESION
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/controller/auth_controller.dart';
import 'package:hotel/view/auth/forgot_password_screen.dart';
import 'package:hotel/view/auth/signup_screen.dart';
import 'package:hotel/widget/custom_container.dart';
import 'package:hotel/widget/custom_textfield.dart';
import '../../service/http_Service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authController = Get.put(AuthController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late String username;
  late String password;

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
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Inicia sesión\ncon tu cuenta",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: "Nombre de usuario",
                  textFieldController: usernameController,
                  prefix: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 165, 154, 154),
                      size: 22,
                    ),
                  ),
                  sufix: const SizedBox(),
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                  suffix: const InkWell(),
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: "Contraseña",
                  textFieldController: passwordController,
                  prefix: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset(
                      DefaultImages.lock,
                    ),
                  ),
                  sufix: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset(
                      DefaultImages.eye,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  suffix: const InkWell(),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          AuthController().isRemember.value =
                              !Get.find<AuthController>().isRemember.value;
                        });
                      },
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: Get.find<AuthController>().isRemember.value ==
                                  true
                              ? HexColor(AppTheme.primaryColorString!)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 2,
                            color: HexColor(AppTheme.primaryColorString!),
                          ),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Theme.of(context).appBarTheme.backgroundColor,
                          size: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Text(
                      "Recuérdame",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomlabelLarge(
                  text: "Iniciar sesión",
                  onTap: () async {
                    String username = usernameController.text;
                    String password = passwordController.text;
                    await HttpService.login(username, password, context);
                  },
                ),
                const SizedBox(height: 25),
                InkWell(
                  onTap: () {
                    Get.to(
                      const ForgotPasswordScreen(),
                      transition: Transition.rightToLeft,
                    );
                  },
                  child: Center(
                    child: Text(
                      "Olvidaste la contraseña?",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16,
                            color: HexColor(AppTheme.primaryColorString!),
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
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
                      "o continua con",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    sociallabelLarge(DefaultImages.s1),
                    const SizedBox(width: 20),
                    sociallabelLarge(DefaultImages.s2),
                    const SizedBox(width: 20),
                    sociallabelLarge(DefaultImages.s3),
                  ],
                ),
                const SizedBox(height: 20),
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
                        "No tienes una cuenta?  ",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14,
                              color: const Color(0xff9E9E9E),
                            ),
                      ),
                      Text(
                        "Registrarse",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
        ],
      ),
    );
  }

  Widget sociallabelLarge(String image) {
    return Container(
      height: 60,
      width: 88,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xffEEEEEE),
        ),
      ),
      child: Center(
        child: image == DefaultImages.s3 && AppTheme.isLightTheme == false
            ? SizedBox(
                height: 24,
                width: 24,
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                  color: Colors.white,
                ),
              )
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
      ),
    );
  }
}
