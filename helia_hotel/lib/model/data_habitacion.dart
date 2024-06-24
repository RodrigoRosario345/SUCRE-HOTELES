class Habitacion {
  final String tipoHabitacion;
  final int cantidad;
  final String codHabitacion;

  Habitacion({
    required this.tipoHabitacion,
    required this.cantidad,
    required this.codHabitacion,
  });

  factory Habitacion.fromJson(Map<dynamic, dynamic> json) {
    return Habitacion(
      tipoHabitacion: json['tipoHabitacion'] ?? '',
      cantidad: json['cantidad'] ?? 0,
      codHabitacion: json['codHabitacion'] ?? '',
    );
  }

  Habitacion.empty()
      : tipoHabitacion = '',
        cantidad = 0,
        codHabitacion = '';
}
