// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/controller/date_controller.dart';
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
  final DateController dateController =
      Get.put(DateController()); // Instancia del controlador

  // Función para formatear las fechas
  String _formatDate(DateTime? date) {
    if (date == null) return "Seleccione";
    return "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";
  }

  @override
  void initState() {
    super.initState();
    // Al inicializar la pantalla, guarda los datos en el controlador
    dateController.setHabitacionData(
        widget.habitacion.tipoHabitacion, widget.habitacion.precio);
  }

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
                          onSelectionChanged:
                              (DateRangePickerSelectionChangedArgs args) {
                            setState(() {
                              if (args.value is PickerDateRange) {
                                dateController.setDates(
                                    args.value.startDate, args.value.endDate);
                              }
                            });
                          },
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
                                  "Fecha de entrada",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontSize: 16),
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
                                          _formatDate(
                                              dateController.startDate.value),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 13),
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
                                      .copyWith(fontSize: 16),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          _formatDate(
                                              dateController.endDate.value),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 13),
                                        ),
                                        // const Expanded(child: SizedBox()),
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
