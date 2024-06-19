// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';

class CanceledView extends StatefulWidget {
  const CanceledView({Key? key}) : super(key: key);

  @override
  State<CanceledView> createState() => _CanceledViewState();
}

class _CanceledViewState extends State<CanceledView> {
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
                                    ? DefaultImages.d7
                                    : index == 1
                                        ? DefaultImages.d8
                                        : DefaultImages.d9,
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
                                  ? "	On Hotel Boutique"
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
                              width: 150,
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xffF75555).withOpacity(0.12),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  "Cancelado y reembolsado",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 13,
                                        color: const Color(0xffF75555),
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
                    Container(
                      height: 34,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffF75555).withOpacity(0.20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.error,
                              color: Color(0xffF75555),
                              size: 20,
                            ),
                            const SizedBox(width: 14),
                            Text(
                              "Has cancelado esta reserva de hotel",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 15,
                                    color: const Color(0xffF75555),
                                  ),
                            ),
                          ],
                        ),
                      ),
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
