// ignore_for_file: deprecated_member_use

// AQUE VA MARCADO PARA VISUALIZAR MAS GRANDE
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/view/home/remove_dialog.dart';

class BookMarkView extends StatelessWidget {
  const BookMarkView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 50),
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        mainAxisExtent: 280,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        index == 0
                            ? DefaultImages.d5
                            : index == 1
                                ? DefaultImages.d1
                                : index == 2
                                    ? DefaultImages.d3
                                    : index == 3
                                        ? DefaultImages.d2
                                        : index == 4
                                            ? DefaultImages.d7
                                            : index == 5
                                                ? DefaultImages.d6
                                                : index == 6
                                                    ? DefaultImages.d4
                                                    : DefaultImages.d8,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  index == 0
                      ? "Hotel Monasterio"
                      : index == 0
                          ? "ON hotel boutique"
                          : index == 0
                              ? "Hotel CasArte Takubamba"
                              : index == 0
                                  ? "Hotel Boutique La Posada"
                                  : index == 0
                                      ? "Hotel villa antigua"
                                      : index == 0
                                          ? "Hotel suMerced"
                                          : index == 0
                                              ? "Hotel Potosi"
                                              : "Roles Hotel",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                      ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color(0xffFFD300),
                      size: 15,
                    ),
                    Text(
                      "  4.8  ",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            color: HexColor(AppTheme.primaryColorString!),
                          ),
                    ),
                    Text(
                      index == 0
                          ? "Sucre, Bolivia"
                          : index == 0
                              ? "Sucre, Bolivia"
                              : index == 0
                                  ? "Sucre, Bolivia"
                                  : index == 0
                                      ? "Sucre, Bolivia"
                                      : "Sucre, Bolivia",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            color: const Color(0xff757575),
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      index == 0
                          ? "BOL35"
                          : index == 1
                              ? "BOL29"
                              : index == 2
                                  ? "BOL36"
                                  : index == 3
                                      ? "BOL37"
                                      : "BOL38",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 18,
                            color: HexColor(AppTheme.primaryColorString!),
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      " / noche",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 10,
                            color: const Color(0xff757575),
                          ),
                    ),
                    const Expanded(child: SizedBox()),
                    InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          const RemoveDialog(),
                        );
                      },
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          DefaultImages.selectBookmark,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
