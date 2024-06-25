class Habitacion {
  final String tipoHabitacion;
  final int cantidad;
  final String codHabitacion;
  final double precio;

  Habitacion({
    required this.tipoHabitacion,
    required this.cantidad,
    required this.codHabitacion,
    required this.precio,
  });

  factory Habitacion.fromJson(Map<dynamic, dynamic> json) {
    return Habitacion(
      tipoHabitacion: json['tipoHabitacion'] ?? '',
      cantidad: json['cantidad'] ?? 0,
      codHabitacion: json['codHabitacion'] ?? '',
      precio:
          (json['precio'] ?? 0.0).toDouble(), // Asegura la conversión a double
    );
  }

  Habitacion.empty()
      : tipoHabitacion = '',
        cantidad = 0,
        codHabitacion = '',
        precio = 0.0;
}
