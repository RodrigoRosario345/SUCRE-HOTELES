import 'package:hotel/model/data_habitacion.dart';

class Hotel {
  final String nombre;
  final String lugar;
  final String ubicacion;
  final int precio;
  final String descripcion;
  final Map<String, String> imagenes;
  final List<Habitacion> habitaciones;

  Hotel({
    required this.nombre,
    required this.lugar,
    required this.ubicacion,
    required this.precio,
    required this.descripcion,
    required this.imagenes,
    required this.habitaciones,
  });

  factory Hotel.fromJson(Map<dynamic, dynamic> json) {
    var habitacionesJson = json['habitaciones'] as Map<dynamic, dynamic>? ?? {};
    List<Habitacion> habitacionesList = habitacionesJson.entries.map((entry) {
      return Habitacion.fromJson(entry.value);
    }).toList();

    return Hotel(
        nombre: json['nombre'] ?? '',
        lugar: json['lugar'] ?? '',
        ubicacion: json['ubicacion'] ?? '',
        precio: json['precio'] ?? 0,
        descripcion: json['Descripcion'] ?? '',
        imagenes: Map<String, String>.from(json['imagenes'] ?? {}),
        habitaciones: habitacionesList);
  }

  // Constructor vacío
  Hotel.empty()
      : nombre = '',
        lugar = '',
        ubicacion = '',
        precio = 0,
        descripcion = '',
        imagenes = {},
        habitaciones = [];
}
