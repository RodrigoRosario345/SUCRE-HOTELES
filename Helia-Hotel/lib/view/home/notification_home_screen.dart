// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';

class HomeNotificationScreen extends StatefulWidget {
  const HomeNotificationScreen({Key? key}) : super(key: key);

  @override
  State<HomeNotificationScreen> createState() => _HomeNotificationScreenState();
}

class _HomeNotificationScreenState extends State<HomeNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
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
                Text(
                  "Notificationes",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const Expanded(child: SizedBox()),
                SizedBox(
                  height: 28,
                  width: 28,
                  child: SvgPicture.asset(
                    DefaultImages.more,
                    fit: BoxFit.fill,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hoy", //today significa
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: 15),
                      card(
                        DefaultImages.p3,
                        "Pago exitoso!",
                        "La reserva del Hotel Monasterio fue exitosa!",
                      ),
                      const SizedBox(height: 20),
                      card(
                        DefaultImages.n1,
                        "Monedero electrónico conectado",
                        "Monedero electrónico conectado",
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Ayer",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: 15),
                      card(
                        DefaultImages.n2,
                        "Reserva de hotel cancelada",
                        "Ha cancelado su reserva de hote",
                      ),
                      const SizedBox(height: 20),
                      card(
                        DefaultImages.n3,
                        "2 verificación de paso exitosa",
                        "La reserva del Hotel Laluna fue exitosa!",
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Junio 28, 2023",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: 15),
                      card(
                        DefaultImages.p3,
                        "Verificación exitosa",
                        "Verificación de cuenta completa",
                      ),
                      const SizedBox(height: 50),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget card(String image, String text1, String text2) {
    return Container(
      width: Get.width,
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
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      text2,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            color: const Color(0xff616161),
                          ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
