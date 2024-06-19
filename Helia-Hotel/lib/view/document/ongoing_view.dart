// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/view/document/cancel_booking_screen.dart';
import 'package:hotel/widget/custom_container.dart';

class OnGoingView extends StatefulWidget {
  const OnGoingView({Key? key}) : super(key: key);

  @override
  State<OnGoingView> createState() => _OnGoingViewState();
}

class _OnGoingViewState extends State<OnGoingView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        padding: const EdgeInsets.only(bottom: 60),
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.isLightTheme == true
                    ? Theme.of(context).appBarTheme.backgroundColor
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
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                index == 0
                                    ? DefaultImages.d1
                                    : index == 1
                                        ? DefaultImages.d2
                                        : DefaultImages.d3,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              index == 0
                                  ? "San Marino Royal Hotel"
                                  : index == 1
                                      ? "Capital Plaza Hotel"
                                      : "Hotel Monasterio",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              index == 0
                                  ? "Sucre, Bolivia"
                                  : index == 1
                                      ? "Sucre, Bolivia"
                                      : "Sucre, Bolivia",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 14,
                                    color: const Color(0xff616161),
                                  ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 24,
                              width: 60,
                              decoration: BoxDecoration(
                                color:
                                    HexColor(AppTheme.complementaryColorString!)
                                        .withOpacity(0.12),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  "Pagado",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 10,
                                        color: HexColor(
                                            AppTheme.complementaryColorString!),
                                      ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Divider(color: Color(0xffEEEEEE)),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.bottomSheet(
                                Container(
                                  height: 300,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: AppTheme.isLightTheme == true
                                        ? Theme.of(context)
                                            .appBarTheme
                                            .backgroundColor
                                        : const Color(0xff1F222A),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 20),
                                        Text(
                                          "Cancelar reserva",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                fontSize: 24,
                                                color: const Color(0xffF75555),
                                              ),
                                        ),
                                        const SizedBox(height: 10),
                                        const Divider(color: Color(0xffEEEEEE)),
                                        const SizedBox(height: 10),
                                        Text(
                                          "Estás seguro/a de que quieres cancelar tu reserva de hotel?",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                fontSize: 16,
                                                height: 1.6,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "Solo se puede reembolsar el 80% del dinero de tu pago según nuestra política",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                fontSize: 14,
                                                height: 1.6,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 30),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CustomButton(
                                                text: "Cancelar",
                                                bgColor: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .color!
                                                    .withOpacity(0.1),
                                                textColor: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .color,
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 15),
                                            Expanded(
                                              child: CustomButton(
                                                text: "Si, Continuar",
                                                onTap: () {
                                                  Get.to(
                                                    const CancelBookingScreen(),
                                                    transition:
                                                        Transition.rightToLeft,
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 38,
                              width: Get.width,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        HexColor(AppTheme.primaryColorString!)),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: Text(
                                  "Cancelar reserva",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: HexColor(
                                            AppTheme.primaryColorString!),
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 38,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: HexColor(AppTheme.primaryColorString!),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: Text(
                                  "Ver boleto",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
