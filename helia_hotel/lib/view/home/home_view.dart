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
import 'package:hotel/model/data_modelo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hotel/controller/auth_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeController());
  final AuthController authController = Get.find<AuthController>();
  String? nombre;
  String? apellidos;

  bool _isLoading = true;
  List<Hotel> _hoteles = [];

  @override
  void initState() {
    super.initState();
    _initializeUserData();
    _getData();
  }

  // Insertar datos de habitaciones
  Future<void> agregarHabitacionesLimitadas() async {
    final dbRef = FirebaseDatabase.instance.ref();

    // Lista de hoteles y sus habitaciones a agregar
    Map<String, List<Map<String, dynamic>>> habitacionesPorHotel = {
      "hotel1": [
        {
          "tipo_habitacion": "matrimonial",
          "cantidad": 3,
          "cod_habitacion": "hab002"
        },
        {
          "tipo_habitacion": "familiar",
          "cantidad": 4,
          "cod_habitacion": "hab003"
        },
        {"tipo_habitacion": "suite", "cantidad": 2, "cod_habitacion": "hab004"},
      ],
      "hotel2": [
        {
          "tipo_habitacion": "matrimonial",
          "cantidad": 3,
          "cod_habitacion": "hab005"
        },
        {
          "tipo_habitacion": "familiar",
          "cantidad": 4,
          "cod_habitacion": "hab006"
        },
        {"tipo_habitacion": "suite", "cantidad": 5, "cod_habitacion": "hab007"},
      ],
      "hotel3": [
        {
          "tipo_habitacion": "matrimonial",
          "cantidad": 4,
          "cod_habitacion": "hab008"
        },
        {
          "tipo_habitacion": "familiar",
          "cantidad": 5,
          "cod_habitacion": "hab009"
        },
        {"tipo_habitacion": "suite", "cantidad": 4, "cod_habitacion": "hab010"},
      ],
      "hotel4": [
        {
          "tipo_habitacion": "matrimonial",
          "cantidad": 2,
          "cod_habitacion": "hab011"
        },
        {
          "tipo_habitacion": "familiar",
          "cantidad": 5,
          "cod_habitacion": "hab012"
        },
        {"tipo_habitacion": "suite", "cantidad": 5, "cod_habitacion": "hab013"},
      ],
      "hotel5": [
        {
          "tipo_habitacion": "matrimonial",
          "cantidad": 4,
          "cod_habitacion": "hab014"
        },
        {
          "tipo_habitacion": "familiar",
          "cantidad": 2,
          "cod_habitacion": "hab015"
        },
        {"tipo_habitacion": "suite", "cantidad": 2, "cod_habitacion": "hab016"},
      ],
      "hotel6": [
        {
          "tipo_habitacion": "matrimonial",
          "cantidad": 2,
          "cod_habitacion": "hab017"
        },
        {
          "tipo_habitacion": "familiar",
          "cantidad": 3,
          "cod_habitacion": "hab018"
        },
        {"tipo_habitacion": "suite", "cantidad": 4, "cod_habitacion": "hab019"},
      ],
      "hotel7": [
        {
          "tipo_habitacion": "matrimonial",
          "cantidad": 1,
          "cod_habitacion": "hab020"
        },
        {
          "tipo_habitacion": "familiar",
          "cantidad": 4,
          "cod_habitacion": "hab021"
        },
        {"tipo_habitacion": "suite", "cantidad": 3, "cod_habitacion": "hab022"},
      ],
      "hotel8": [
        {
          "tipo_habitacion": "matrimonial",
          "cantidad": 3,
          "cod_habitacion": "hab023"
        },
        {
          "tipo_habitacion": "familiar",
          "cantidad": 1,
          "cod_habitacion": "hab024"
        },
        {"tipo_habitacion": "suite", "cantidad": 4, "cod_habitacion": "hab025"},
      ],
    };

    // Iterar sobre cada hotel y sus habitaciones para agregarlas
    for (var hotelId in habitacionesPorHotel.keys) {
      int habitacionesAgregadasPorHotel = 0;

      for (var habitacion in habitacionesPorHotel[hotelId]!) {
        // Verificar límite de habitaciones por hotel
        if (habitacionesAgregadasPorHotel < 3) {
          // Construir el identificador de la habitación
          String habitacionId =
              'habitacion${habitacionesAgregadasPorHotel + 1}';
          // Agregar cada habitación al hotel correspondiente en Firebase
          await dbRef.child('hoteles/$hotelId/habitaciones/$habitacionId').set({
            "tipo_habitacion": habitacion["tipo_habitacion"],
            "cantidad": habitacion["cantidad"],
            "cod_habitacion": habitacion["cod_habitacion"],
          });
          habitacionesAgregadasPorHotel++;
        } else {
          break; // Salir del bucle interno si se alcanza el límite
        }
      }
    }
  }

  _initializeUserData() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      final userInfo = await authController.getUserInfo(userId);
      if (userInfo != null) {
        setState(() {
          nombre = userInfo['nombre'];
          apellidos = userInfo['apellidos'];
        });
      }
    }
  }

  // obtiene data de los hoteles
  _getData() async {
    try {
      final DatabaseReference ref = FirebaseDatabase.instance.ref('hoteles');

      DatabaseEvent event = await ref.once();
      DataSnapshot snapshot = event.snapshot;

      if (snapshot.value != null) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        List<Hotel> hoteles =
            values.entries.map((entry) => Hotel.fromJson(entry.value)).toList();

        final random = Random();
        hoteles.shuffle(
            random); // Mezclar la lista de hoteles obtenida por Firebase

        setState(() {
          _hoteles = hoteles;
          //agregarHabitacionesLimitadas();
          _isLoading = false;
        });
      } else {
        print('No data available.');
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _buildContent(), // Método que construye el contenido principal
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top + 20),
        // Barra de navegación superior
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
                      'Hola, ${nombre ?? 'Cargando...'} ${apellidos ?? ''}',
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
                                            builder: (context) => HotelDetailScreen(
                                                hotel: _hoteles[
                                                    index]), // enviamos el Hotel a Detalles
                                          ));
                                    },
                                    child: Container(
                                      height: 400,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(34),
                                        image: DecorationImage(
                                          image: NetworkImage(_hoteles[index]
                                              .imagenes['imagen1']!),
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
                                    child: InkWell(
                                      onTap: () {
                                        // Acción al tocar, por ejemplo, navegar a otra pantalla
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HotelDetailScreen(
                                                      hotel: _hoteles[index])),
                                        );
                                      },
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
                                                                .imagenes[
                                                            'imagen1']!),
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

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties
  //       .add(DiagnosticsProperty<Map<String, dynamic>?>('userInfo', userInfo));
  // }
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
                builder: (context) => HotelDetailScreen(hotel: Hotel.empty()),
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
                builder: (context) => HotelDetailScreen(hotel: Hotel.empty()),
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
