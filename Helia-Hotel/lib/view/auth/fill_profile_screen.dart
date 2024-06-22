// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/view/tab_screen.dart';
import 'package:hotel/widget/custom_container.dart';
import 'package:hotel/widget/custom_textfield.dart';

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({Key? key}) : super(key: key);

  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
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
          "Llene su perfil",
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
                      const SizedBox(height: 20),
                      Center(
                        child: Container(
                          height: 140,
                          width: 140,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                DefaultImages.user,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomField(
                        hintText: "nombre",
                        textFieldController:
                            TextEditingController(text: "Rodrigo"),
                        sufix: const SizedBox(),
                      ),
                      const SizedBox(height: 15),
                      CustomField(
                        hintText: "apellidos",
                        textFieldController:
                            TextEditingController(text: "Rosario Cruz"),
                        sufix: const SizedBox(),
                      ),
                      const SizedBox(height: 15),
                      CustomField(
                        hintText: "fecha_nacimiento",
                        textFieldController:
                            TextEditingController(text: "12/27/1995"),
                        sufix: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                            DefaultImages.calendar,
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomField(
                        hintText: "email",
                        textFieldController: TextEditingController(
                            text: "rodrigorosario@gmail.com"),
                        sufix: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                            DefaultImages.p4,
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        hintText: "numero",
                        textFieldController:
                            TextEditingController(text: "+591 78328213"),
                        sufix: const SizedBox(),
                        prefix: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                            DefaultImages.p2,
                          ),
                        ),
                        onChanged: (value) {},
                        suffix: const InkWell(),
                      ),
                      const SizedBox(height: 20),
                      CustomField(
                        hintText: "sexo",
                        textFieldController:
                            TextEditingController(text: "Masculino"),
                        sufix: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                            DefaultImages.arrow,
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  )
                ],
              ),
            ),
            CustomlabelLarge(
              text: "Continue",
              onTap: () {
                Get.offAll(
                  const TabScreen(),
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
