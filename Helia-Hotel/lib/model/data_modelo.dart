class Hotel {
  final String nombre;
  final String lugar;
  final String ubicacion;
  final int precio;
  final String descripcion;
  final Map<String, String> imagenes;

  Hotel({
    required this.nombre,
    required this.lugar,
    required this.ubicacion,
    required this.precio,
    required this.descripcion,
    required this.imagenes,
  });

  factory Hotel.fromJson(Map<dynamic, dynamic> json) {
    return Hotel(
      nombre: json['nombre'] ?? '',
      lugar: json['lugar'] ?? '',
      ubicacion: json['ubicacion'] ?? '',
      precio: json['precio'] ?? 0,
      descripcion: json['Descripcion'] ?? '',
      imagenes: Map<String, String>.from(json['imagenes'] ?? {}),
    );
  }
}
