// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/widget/custom_container.dart';

class CancelBookingScreen extends StatefulWidget {
  const CancelBookingScreen({Key? key}) : super(key: key);

  @override
  State<CancelBookingScreen> createState() => _CancelBookingScreenState();
}

class _CancelBookingScreenState extends State<CancelBookingScreen> {
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
          "Cancelar reserva de hotel",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 22,
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
                      Text(
                        "Seleccione un método de reembolso de pago (solo\nse reembolsará el 80 %).",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 18,
                              height: 1.6,
                            ),
                      ),
                      const SizedBox(height: 20),
                      card(
                        DefaultImages.paypal,
                        "Paypal",
                        Colors.transparent,
                      ),
                      const SizedBox(height: 30),
                      card(
                        DefaultImages.s2,
                        "Google Pay",
                        Colors.transparent,
                      ),
                      const SizedBox(height: 30),
                      card(
                        DefaultImages.s3,
                        "Apple Pay",
                        Colors.transparent,
                      ),
                      const SizedBox(height: 30),
                      card(
                        DefaultImages.card,
                        "•••• •••• •••• •••• 4679",
                        HexColor(AppTheme.primaryColorString!),
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Pagado: \ 479.5BOL   ",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 18,
                        color: const Color(0xff424242),
                      ),
                ),
                Text(
                  "Reembolso: \ 383.8BOL",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 18,
                        color: const Color(0xff424242),
                      ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Confirmar cancelación",
              onTap: () {
                Get.dialog(
                  AlertDialog(
                    buttonPadding: EdgeInsets.zero,
                    titlePadding: EdgeInsets.zero,
                    actionsPadding: EdgeInsets.zero,
                    insetPadding: const EdgeInsets.only(left: 30, right: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    backgroundColor: AppTheme.isLightTheme == true
                        ? Colors.white
                        : const Color(0xff1F222A),
                    content: Container(
                      height: 400,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Theme.of(context).appBarTheme.backgroundColor,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 180,
                            width: 185,
                            child: Image.asset(
                              DefaultImages.p3,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Exitoso!",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: HexColor(AppTheme.primaryColorString!),
                                ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Has cancelado con éxito tu\npedido. 80% de los fondos serán devueltos a\nsu cuenta",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 16,
                                      height: 1.6,
                                      color: const Color(0xff09101D),
                                    ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 30),
                          CustomButton(
                            text: "OK",
                            onTap: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
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

Widget card(String image, String text, Color color) {
  return Container(
    height: 80,
    width: Get.width,
    decoration: BoxDecoration(
      color: AppTheme.isLightTheme == true
          ? Colors.white
          : const Color(0xff1F222A),
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: const Color(0xff04060F).withOpacity(0.05),
          blurRadius: 8,
        )
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Text(
            text,
            style: Theme.of(Get.context!).textTheme.bodyText1!.copyWith(
                  fontSize: 18,
                ),
          ),
          const Expanded(child: SizedBox()),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: HexColor(AppTheme.primaryColorString!),
                width: 2.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                backgroundColor: color,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
