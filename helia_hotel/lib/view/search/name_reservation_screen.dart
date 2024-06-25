// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/view/search/payment_screen.dart';
import 'package:hotel/view/search/search_view.dart';
import 'package:hotel/widget/custom_container.dart';
import 'package:hotel/widget/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hotel/controller/auth_controller.dart';
import 'package:intl/intl.dart';
import 'package:hotel/model/data_habitacion.dart';


class NameReservationScreen extends StatefulWidget {
  const NameReservationScreen({super.key});

  @override
  State<NameReservationScreen> createState() => _NameReservationScreenState();
}

class _NameReservationScreenState extends State<NameReservationScreen> {
  
  final AuthController authController = Get.find<AuthController>();
  String? nombre;
  String? apellidos;
  String? email;
  String? cel;
  String fechaReserva = DateFormat('MM/dd/yyyy').format(DateTime.now());

  @override
  
  void initState() {
    super.initState();
    _initializeUserData();
  }

  _initializeUserData() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      final userInfo = await authController.getUserInfo(userId);
      if (userInfo != null) {
        setState(() {
          nombre = userInfo['nombre'];
          apellidos = userInfo['apellidos'];
          email = userInfo['email'];
          cel = userInfo['celular'];
        });
      }
    }
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
        title: Text(
          "Nombre de la Reserva",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      
                      CustomField(
                        hintText: "nombre",
                        textFieldController:
                            TextEditingController(text: '${nombre ?? 'Cargando...'}'),
                        sufix: const SizedBox(),
                      ),
                      const SizedBox(height: 20),
                      CustomField(
                        hintText: "apellido",
                        textFieldController:
                            TextEditingController(text: '${apellidos ?? 'Cargando...'}'),
                        sufix: const SizedBox(),
                      ),
                      const SizedBox(height: 20),
                      CustomField(
                        hintText: "fecha de reserva",
                        textFieldController:
                            TextEditingController(text: fechaReserva),
                        sufix: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                            DefaultImages.calendar,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomField(
                        hintText: "correo electrónico",
                        textFieldController: TextEditingController(
                            text: "${email ?? 'Cargando...'}"),
                        sufix: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                            DefaultImages.calendar,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        hintText: "numero",
                        textFieldController:
                            TextEditingController(text: '${cel ?? 'Cargando...'}'),
                        sufix: const SizedBox(),
                        prefix: const Padding(
                          padding: EdgeInsets.all(14.0),
                          // child: SvgPicture.asset(
                          //   DefaultImages.p2,
                          // ),
                        ),
                        onChanged: (value) {},
                        suffix: const InkWell(),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
            CustomlabelLarge(
              text: "Continuar",
              onTap: () {
                Get.to(
                  const PaymentScreen(),
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
}
