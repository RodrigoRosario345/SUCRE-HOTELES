// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/controller/home_controller.dart';
import 'package:hotel/view/search/filter_view.dart';
import 'package:hotel/view/search/hotel_detail_screen.dart';
import 'package:hotel/widget/custom_textfield.dart';

class SearchController extends GetxController {
  final controller = TextEditingController().obs;
  RxList<bool> tapList = [true, false, false, false, false].obs;
}

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final searchController = Get.put(SearchController());
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top + 20),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: CustomTextField(
            hintText: "Search",
            textFieldController: searchController.controller.value,
            prefix: Padding(
              padding: const EdgeInsets.all(14.0),
              child: IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 110, 97, 97),
                ),
              ),
            ),
            sufix: InkWell(
              onTap: () {
                homeController.scaffoldKey.currentState!.showBottomSheet(
                  enableDrag: true,
                  backgroundColor:
                      Theme.of(context).appBarTheme.backgroundColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  (context) => const FilterView(),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SvgPicture.asset(
                  DefaultImages.filter,
                ),
              ),
            ),
            onChanged: (value) {},
            suffix: const InkWell(), // ignore: unnecessary_statements,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 40,
          width: Get.width,
          child: ListView.builder(
            itemCount: 1,
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 14),
                child: Obx(
                  () => Row(
                    children: [
                      searchCard(
                        index == 0 ? "Todos los hoteles" : "Todos los hoteles",
                        searchController.tapList[index] == true
                            ? HexColor(AppTheme.primaryColorString!)
                            : Colors.transparent,
                        () {
                          for (var i = 0;
                              i < searchController.tapList.length;
                              i++) {
                            if (i == index) {
                              searchController.tapList[i] = true;
                            } else {
                              searchController.tapList[i] = false;
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Obx(
          () => searchController.controller.value.text.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Text(
                        "Recomendado (17)",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 18,
                            ),
                      ),
                      const Expanded(child: SizedBox()),
                      SizedBox(
                        height: 28,
                        width: 28,
                        child: SvgPicture.asset(
                          DefaultImages.selectDocument,
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 28,
                        width: 28,
                        child: SvgPicture.asset(
                          DefaultImages.category,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Reciente",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 18,
                        ),
                  ),
                ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Obx(
            () => searchController.controller.value.text.isEmpty
                ? ListView.builder(
                    itemCount: 5,
                    physics: const ClampingScrollPhysics(),
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 80),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          // var hotelId = 1;
                          // Get.to(
                          //   const HotelDetailScreen(hotelId),
                          //   transition: Transition.rightToLeft,
                          // );
                        },
                        child: Padding(
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
                                              ? DefaultImages.d1
                                              : index == 1
                                                  ? DefaultImages.d6
                                                  : index == 2
                                                      ? DefaultImages.d2
                                                      : index == 3
                                                          ? DefaultImages.d7
                                                          : DefaultImages.d8,
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
                                              ? "	On Hotel Boutique"
                                              : index == 0
                                                  ? "Capital Plaza Hotel Sucre"
                                                  : index == 0
                                                      ? "Mi Pueblo Samary Hotel Boutique"
                                                      : "Hotel Monasterio",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
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
                                                      : "Sucre, Bolvia",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
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
                                                  .bodyText1!
                                                  .copyWith(
                                                    fontSize: 14,
                                                    color: HexColor(AppTheme
                                                        .primaryColorString!),
                                                  ),
                                            ),
                                            Text(
                                              index == 0
                                                  ? "(5 vistas)"
                                                  : index == 1
                                                      ? "(4 vistas)"
                                                      : index == 2
                                                          ? "(3 vistas)"
                                                          : index == 3
                                                              ? "(5 vistas)"
                                                              : "(4 vistas)",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
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
                                              ? "\ BOL 427"
                                              : index == 1
                                                  ? "\ BOL 322"
                                                  : index == 2
                                                      ? "\ BOL 532"
                                                      : index == 3
                                                          ? "\BOL 232"
                                                          : "\BOL 523",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
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
                                              .bodyText1!
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
                                            DefaultImages.bookmark,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .color,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: 6,
                    physics: const ClampingScrollPhysics(),
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 50),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          searchController.controller.value.clear();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                index == 0
                                    ? "Sucre, Bolvia"
                                    : index == 1
                                        ? "Sucre, Bolvia"
                                        : index == 2
                                            ? "Sucre, Bolvia"
                                            : index == 3
                                                ? "Sucre, Bolvia"
                                                : index == 4
                                                    ? "Sucre, Bolvia"
                                                    : "Sucre, Bolvia",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: const Color(0xff757575),
                                      fontSize: 18,
                                    ),
                              ),
                              Container(
                                height: 26,
                                width: 26,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xff757575),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: Color(0xff757575),
                                  size: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        )
      ],
    );
  }
}

Widget searchCard(String text, Color bgColor, VoidCallback onTap) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Container(
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
        child: Center(
          child: Text(
            text,
            style: Theme.of(Get.context!).textTheme.bodyText1!.copyWith(
                  fontSize: 16,
                  color: bgColor == HexColor(AppTheme.primaryColorString!)
                      ? Colors.white
                      : HexColor(AppTheme.primaryColorString!),
                ),
          ),
        ),
      ),
    ),
  );
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "on hotel boutique",
    "capital plaza hotel sucre",
    "mi pueblo samary hotel boutique",
    "hotel monasterio",
    "hotel independencia",
    "hotel real audiencia",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(
          Icons.clear,
          color: Color(0xff757575),
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Color(0xff757575),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var i = 0; i < searchTerms.length; i++) {
      if (searchTerms[i].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searchTerms[i]);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          onTap: () {
            // Navegar a la otra página aquí
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HotelDetailScreen(),
              ),
            );
          },
          title: Text(result, style: TextStyle(fontSize: 18)),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var i = 0; i < searchTerms.length; i++) {
      if (searchTerms[i].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searchTerms[i]);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          onTap: () {
            // Navegar a la otra página aquí
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HotelDetailScreen(),
              ),
            );
          },
          title: Text(result, style: TextStyle(fontSize: 18)),
        );
      },
    );
  }

  @override
  Widget buildSearchField(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: 18, // Tamaño de fuente para el texto ingresado
      ),
      decoration: InputDecoration(
        hintText: "Search",
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: 18, // Tamaño de fuente para el texto de sugerencia
        ),
      ),
      autofocus: true,
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        // Acciones al enviar la búsqueda
      },
    );
  }
}
