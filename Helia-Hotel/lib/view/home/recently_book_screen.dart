// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/controller/home_controller.dart';
import 'package:hotel/view/home/bookmark_view.dart';

class RecentlyBookScreen extends StatefulWidget {
  const RecentlyBookScreen({Key? key}) : super(key: key);

  @override
  State<RecentlyBookScreen> createState() => _RecentlyBookScreenState();
}

class _RecentlyBookScreenState extends State<RecentlyBookScreen> {
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 20),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 16),
                Obx(
                  () => Text(
                    homeController.recently.value == 0
                        ? "Todas las reservas"
                        : "Mi marcador",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Obx(
                  () => InkWell(
                    onTap: () {
                      homeController.recently.value = 0;
                    },
                    child: SizedBox(
                      height: 28,
                      width: 28,
                      child: SvgPicture.asset(
                        DefaultImages.selectDocument,
                        fit: BoxFit.fill,
                        color: homeController.recently.value == 0
                            ? HexColor(AppTheme.primaryColorString!)
                            : Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Obx(
                  () => InkWell(
                    onTap: () {
                      homeController.recently.value = 1;
                    },
                    child: SizedBox(
                      height: 28,
                      width: 28,
                      child: SvgPicture.asset(
                        DefaultImages.category,
                        fit: BoxFit.fill,
                        color: homeController.recently.value == 1
                            ? HexColor(AppTheme.primaryColorString!)
                            : Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() => homeController.recently.value == 0
                  ? ListView.builder(
                      itemCount: 5,
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 50),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.isLightTheme == true
                                  ? Theme.of(context)
                                      .appBarTheme
                                      .backgroundColor
                                  : const Color(0xff1F222A),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xff04060F).withOpacity(0.05),
                                  blurRadius: 8,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          index == 0
                                              ? DefaultImages.d3
                                              : index == 1
                                                  ? DefaultImages.d4
                                                  : index == 2
                                                      ? DefaultImages.d1
                                                      : index == 3
                                                          ? DefaultImages.d7
                                                          : index == 3
                                                              ? DefaultImages.d6
                                                              : DefaultImages
                                                                  .d8,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          index == 0
                                              ? "Hotel Monasterio"
                                              : index == 1
                                                  ? "ON hotel boutique"
                                                  : index == 2
                                                      ? "Hotel CasArte Takubamba"
                                                      : index == 3
                                                          ? "Hotel Boutique La Posada"
                                                          : "Hotel villa antigua",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                              ),
                                        ),
                                        const SizedBox(height: 15),
                                        Text(
                                          index == 0
                                              ? "Sucre, Bolvia"
                                              : index == 1
                                                  ? "Sucre, Bolvia"
                                                  : index == 2
                                                      ? "Sucre, Bolvia"
                                                      : index == 3
                                                          ? "Sucre, Bolvia"
                                                          : "Sucre, Bolvia",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 14,
                                                color: const Color(0xff757575),
                                              ),
                                        ),
                                        const SizedBox(height: 15),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Color(0xffFFD300),
                                              size: 15,
                                            ),
                                            Text(
                                              "  4.8  ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                    fontSize: 14,
                                                    color: HexColor(AppTheme
                                                        .primaryColorString!),
                                                  ),
                                            ),
                                            Text(
                                              index == 0
                                                  ? "(3 vistas)"
                                                  : index == 1
                                                      ? "(3 vistas)"
                                                      : index == 2
                                                          ? "(3 vistas)"
                                                          : index == 3
                                                              ? "(3 vistas)"
                                                              : "(3 vistas)",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff757575),
                                                  ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          index == 0
                                              ? "350 BOL"
                                              : index == 1
                                                  ? "456 BOL"
                                                  : index == 2
                                                      ? "560 BOL"
                                                      : index == 3
                                                          ? "345 BOL"
                                                          : "700 BOL",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 18,
                                                color: HexColor(AppTheme
                                                    .primaryColorString!),
                                              ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          "/ noche",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 10,
                                                color: const Color(0xff757575),
                                              ),
                                        ),
                                        const SizedBox(height: 20),
                                        SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: SvgPicture.asset(
                                            index % 2 == 0
                                                ? DefaultImages.selectBookmark
                                                : DefaultImages.bookmark,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const BookMarkView()),
            ),
          ],
        ),
      ),
    );
  }
}
