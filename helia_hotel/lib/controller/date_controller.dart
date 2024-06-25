// file: controllers/date_controller.dart
import 'package:get/get.dart';

class DateController extends GetxController {
  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);

  String tipoHabitacion = '';
  double precio = 0.0;
  String codHabit = '';

  String nomHotel = '';

  void setHotelData(String nombre) {
    this.nomHotel = nombre;
  }
  
  void setHabitacionData(String tipo, double precio,String tipo2 ) {
    this.tipoHabitacion = tipo;
    this.precio = precio;
    this.codHabit = tipo2;
  }

  void setDates(DateTime? start, DateTime? end) {
    startDate.value = start;
    endDate.value = end;
  }
}
