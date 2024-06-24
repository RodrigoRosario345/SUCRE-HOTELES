// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';

class CompletedView extends StatefulWidget {
  const CompletedView({super.key});

  @override
  State<CompletedView> createState() => _CompletedViewState();
}

class _CompletedViewState extends State<CompletedView> {
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
                                    ? DefaultImages.d4
                                    : index == 1
                                        ? DefaultImages.d5
                                        : DefaultImages.d6,
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
                                  ? "Hotel Monasterio"
                                  : index == 1
                                      ? "Glorieta Hotel"
                                      : "Ajayu Sucre",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
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
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 14,
                                    color: const Color(0xff616161),
                                  ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 24,
                              width: 90,
                              decoration: BoxDecoration(
                                color:
                                    HexColor(AppTheme.complementaryColorString!)
                                        .withOpacity(0.12),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  "Completado",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 13,
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
                    Container(
                      height: 34,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor(AppTheme.complementaryColorString!)
                            .withOpacity(0.20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        child: Row(
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: HexColor(
                                    AppTheme.complementaryColorString!),
                              ),
                              child: Icon(
                                Icons.check,
                                color: Theme.of(context)
                                    .appBarTheme
                                    .backgroundColor,
                                size: 10,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Text(
                              "Genial, lo has completado!",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 15,
                                    color: HexColor(
                                        AppTheme.complementaryColorString!),
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
