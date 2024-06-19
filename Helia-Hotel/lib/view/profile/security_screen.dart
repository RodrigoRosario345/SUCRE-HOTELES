// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/controller/profile_controller.dart';
import 'package:hotel/view/profile/notification_screen.dart';
import 'package:hotel/widget/custom_container.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  final profileController = Get.put(ProfileController());
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
          "Seguridad",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 24,
              ),
        ),
      ),
      body: ListView(
        children: [
          GetX<ProfileController>(
            init: profileController,
            builder: (profileController) => Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  rowData(
                    "Face ID",
                    SizedBox(
                      height: 5,
                      child: CupertinoSwitch(
                        onChanged: (bool value) {
                          profileController.isFace.value = value;
                        },
                        value: profileController.isFace.value,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  rowData(
                    "Acuérdate de mí",
                    SizedBox(
                      height: 5,
                      child: CupertinoSwitch(
                        onChanged: (bool value) {
                          profileController.isRemember.value = value;
                        },
                        value: profileController.isRemember.value,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  rowData(
                    "Touch ID",
                    SizedBox(
                      height: 5,
                      child: CupertinoSwitch(
                        onChanged: (bool value) {
                          profileController.isTouch.value = value;
                        },
                        value: profileController.isTouch.value,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  rowData(
                    "Google Autenticador",
                    Icon(
                      Icons.arrow_forward_ios,
                      color: HexColor(AppTheme.primaryColorString!),
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CustomButton(
              text: "Cambiar la contraseña",
              bgColor: AppTheme.isLightTheme == true
                  ? HexColor(AppTheme.primaryColorString!).withOpacity(0.1)
                  : Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.1),
              textColor: AppTheme.isLightTheme == true
                  ? HexColor(AppTheme.primaryColorString!)
                  : Colors.white,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
