// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/controller/home_controller.dart';
import 'package:hotel/view/document/document_view.dart';
import 'package:hotel/view/home/home_view.dart';
import 'package:hotel/view/profile/profile_view.dart';
import 'package:hotel/view/search/search_view.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.scaffoldKey,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GetX<HomeController>(
            init: homeController,
            builder: (homeController) => homeController.flag.value == 0
                ? const HomeView()
                : homeController.flag.value == 1
                    ? const SearchView()
                    : homeController.flag.value == 2
                        ? const DocumentView()
                        : const ProfileView(),
          ),
          Container(
            height: 70 + MediaQuery.of(context).padding.bottom,
            width: Get.width,
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: GetX<HomeController>(
              init: homeController,
              builder: (homeController) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      tabCard(
                        homeController.flag.value == 0
                            ? DefaultImages.profileTab
                            : DefaultImages.home,
                        "Inicio",
                        homeController.flag.value == 0
                            ? HexColor(AppTheme.primaryColorString!)
                            : const Color(0xff9E9E9E),
                        () {
                          homeController.flag.value = 0;
                        },
                      ),
                      tabCard(
                        homeController.flag.value == 1
                            ? DefaultImages.searchProfile
                            : DefaultImages.search,
                        "Buscar",
                        homeController.flag.value == 1
                            ? HexColor(AppTheme.primaryColorString!)
                            : const Color(0xff9E9E9E),
                        () {
                          homeController.flag.value = 1;
                        },
                      ),
                      tabCard(
                        homeController.flag.value == 2
                            ? DefaultImages.selectDocument
                            : DefaultImages.document,
                        "Reserva",
                        homeController.flag.value == 2
                            ? HexColor(AppTheme.primaryColorString!)
                            : const Color(0xff9E9E9E),
                        () {
                          homeController.flag.value = 2;
                        },
                      ),
                      tabCard(
                        homeController.flag.value == 3
                            ? DefaultImages.selectProfile
                            : DefaultImages.profile,
                        "Perfil",
                        homeController.flag.value == 3
                            ? HexColor(AppTheme.primaryColorString!)
                            : const Color(0xff9E9E9E),
                        () {
                          homeController.flag.value = 3;
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tabCard(String image, String text, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: SvgPicture.asset(
              image,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 10,
                  color: color,
                ),
          )
        ],
      ),
    );
  }
}
