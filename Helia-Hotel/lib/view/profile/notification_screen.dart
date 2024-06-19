// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/profile_controller.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
          "Notificacion",
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
                    "General Notificacion",
                    SizedBox(
                      height: 5,
                      child: CupertinoSwitch(
                        onChanged: (bool value) {
                          profileController.isNotify.value = value;
                        },
                        value: profileController.isNotify.value,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  rowData(
                    "Sonido",
                    SizedBox(
                      height: 5,
                      child: CupertinoSwitch(
                        onChanged: (bool value) {
                          profileController.isSound.value = value;
                        },
                        value: profileController.isSound.value,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  rowData(
                    "Vibrar",
                    SizedBox(
                      height: 5,
                      child: CupertinoSwitch(
                        onChanged: (bool value) {
                          profileController.isVibrate.value = value;
                        },
                        value: profileController.isVibrate.value,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  rowData(
                    "App Actualizaciones ",
                    SizedBox(
                      height: 5,
                      child: CupertinoSwitch(
                        onChanged: (bool value) {
                          profileController.isApp.value = value;
                        },
                        value: profileController.isApp.value,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  rowData(
                    "Nuevo servicio disponible",
                    SizedBox(
                      height: 5,
                      child: CupertinoSwitch(
                        onChanged: (bool value) {
                          profileController.isService.value = value;
                        },
                        value: profileController.isService.value,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  rowData(
                    "Nuevos consejos disponibles",
                    SizedBox(
                      height: 5,
                      child: CupertinoSwitch(
                        onChanged: (bool value) {
                          profileController.isTips.value = value;
                        },
                        value: profileController.isTips.value,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget rowData(String text, Widget widget) {
  return Row(
    children: [
      Text(
        text,
        style: Theme.of(Get.context!).textTheme.bodyText1!.copyWith(
              fontSize: 18,
            ),
      ),
      const Expanded(child: SizedBox()),
      widget,
    ],
  );
}
