// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    DefaultImages.d5,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hotel On boutique",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Sucre, Bolivia",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14,
                              color: HexColor(AppTheme.primaryColorString!),
                            ),
                      ),
                      Text(
                        "(3 vistas)",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14,
                              color: const Color(0xff757575),
                            ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\ 360BOL",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 18,
                          color: HexColor(AppTheme.primaryColorString!),
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "/ noche",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 10,
                          color: const Color(0xff757575),
                        ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset(
                      DefaultImages.selectBookmark,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
