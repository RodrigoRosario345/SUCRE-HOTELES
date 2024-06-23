// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/controller/home_controller.dart';
import 'package:hotel/view/home/notification_home_screen.dart';
import 'package:hotel/view/home/recently_book_screen.dart';
import 'package:hotel/view/search/hotel_detail_screen.dart';
import 'package:hotel/view/search/search_view.dart';
import 'package:hotel/widget/custom_textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hotel/model/data_modelo.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeController());

  bool _isLoading = true;
  List<Hotel> _hoteles = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    try {
      String url = "http://192.168.100.45:5001/hoteles";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(res.body);
        List<dynamic> hotelesData = jsonResponse['hoteles'];

        final random = Random();
        hotelesData.shuffle(
            random); // Ordena aleatoriamente los hoteles en cada llamada

        List<Hotel> hoteles =
            hotelesData.map((data) => Hotel.fromJson(data)).toList();
        print(hoteles);
        setState(() {
          _hoteles = hoteles;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top + 20),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              Container(
                height: 52,
                width: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 255, 255, 255),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    DefaultImages.splashIcon,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                "Hoteles Sucre",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const Expanded(child: SizedBox()),
              InkWell(
                onTap: () {
                  Get.to(
                    const HomeNotificationScreen(),
                    transition: Transition.rightToLeft,
                  );
                },
                child: SizedBox(
                  height: 28,
                  width: 28,
                  child: SvgPicture.asset(
                    DefaultImages.notification,
                    fit: BoxFit.fill,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                height: 28,
                width: 28,
                child: SvgPicture.asset(
                  DefaultImages.bookmark,
                  fit: BoxFit.fill,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Hola, Rodrigo Rosario",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: CustomTextField(
                      hintText: "Buscar",
                      textFieldController: TextEditingController(),
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
                      sufix: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SvgPicture.asset(
                          DefaultImages.filter,
                        ),
                      ),
                      onChanged: (value) {},
                      suffix: const InkWell(),
                    ),
                  ),
                  const SizedBox(height: 10),
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
                                  index == 0
                                      ? "Recomendado"
                                      : index == 1
                                          ? "Popular"
                                          : index == 2
                                              ? "Tendencia" //
                                              : "Favoritos",
                                  homeController.tapList[index] == true
                                      ? HexColor(AppTheme.primaryColorString!)
                                      : Colors.transparent,
                                  () {
                                    for (var i = 0;
                                        i < homeController.tapList.length;
                                        i++) {
                                      if (i == index) {
                                        homeController.tapList[i] = true;
                                      } else {
                                        homeController.tapList[i] = false;
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
                  SizedBox(
                    height: 350,
                    width: Get.width,
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.only(left: 20),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HotelDetailScreen(),
                                          ));
                                    },
                                    child: Container(
                                      height: 400,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(34),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            _hoteles[index].imagen_num_uno,
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 20,
                                            bottom: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  height: 32,
                                                  width: 71,
                                                  decoration: BoxDecoration(
                                                    color: HexColor(AppTheme
                                                        .primaryColorString!),
                                                    border: Border.all(
                                                      color: HexColor(AppTheme
                                                          .primaryColorString!),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                          size: 15,
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(
                                                          "4.8",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyLarge!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _hoteles[index].nombre,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                      ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  _hoteles[index].lugar,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                      ),
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "${_hoteles[index].precio}BOL",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge!
                                                          .copyWith(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                    Text(
                                                      "/ precio",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge!
                                                          .copyWith(
                                                            fontSize: 14,
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                    const Expanded(
                                                        child: SizedBox()),
                                                    SizedBox(
                                                      height: 24,
                                                      width: 24,
                                                      child: SvgPicture.asset(
                                                        DefaultImages.bookmark,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                            },
                            itemCount: _hoteles.length,
                          ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Get.to(
                        const RecentlyBookScreen(),
                        transition: Transition.rightToLeft,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recientemente visitados", //Recently Booked //Reservaciones recientes
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 18,
                                    ),
                          ),
                          Text(
                            "Ver todo", //See All //Ver todo
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  fontSize: 16,
                                  color: HexColor(AppTheme.primaryColorString!),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(children: [
                    // implementar el listview.builder
                    _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            // scrollDirection: Axis.vertical,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            //     itemExtent: 400, use this if you give hight of your items
                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 25, left: 20, right: 20),
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
                                        color: const Color(0xff04060F)
                                            .withOpacity(0.05),
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
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(16),
                                              ),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      _hoteles[index]
                                                          .imagen_num_uno),
                                                  fit: BoxFit.fill),
                                            )),
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
                                                _hoteles[index].nombre,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                _hoteles[index]
                                                    .lugar, //Sucre, Bolivia
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      color: const Color(
                                                          0xff757575),
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
                                                    "120",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .copyWith(
                                                          fontSize: 14,
                                                          color: const Color(
                                                              0xff757575),
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
                                                "${_hoteles[index].precio} BOL",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                      fontSize: 15,
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
                                                      color: const Color(
                                                          0xff757575),
                                                    ),
                                              ),
                                              const SizedBox(height: 20),
                                              SizedBox(
                                                height: 24,
                                                width: 24,
                                                child: SvgPicture.asset(
                                                  DefaultImages.bookmark,
                                                  color: HexColor(AppTheme
                                                      .primaryColorString!),
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
                            itemCount: _hoteles.length,
                          )
                  ]),
                  const SizedBox(height: 50)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
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
                builder: (context) => const HotelDetailScreen(),
              ),
            );
          },
          title: Text(result, style: const TextStyle(fontSize: 18)),
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
                builder: (context) => const HotelDetailScreen(),
              ),
            );
          },
          title: Text(result, style: const TextStyle(fontSize: 18)),
        );
      },
    );
  }

  @override
  Widget buildSearchField(BuildContext context) {
    return TextField(
      style: const TextStyle(
        fontSize: 18, // Tamaño de fuente para el texto ingresado
      ),
      decoration: const InputDecoration(
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
