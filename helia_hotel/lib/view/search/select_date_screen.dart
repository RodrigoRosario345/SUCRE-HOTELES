// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/view/search/name_reservation_screen.dart';
import 'package:hotel/widget/custom_container.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:hotel/model/data_habitacion.dart';

class SelectDateScreen extends StatefulWidget {
  final Habitacion habitacion;
  const SelectDateScreen({super.key, required this.habitacion});

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
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
          "Seleccione fecha",
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
                physics: const ClampingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: AppTheme.isLightTheme == true
                              ? const Color(0xffFAFAFA)
                              : const Color(0xff1F222A),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: Get.width,
                        child: SfDateRangePicker(
                          onSelectionChanged: (v) {},
                          monthCellStyle: DateRangePickerMonthCellStyle(
                            textStyle:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 14,
                                    ),
                          ),
                          rangeTextStyle:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 14,
                                  ),
                          selectionTextStyle:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .backgroundColor,
                                    fontSize: 14,
                                  ),
                          headerStyle: DateRangePickerHeaderStyle(
                            textStyle:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 18,
                                    ),
                          ),
                          selectionMode: DateRangePickerSelectionMode.range,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "fecha de entrada",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontSize: 18),
                                ),
                                const SizedBox(height: 15),
                                Container(
                                  height: 56,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppTheme.isLightTheme == true
                                        ? const Color(0xffFAFAFA)
                                        : const Color(0xff1F222A),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Jun 29",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 14),
                                        ),
                                        const Expanded(child: SizedBox()),
                                        SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: SvgPicture.asset(
                                            DefaultImages.calendar,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .color,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 14),
                          Padding(
                            padding: const EdgeInsets.only(top: 35),
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: SvgPicture.asset(
                                DefaultImages.arrowImage,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Fecha de salida",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontSize: 18),
                                ),
                                const SizedBox(height: 15),
                                Container(
                                  height: 56,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppTheme.isLightTheme == true
                                        ? const Color(0xffFAFAFA)
                                        : const Color(0xff1F222A),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Jun 30",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 14),
                                        ),
                                        const Expanded(child: SizedBox()),
                                        SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: SvgPicture.asset(
                                            DefaultImages.calendar,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .color,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 76,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: AppTheme.isLightTheme == true
                              ? const Color(0xffFAFAFA)
                              : const Color(0xff1F222A),
                          border: Border.all(
                            color: AppTheme.isLightTheme == true
                                ? const Color(0xffEEEEEE)
                                : const Color(0xffEEEEEE).withOpacity(0.1),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 52,
                              width: 52,
                              decoration: BoxDecoration(
                                color: AppTheme.isLightTheme == true
                                    ? const Color(0xffE8F8EF)
                                    : Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color!
                                        .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(
                                Icons.remove,
                                color: HexColor(AppTheme.primaryColorString!),
                                size: 22,
                              ),
                            ),
                            const SizedBox(width: 30),
                            Text(
                              "3",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontSize: 24),
                            ),
                            const SizedBox(width: 30),
                            Container(
                              height: 52,
                              width: 52,
                              decoration: BoxDecoration(
                                color: AppTheme.isLightTheme == true
                                    ? const Color(0xffE8F8EF)
                                    : Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color!
                                        .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(
                                Icons.add,
                                color: HexColor(AppTheme.primaryColorString!),
                                size: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Habitacion: ",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 20),
                    ),
                    TextSpan(
                      text: widget.habitacion.tipoHabitacion,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: const Color(0xff424242),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Text(
                "Total: BOL ${widget.habitacion.precio}",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: const Color(0xff424242),
                      fontSize: 20,
                    ),
              ),
            ),
            const SizedBox(height: 20),
            CustomlabelLarge(
              text: "Continuar",
              onTap: () {
                Get.to(
                  const NameReservationScreen(),
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
