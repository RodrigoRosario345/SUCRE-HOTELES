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

class NameReservationScreen extends StatefulWidget {
  const NameReservationScreen({Key? key}) : super(key: key);

  @override
  State<NameReservationScreen> createState() => _NameReservationScreenState();
}

class _NameReservationScreenState extends State<NameReservationScreen> {
  @override
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
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
        title: Text(
          "Nombre de la Reserva",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
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
                      Row(
                        children: [
                          Expanded(
                            child: searchCard(
                              "Mr.",
                              HexColor(AppTheme.primaryColorString!),
                              () {},
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: searchCard(
                              "Mrs.",
                              Colors.transparent,
                              () {},
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: searchCard(
                              "Ms.",
                              Colors.transparent,
                              () {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      CustomField(
                        hintText: "nombre",
                        textFieldController:
                            TextEditingController(text: "Rodrigo"),
                        sufix: const SizedBox(),
                      ),
                      const SizedBox(height: 20),
                      CustomField(
                        hintText: "apellido",
                        textFieldController:
                            TextEditingController(text: "Rosario"),
                        sufix: const SizedBox(),
                      ),
                      const SizedBox(height: 20),
                      CustomField(
                        hintText: "fecha de reserva",
                        textFieldController:
                            TextEditingController(text: "12/27/1995"),
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
                            text: "rodrigorosario@gmail.com"),
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
                            TextEditingController(text: "+591 77382944"),
                        sufix: const SizedBox(),
                        prefix: Padding(
                          padding: const EdgeInsets.all(14.0),
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
            CustomButton(
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
