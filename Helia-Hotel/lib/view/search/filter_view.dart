// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/view/search/search_view.dart';
import 'package:hotel/widget/custom_container.dart';

class FilterView extends StatelessWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 50,
      decoration: BoxDecoration(
        color: AppTheme.isLightTheme == true
            ? Theme.of(context).appBarTheme.backgroundColor
            : const Color(0xff1F222A),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                Text(
                  "Filtrar Hotel por: ",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 24,
                      ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            const SizedBox(height: 15),
            const Divider(color: Color(0xffEEEEEE)),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Categoria:",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 18,
                                  ),
                            ),
                            Text(
                              "Ver Todo",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 18,
                                    color:
                                        HexColor(AppTheme.primaryColorString!),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 40,
                        width: Get.width,
                        child: ListView.builder(
                          itemCount: 4,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 14),
                              child: Row(
                                children: [
                                  searchCard(
                                    index == 0
                                        ? "hoteles de lujo"
                                        : index == 1
                                            ? "hoteles boutique"
                                            : index == 2
                                                ? "hoteles económicos"
                                                : "hoteles de negocios",
                                    index == 0
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : Colors.transparent,
                                    () {},
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          "Ordenar por:",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 18,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 40,
                        width: Get.width,
                        child: ListView.builder(
                          itemCount: 4,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 14),
                              child: Row(
                                children: [
                                  searchCard(
                                    index == 0
                                        ? "Mas Popular"
                                        : index == 1
                                            ? "Precio mas alto"
                                            : "Precio mas bajo",
                                    index == 0
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : Colors.transparent,
                                    () {},
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          "Clasificación por estrellas:",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 18,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 40,
                        width: Get.width,
                        child: ListView.builder(
                          itemCount: 5,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 14),
                              child: Row(
                                children: [
                                  ratingCard(
                                    index == 0
                                        ? "5"
                                        : index == 1
                                            ? "4"
                                            : index == 2
                                                ? "3"
                                                : index == 3
                                                    ? "2"
                                                    : "1",
                                    index == 0
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : Colors.transparent,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          "Rango de precios: ",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 18,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 47,
                        width: Get.width,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              DefaultImages.divider,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Servicios:",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 18,
                                  ),
                            ),
                            Text(
                              "Ver Todo",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 18,
                                    color:
                                        HexColor(AppTheme.primaryColorString!),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 40,
                        width: Get.width,
                        child: ListView.builder(
                          itemCount: 4,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 14),
                              child: Row(
                                children: [
                                  tickCard(
                                    index == 0
                                        ? "WiFi"
                                        : index == 1
                                            ? "Piscina"
                                            : index == 2
                                                ? "Estacionamiento"
                                                : "Restaurante",
                                    index == 0 || index == 1
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : Colors.transparent,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tipo de alojamiento:",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 18,
                                  ),
                            ),
                            Text(
                              "Ver Todo",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 18,
                                    color:
                                        HexColor(AppTheme.primaryColorString!),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 40,
                        width: Get.width,
                        child: ListView.builder(
                          itemCount: 4,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 14),
                              child: Row(
                                children: [
                                  tickCard(
                                    index == 0
                                        ? "Hoteles"
                                        : index == 1
                                            ? "Complejos turísticos"
                                            : index == 2
                                                ? "Villas"
                                                : "Apartamentos",
                                    index == 0 || index == 2
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : Colors.transparent,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Divider(color: Color(0xffEEEEEE)),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: CustomlabelLarge(
                      text: "restablecer",
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
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: CustomlabelLarge(
                      text: "Aplicar filtros",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

Widget ratingCard(String text, Color bgColor) {
  return Container(
    height: 38,
    decoration: BoxDecoration(
      color: bgColor,
      border: Border.all(
        color: HexColor(AppTheme.primaryColorString!),
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            color: bgColor == HexColor(AppTheme.primaryColorString!)
                ? Colors.white
                : HexColor(AppTheme.primaryColorString!),
            size: 15,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: Theme.of(Get.context!).textTheme.bodyLarge!.copyWith(
                  fontSize: 16,
                  color: bgColor == HexColor(AppTheme.primaryColorString!)
                      ? Colors.white
                      : HexColor(AppTheme.primaryColorString!),
                ),
          ),
        ],
      ),
    ),
  );
}

Widget tickCard(String text, Color bgColor) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(
            color: HexColor(AppTheme.primaryColorString!),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          Icons.check,
          size: 16,
          color: bgColor == HexColor(AppTheme.primaryColorString!)
              ? Colors.white
              : Colors.transparent,
        ),
      ),
      const SizedBox(width: 14),
      Text(
        text,
        style: Theme.of(Get.context!).textTheme.bodyLarge!.copyWith(
              fontSize: 16,
            ),
      ),
    ],
  );
}
