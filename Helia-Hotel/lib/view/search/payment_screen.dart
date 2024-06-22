// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/view/document/cancel_booking_screen.dart';
import 'package:hotel/view/search/add_new_card_screen.dart';
import 'package:hotel/view/search/confirm_payment_screen.dart';
import 'package:hotel/widget/custom_container.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
          "Payment",
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
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          Get.to(
                            const AddNewCardScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Métodos de pago",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontSize: 16),
                            ),
                            Text(
                              "Agregar nueva tarjeta",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 14,
                                    color:
                                        HexColor(AppTheme.primaryColorString!),
                                  ),
                            ),
                          ],
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
                    ],
                  ),
                ],
              ),
            ),
            CustomlabelLarge(
              text: "Continuar",
              onTap: () {
                Get.to(
                  const ConfirmPaymentScreen(),
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
