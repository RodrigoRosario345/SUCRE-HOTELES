// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/model/data_modelo.dart';

class GalleryScreen extends StatefulWidget {
  final Hotel hotel;
  final List<String> allImageKeys;
  const GalleryScreen(
      {super.key, required this.hotel, required this.allImageKeys});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
        title: Text(
          "Galería de fotos del hotel",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              DefaultImages.more,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding:
            const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
        itemCount: widget.allImageKeys.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 150,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    widget.hotel.imagenes[widget.allImageKeys[index]]!),
                fit: BoxFit.fill,
              ),
              border: Border.all(
                color: Colors.white, // Color del borde
                width: 2.0, // Ancho del borde
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
      ),
    );
  }
}
