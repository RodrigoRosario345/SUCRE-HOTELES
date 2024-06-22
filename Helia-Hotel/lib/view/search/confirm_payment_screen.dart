// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/view/search/ticket_screen.dart';
import 'package:hotel/widget/card_view.dart';
import 'package:hotel/widget/custom_container.dart';

class ConfirmPaymentScreen extends StatefulWidget {
  const ConfirmPaymentScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmPaymentScreen> createState() => _ConfirmPaymentScreenState();
}

class _ConfirmPaymentScreenState extends State<ConfirmPaymentScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CardView(),
                      const SizedBox(height: 20),
                      Container(
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
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Fecha inicio",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 16,
                                              ),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "Fecha final",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 16,
                                              ),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "Invitados",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 16,
                                              ),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Junio 29, 2023",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 16),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "Junio 30, 2023",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 16),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "3",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 16),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
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
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "5 Noches",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 16,
                                              ),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "impuestos y pagos (10%)",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 16,
                                              ),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "Total",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 16,
                                              ),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "\$435.00",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 16),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "\$44.50",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 16),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "\$479.50",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 16),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
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
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      DefaultImages.card,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Text(
                                "•••• •••• •••• •••• 4679",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 18,
                                    ),
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                "Cambiar",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 16,
                                      color: HexColor(
                                          AppTheme.primaryColorString!),
                                    ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ],
              ),
            ),
            CustomlabelLarge(
              text: "Confirmar pago",
              onTap: () {
                Get.dialog(
                  AlertDialog(
                    backgroundColor: AppTheme.isLightTheme == true
                        ? Colors.white
                        : const Color(0xff1F222A),
                    contentPadding: EdgeInsets.zero,
                    titlePadding: EdgeInsets.zero,
                    actionsPadding: EdgeInsets.zero,
                    insetPadding: const EdgeInsets.only(left: 30, right: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    content: Container(
                      height: 465,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: AppTheme.isLightTheme == true
                            ? Colors.white
                            : const Color(0xff1F222A),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 180,
                            width: 185,
                            child: Image.asset(
                              DefaultImages.p3,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Pago Exitoso!",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: HexColor(AppTheme.primaryColorString!),
                                ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Pago realizado con éxito en\nhoteles Sucre",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 14,
                                      height: 1.6,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          CustomlabelLarge(
                            text: "Ver boleto",
                            onTap: () {
                              Get.to(
                                const TicketScreen(),
                                transition: Transition.rightToLeft,
                              );
                            },
                          ),
                          const SizedBox(height: 12),
                          CustomlabelLarge(
                            text: "Cancelar",
                            onTap: () {
                              Navigator.pop(context);
                            },
                            bgColor: AppTheme.isLightTheme == true
                                ? HexColor(AppTheme.primaryColorString!)
                                    .withOpacity(0.1)
                                : Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color!
                                    .withOpacity(0.1),
                            textColor: AppTheme.isLightTheme == true
                                ? HexColor(AppTheme.primaryColorString!)
                                : Colors.white,
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
