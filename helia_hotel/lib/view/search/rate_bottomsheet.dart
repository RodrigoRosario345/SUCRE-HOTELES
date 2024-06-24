// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/widget/card_view.dart';
import 'package:hotel/widget/custom_container.dart';

class RateBottomSheet extends StatelessWidget {
  const RateBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 100,
      width: Get.width,
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "Valora el Hotel",
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Divider(color: Color(0xffEEEEEE)),
            const SizedBox(height: 20),
            const CardView(),
            const SizedBox(height: 30),
            Text(
              "Por favor dé su calificación y revisión",
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 32,
                  width: 32,
                  child: SvgPicture.asset(DefaultImages.star),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  height: 32,
                  width: 32,
                  child: SvgPicture.asset(DefaultImages.star),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  height: 32,
                  width: 32,
                  child: SvgPicture.asset(DefaultImages.star),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  height: 32,
                  width: 32,
                  child: SvgPicture.asset(DefaultImages.star),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  height: 32,
                  width: 32,
                  child: SvgPicture.asset(DefaultImages.starBorder),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Text(
              "Las habitaciones son muy cómodas y las vistas\nnaturales son increíbles, no puedo esperar a volver otra vez!",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                  ),
            ),
            const Expanded(child: SizedBox()),
            CustomlabelLarge(
              text: "Califica ahora",
              onTap: () {},
            ),
            const SizedBox(height: 15),
            CustomlabelLarge(
              text: "Más tarde",
              bgColor: AppTheme.isLightTheme == true
                  ? HexColor(AppTheme.primaryColorString!).withOpacity(0.1)
                  : Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .color!
                      .withOpacity(0.1),
              textColor: AppTheme.isLightTheme == true
                  ? HexColor(AppTheme.primaryColorString!)
                  : Colors.white,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
