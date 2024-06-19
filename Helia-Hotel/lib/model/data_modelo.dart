// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:ffi';
import 'dart:core';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.hoteles,
  });

  List<Hotel> hoteles;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        hoteles:
            List<Hotel>.from(json["hoteles"].map((x) => Hotel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        // "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "hoteles": List<dynamic>.from(hoteles.map((x) => x.toJson())),
      };
}

class Hotel {
  Hotel({
    required this.id,
    required this.imagen_num_uno,
    required this.imagen_num_dos,
    required this.imagen_num_tres,
    required this.imagen_num_cuatro,
    required this.imagen_num_cinco,
    required this.imagen_num_seis,
    required this.imagen_num_siete,
    required this.imagen_num_ocho,
    required this.nombre,
    required this.lugar,
    required this.precio,
    required this.ubicacion,
    required this.descripcion,
  });

  int id;
  String imagen_num_uno;
  String imagen_num_dos;
  String imagen_num_tres;
  String imagen_num_cuatro;
  String imagen_num_cinco;
  String imagen_num_seis;
  String imagen_num_siete;
  String imagen_num_ocho;
  String nombre;
  String lugar;
  int precio;
  String ubicacion;
  String descripcion;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        id: json["id"] ?? 0,
        imagen_num_uno: json["imagen_num_uno"],
        imagen_num_dos: json["imagen_num_dos"],
        imagen_num_tres: json["imagen_num_tres"],
        imagen_num_cuatro: json["imagen_num_cuatro"],
        imagen_num_cinco: json["imagen_num_cinco"],
        imagen_num_seis: json["imagen_num_seis"],
        imagen_num_siete: json["imagen_num_siete"],
        imagen_num_ocho: json["imagen_num_ocho"],
        nombre: json["nombre"],
        lugar: json["lugar"],
        precio: json["precio"],
        ubicacion: json["ubicacion"],
        descripcion: json["Descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imagen_num_uno": imagen_num_uno,
        "imagen_num_dos": imagen_num_dos,
        "imagen_num_tres": imagen_num_tres,
        "imagen_num_cuatro": imagen_num_cuatro,
        "imagen_num_cinco": imagen_num_cinco,
        "imagen_num_seis": imagen_num_seis,
        "imagen_num_siete": imagen_num_siete,
        "imagen_num_ocho": imagen_num_ocho,
        "nombre": nombre,
        "lugar": lugar,
        "precio": precio,
        "ubicacion": ubicacion,
        "Descripcion": descripcion,
      };
}
