// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/view/search/filter_view.dart';
import 'package:hotel/view/search/gallery_screen.dart';
import 'package:hotel/view/search/hotel_location_screen.dart';
import 'package:hotel/view/search/rate_bottomsheet.dart';
import 'package:hotel/view/search/rating_screen.dart';
import 'package:hotel/view/search/select_date_screen.dart';
import 'package:hotel/widget/custom_container.dart';
import 'package:readmore/readmore.dart';
import 'package:hotel/model/data_modelo.dart';
import 'package:hotel/model/data_habitacion.dart';
import 'package:hotel/controller/date_controller.dart';


class HotelDetailScreen extends StatefulWidget {
  final Hotel hotel;
  const HotelDetailScreen({super.key, required this.hotel});

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  final DateController dateController = Get.put(DateController()); 
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late List<String> _firstFourImageKeys; // Para las primeras 4 imágenes
  late List<String> _randomFiveImageKeys; // Para 5 imágenes aleatorias
  late List<String> _allImageKeys;
  @override
  void initState() {
    super.initState();
    _selectImages();
    dateController.setHotelData(widget.hotel.nombre);
  }

  void _selectImages() {
    var allKeys = widget.hotel.imagenes.keys.toList();
    _allImageKeys = List.from(allKeys);
    // Asegura que haya suficientes imágenes para seleccionar
    if (allKeys.length >= 8) {
      _firstFourImageKeys =
          allKeys.take(4).toList(); // Toma las primeras 4 claves sin mezclar

      allKeys.shuffle(
          Random()); // Mezcla la lista de claves para la selección aleatoria
      _randomFiveImageKeys = allKeys
          .take(5)
          .toList(); // Selecciona las primeras 5 claves después de mezclar
    } else {
      // Maneja el caso en que no hay suficientes imágenes
      print("No hay suficientes imágenes para seleccionar.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: NestedScrollView(
        headerSliverBuilder: (context, index) => [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: Container(
              height: 300,
              width: Get.width,
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage("assets/images/Capital_Plaza_Hotel3.jpg"),
              //     fit: BoxFit.fill,
              //   ),
              // ),
              child: Swiper(
                pagination: const SwiperPagination(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 300,
                    width: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            widget.hotel.imagenes[_firstFourImageKeys[index]]!),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
                itemCount: _firstFourImageKeys
                    .length, // Usa la longitud de _selectedImageKeys,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  DefaultImages.bookmark,
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () {
                  scaffoldKey.currentState!.showBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    (context) => const RateBottomSheet(),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    DefaultImages.more,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          widget.hotel.nombre, // nombre del hotel
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 30,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          //crossAxisAlignment: CrossAxisAlignment
                          //    .start, // Alinea los hijos al inicio del eje transversal
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: SvgPicture.asset(
                                DefaultImages.location,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                widget.hotel.ubicacion,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Divider(
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color!
                                .withOpacity(0.1)),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(
                            GalleryScreen(
                                hotel: widget.hotel,
                                allImageKeys:
                                    _allImageKeys), // galeria que muestra las imagenes
                            transition: Transition.rightToLeft,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Galeria de Fotos",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontSize: 20),
                              ),
                              Text(
                                "Ver todo",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 16,
                                      color: HexColor(
                                          AppTheme.primaryColorString!),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 100,
                        width: Get.width,
                        child: ListView.builder(
                          itemCount: 5,
                          padding: const EdgeInsets.only(left: 20),
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                height: 100,
                                width: 140,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(widget.hotel.imagenes[
                                        _randomFiveImageKeys[
                                            index]]!), // mostramos las 5 imagenes
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    color: Colors.white, // Color del borde
                                    width: 2.0, // Ancho del borde
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "Habitaciones",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 0; i < 3; i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
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
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(width: 14),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  i == 0
                                                      ? widget
                                                          .hotel
                                                          .habitaciones[0]
                                                          .tipoHabitacion
                                                      : i == 1
                                                          ? widget
                                                              .hotel
                                                              .habitaciones[1]
                                                              .tipoHabitacion
                                                          : widget
                                                              .hotel
                                                              .habitaciones[2]
                                                              .tipoHabitacion,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                                const SizedBox(height: 5),
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: "Hab. Disp.: ",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                                fontSize: 13),
                                                      ),
                                                      TextSpan(
                                                        text: i == 0
                                                            ? widget
                                                                .hotel
                                                                .habitaciones[0]
                                                                .cantidad
                                                                .toString()
                                                            : i == 1
                                                                ? widget
                                                                    .hotel
                                                                    .habitaciones[
                                                                        1]
                                                                    .cantidad
                                                                    .toString()
                                                                : widget
                                                                    .hotel
                                                                    .habitaciones[
                                                                        2]
                                                                    .cantidad
                                                                    .toString(),
                                                        style: const TextStyle(
                                                          fontWeight: FontWeight
                                                              .bold, // Negrita solo para el valor de la cantidad
                                                          fontSize:
                                                              14, // Tamaño de fuente más grande solo para el valor de la cantidad
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: "Precio: ",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                                fontSize: 13),
                                                      ),
                                                      TextSpan(
                                                        text: i == 0
                                                            ? widget
                                                                .hotel
                                                                .habitaciones[0]
                                                                .precio
                                                                .toString()
                                                            : i == 1
                                                                ? widget
                                                                    .hotel
                                                                    .habitaciones[
                                                                        1]
                                                                    .precio
                                                                    .toString()
                                                                : widget
                                                                    .hotel
                                                                    .habitaciones[
                                                                        2]
                                                                    .precio
                                                                    .toString(),
                                                        style: const TextStyle(
                                                          fontWeight: FontWeight
                                                              .bold, // Negrita solo para el valor de la cantidad
                                                          fontSize:
                                                              14, // Tamaño de fuente más grande solo para el valor de la cantidad
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: "BOL",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                                fontSize: 13),
                                                      ),
                                                      const TextSpan(
                                                        text: " /",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .bold, // Negrita solo para el valor de la cantidad
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: "noche",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                                fontSize: 13),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            //const SizedBox(width: 20),
                                            Expanded(
                                              // Asegura que el Row pueda expandirse
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    width: 100,
                                                    child: CustomlabelLarge(
                                                      text: "Reservar",
                                                      onTap: () {
                                                        Get.to(
                                                          i == 0
                                                              ? SelectDateScreen(
                                                                  habitacion: widget
                                                                          .hotel
                                                                          .habitaciones[
                                                                      0])
                                                              : i == 1
                                                                  ? SelectDateScreen(
                                                                      habitacion:
                                                                          widget.hotel.habitaciones[
                                                                              1])
                                                                  : SelectDateScreen(
                                                                      habitacion: widget
                                                                          .hotel
                                                                          .habitaciones[2]),
                                                          transition: Transition
                                                              .rightToLeft,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            detailCard(
                                                DefaultImages.i2, "Hoteles"),
                                            detailCard(DefaultImages.i3,
                                                "4 Dormitorios"),
                                            detailCard(
                                                DefaultImages.i4, "2 Baños"),
                                            detailCard(
                                                DefaultImages.i5, "4000 sqft"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(height: 20),

                            // boton de ver mas
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 50,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: AppTheme.isLightTheme == true
                                      ? HexColor(AppTheme.primaryColorString!)
                                          .withOpacity(0.2)
                                      : Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Ver más habitaciones",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: AppTheme.isLightTheme == true
                                                ? HexColor(AppTheme
                                                    .primaryColorString!)
                                                : Colors.white,
                                          ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: HexColor(
                                          AppTheme.primaryColorString!),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),

                      // DESCRIPCIÓN
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "Descripción",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ReadMoreText(
                          widget.hotel
                              .descripcion, // Aquí se pasa directamente la descripción como String
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(),
                          textAlign: TextAlign.justify,
                          trimLines: 4,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: '...Ver más',
                          moreStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                fontSize: // Ajusta también el tamaño de la fuente para "...Ver más"
                                    13,
                                color: HexColor(AppTheme.primaryColorString!),
                                fontFamily: Theme.of(context).platform ==
                                        TargetPlatform.iOS
                                    ? 'San Francisco'
                                    : 'Helvetica', // Fuente similar a Apple para "...Ver más"
                              ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "Servicios",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          detailCard(DefaultImages.i6, "Piscina"),
                          detailCard(DefaultImages.i7, "WiFi"),
                          detailCard(DefaultImages.i8, "Restaurante"),
                          detailCard(DefaultImages.i9, "Estacionamiento"),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          detailCard(DefaultImages.i10, "Sala de Reuniones"),
                          detailCard(DefaultImages.i11, "Elevador"),
                          detailCard(DefaultImages.i12, "Gimnasio"),
                          detailCard(DefaultImages.i2, "24-hrs atención"),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "Ubicación",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Get.to(
                            const HotelLocationScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: SizedBox(
                            height: 180,
                            width: Get.width,
                            child: Image.asset(
                              AppTheme.isLightTheme == true
                                  ? DefaultImages.map
                                  : DefaultImages.darkMap,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Get.to(
                            const RatingScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              Text(
                                "Valoraciones",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontSize: 20),
                              ),
                              const SizedBox(width: 14),
                              const Icon(
                                Icons.star,
                                color: Color(0xffFFD300),
                                size: 15,
                              ),
                              Text(
                                "4.8",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 14,
                                      color: HexColor(
                                          AppTheme.primaryColorString!),
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "(3)",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 14,
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Expanded(child: SizedBox()),
                              //const Spacer(),
                              Text(
                                "Ver todo",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 16,
                                      color: HexColor(
                                          AppTheme.primaryColorString!),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 0; i < 3; i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
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
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 48,
                                              width: 48,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    i == 0
                                                        ? DefaultImages.pr1
                                                        : i == 1
                                                            ? DefaultImages.pr2
                                                            : DefaultImages.pr3,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 14),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  i == 0
                                                      ? "Carla Sanchez"
                                                      : i == 1
                                                          ? "Sebastian Lopez"
                                                          : "Rodrigo Rosario",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                        fontSize: 16,
                                                      ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  i == 0
                                                      ? "Jun 29, 2023"
                                                      : i == 1
                                                          ? "Jun 29, 2023"
                                                          : "Jun 30, 2023",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        fontSize: 12,
                                                      ),
                                                )
                                              ],
                                            ),
                                            const Expanded(child: SizedBox()),
                                            ratingCard(
                                                "5.0",
                                                HexColor(AppTheme
                                                    .primaryColorString!)),
                                          ],
                                        ),
                                        const SizedBox(height: 15),
                                        Text(
                                          i == 0
                                              ? "Muy lindo y cómodo hotel, gracias por acompañar mis vacaciones!"
                                              : i == 0
                                                  ? "Muy lindo hotel, mi familia y yo estamos muy satisfechos con el servicio"
                                                  : "Me gusto muy buen hotel",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                height: 1.4,
                                                fontSize: 14,
                                              ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 50,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: AppTheme.isLightTheme == true
                                      ? HexColor(AppTheme.primaryColorString!)
                                          .withOpacity(0.2)
                                      : Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Más  ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: AppTheme.isLightTheme == true
                                                ? HexColor(AppTheme
                                                    .primaryColorString!)
                                                : Colors.white,
                                          ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: HexColor(
                                          AppTheme.primaryColorString!),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget detailCard(String image, String text) {
  return Column(
    children: [
      Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
          ),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        text,
        style: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(
              fontSize: 12,
            ),
      ),
    ],
  );
}
