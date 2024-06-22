// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/widget/custom_container.dart';
import 'package:hotel/widget/custom_textfield.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
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
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
        title: Text(
          "Nueva tarjeta",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        height: 240,
                        width: Get.width,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              DefaultImages.cardAdd,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomField(
                        hintText: "name",
                        textFieldController:
                            TextEditingController(text: "Rodrigo Rosario"),
                        sufix: const SizedBox(),
                      ),
                      const SizedBox(height: 20),
                      CustomField(
                        hintText: "name",
                        textFieldController:
                            TextEditingController(text: "6373 2728 4797 4679"),
                        sufix: const SizedBox(),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: CustomField(
                              hintText: "name",
                              textFieldController:
                                  TextEditingController(text: "22/28"),
                              sufix: const SizedBox(),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: CustomField(
                              hintText: "name",
                              textFieldController:
                                  TextEditingController(text: "432"),
                              sufix: const SizedBox(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomlabelLarge(
              text: "Agregar tarjeta",
              onTap: () {},
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
