// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/widget/custom_container.dart';
import 'package:hotel/controller/date_controller.dart';
import 'package:hotel/controller/auth_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel/view/tab_screen.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}



class _TicketScreenState extends State<TicketScreen> {
  
  final DateController dateController = Get.find<DateController>(); // Encuentra el controlador existente
  final AuthController authController = Get.find<AuthController>();

  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  String? nombre;
  String? userId;
  String? apellidos;
  String? email;
  String? cel;
  String fechaReserva = DateFormat('MM/dd/yyyy').format(DateTime.now());

  String _formatDate(DateTime? date) {
    if (date == null) return "Seleccione";
    return "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";
  }
  
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
            color: Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
        title: Text(
          "Boleto",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppTheme.isLightTheme == true
                          ? const Color(0xffFAFAFA)
                          : const Color(0xff1F222A),
                      border: Border.all(
                        color: AppTheme.isLightTheme == true
                            ? const Color(0xffEEEEEE)
                            : Color(0xffEEEEEE).withOpacity(0.1),
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff04060F).withOpacity(0.05),
                          blurRadius: 8,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "${dateController.nomHotel}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontSize: 20),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Container(
                              height: 224,
                              width: 224,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    DefaultImages.qr,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              customColumn("Nombre", '${nombre ?? 'Cargando...'} ${apellidos ?? ''}'),
                              const SizedBox(width: 14),
                              customColumn("Numero celular", '${cel ?? 'Cargando...'}'),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              customColumn("Fecha de entrada", _formatDate(dateController.startDate.value)),
                              const SizedBox(width: 14),
                              customColumn("Fecha de salida", _formatDate(dateController.endDate.value)),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              customColumn("Habitacion", "${dateController.tipoHabitacion}"),
                              const SizedBox(width: 14),
                              customColumn("Precio por noche", "${dateController.precio} Bs."),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            CustomlabelLarge(
              text: "Volver al inicio",
              onTap: () {
                              Get.offAll(
                                () => const TabScreen(),
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

  Widget customColumn(String text1, String text2) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 16,
                  color: const Color(0xff757575),
                ),
          ),
          const SizedBox(height: 8),
          Text(
            text2,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
