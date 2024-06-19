// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/view/tab_screen.dart';
import 'package:hotel/widget/custom_container.dart';
import 'package:hotel/widget/custom_textfield.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
          "Edit Profile",
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
                      CustomField(
                        hintText: "nombre",
                        textFieldController:
                            TextEditingController(text: "Rodrigo Rosario"),
                        sufix: const SizedBox(),
                      ),
                      const SizedBox(height: 15),
                      CustomField(
                        hintText: "apellido",
                        textFieldController:
                            TextEditingController(text: "Rosario"),
                        sufix: const SizedBox(),
                      ),
                      const SizedBox(height: 15),
                      CustomField(
                        hintText: "fecha de nacimiento",
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
                            DefaultImages.p4,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        hintText: "número de teléfono",
                        textFieldController:
                            TextEditingController(text: "+591 111 467 378 399"),
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
                      CustomField(
                        hintText: "name",
                        textFieldController:
                            TextEditingController(text: "Male"),
                        sufix: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                            DefaultImages.arrow,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  )
                ],
              ),
            ),
            CustomButton(
              text: "Update",
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
