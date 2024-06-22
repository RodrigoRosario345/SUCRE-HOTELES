// ignore_for_file: deprecated_member_use
//PAGINA REGISTRO DE USUARIO
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/controller/auth_controller.dart';
import 'package:hotel/view/auth/fill_profile_screen.dart';
import 'package:hotel/view/auth/login_screen.dart';
import 'package:hotel/widget/custom_container.dart';
import 'package:hotel/widget/custom_textfield.dart';
import 'package:hotel/service/http_Service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final authController = Get.put(AuthController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
                  "Crear una cuenta nueva",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: "Nombre usuario",
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
                  onChanged: (value) {},
                  suffix: const InkWell(),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: "Correo electrónico",
                  textFieldController: emailController,
                  prefix: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset(
                      DefaultImages.email,
                    ),
                  ),
                  sufix: const SizedBox(),
                  onChanged: (value) {},
                  suffix: const InkWell(),
                ),
                const SizedBox(height: 10),
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
                  onChanged: (value) {},
                  suffix: const InkWell(),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: "Confirmar contraseña",
                  textFieldController: confirmPasswordController,
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
                  onChanged: (value) {},
                  suffix: const InkWell(),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          authController.isRemember.value =
                              !authController.isRemember.value;
                        });
                      },
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: authController.isRemember.value == true
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
                  text: "Crear cuenta",
                  onTap: () async {
                    String username = usernameController.text;
                    String email = emailController.text;
                    String password = passwordController.text;
                    String confirmPassword = confirmPasswordController.text;

                    if (password == confirmPassword) {
                      await HttpService.register(
                          username, email, password, context);
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Error"),
                            content:
                                const Text("Las contraseñas no coinciden."),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Aceptar"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
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
                      const LoginScreen(),
                      transition: Transition.rightToLeft,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ya tienes una cuenta?  ",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14,
                              color: const Color(0xff9E9E9E),
                            ),
                      ),
                      Text(
                        "Iniciar sesión",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14,
                              color: HexColor(AppTheme.primaryColorString!),
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
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
    ),
  );
}
