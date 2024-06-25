// file: confirm_payment_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/controller/date_controller.dart'; // Importa el controlador
import 'package:hotel/view/search/ticket_screen.dart';
import 'package:hotel/view/tab_screen.dart';
import 'package:hotel/widget/card_view.dart';
import 'package:hotel/widget/custom_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel/controller/auth_controller.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';

class ConfirmPaymentScreen extends StatefulWidget {
  const ConfirmPaymentScreen({super.key});
  @override
  State<ConfirmPaymentScreen> createState() => _ConfirmPaymentScreenState();
}

class _ConfirmPaymentScreenState extends State<ConfirmPaymentScreen> {
  final DateController dateController =
      Get.find<DateController>(); // Encuentra el controlador existente
  final AuthController authController = Get.find<AuthController>();

  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  String? nombre;
  String? userId;
  String? apellidos;
  String? email;
  String? cel;
  String fechaReserva = DateFormat('MM/dd/yyyy').format(DateTime.now());

  _saveReservationToFirebase() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DatabaseReference reservasRef =
            FirebaseDatabase.instance.ref().child('reservas').push();

        await reservasRef.set({
          "userId": user.email,
          "codHabitacion": dateController.codHabit,
          "fecha_inicio": _formatDate(dateController.startDate.value),
          "fecha_final": _formatDate(dateController.endDate.value),
          "impuesto": _calculateTax().toStringAsFixed(2),
          "precio_total": _calculateGrandTotal().toStringAsFixed(2),
        });

        print("Reserva guardada exitosamente en Firebase.");
      } else {
        print("Usuario no autenticado.");
      }
    } catch (error) {
      print("Error al guardar la reserva en Firebase: $error");
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return "Seleccione";
    return "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";
  }

  int _calculateDifferenceInDays(DateTime start, DateTime end) {
    final difference = end.difference(start).inDays;
    return difference;
  }

  double _calculateTotalPrice() {
    // Asumiendo que dateController.precio es el precio por noche
    final nights = _calculateDifferenceInDays(
        dateController.startDate.value!, dateController.endDate.value!);
    final totalPrice = nights * dateController.precio;
    return totalPrice;
  }

  double _calculateTax() {
    // Calcula el 10% del precio total
    final totalPrice = _calculateTotalPrice();
    final tax = totalPrice * 0.1; // 10% del precio total
    return tax;
  }

  double _calculateGrandTotal() {
    // Suma el total y el impuesto
    final grandTotal = _calculateTotalPrice() + _calculateTax();
    return grandTotal;
  }

  @override
  void initState() {
    super.initState();
    _initializeUserData();
  }

  _initializeUserData() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      final userInfo = await authController.getUserInfo(userId);
      if (userInfo != null) {
        setState(() {
          nombre = userInfo['nombre'];
          apellidos = userInfo['apellidos'];
          email = userInfo['email'];
          cel = userInfo['celular'];
        });
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
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
          "Payment",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CardView(),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: AppTheme.isLightTheme == true
                              ? Colors.white
                              : const Color(0xff1F222A),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff04060F).withOpacity(0.05),
                              blurRadius: 8,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Fecha inicio",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 16,
                                              ),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "Fecha final",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 16,
                                              ),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "Habitacion",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 16,
                                              ),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Obx(() => Text(
                                              _formatDate(dateController
                                                  .startDate.value),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(fontSize: 16),
                                            )),
                                        const SizedBox(height: 20),
                                        Obx(() => Text(
                                              _formatDate(
                                                  dateController.endDate.value),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(fontSize: 16),
                                            )),
                                        const SizedBox(height: 20),
                                        Text(
                                          "${dateController.tipoHabitacion}", // Puedes cambiarlo a una variable dinámica si es necesario
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 16),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: AppTheme.isLightTheme == true
                              ? Colors.white
                              : const Color(0xff1F222A),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff04060F).withOpacity(0.05),
                              blurRadius: 8,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${_calculateDifferenceInDays(dateController.startDate.value!, dateController.endDate.value!)} Noches",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 16,
                                              ),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "Impuestos y Pagos (10%)",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 16,
                                              ),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "Total",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 16,
                                              ),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${_calculateTotalPrice().toStringAsFixed(2)} Bs.",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 16),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "${_calculateTax().toStringAsFixed(2)} Bs.",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 16),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "${_calculateGrandTotal().toStringAsFixed(2)} Bs.",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 16),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 80,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: AppTheme.isLightTheme == true
                              ? Colors.white
                              : const Color(0xff1F222A),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff04060F).withOpacity(0.05),
                              blurRadius: 8,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            children: [
                              Container(
                                height: 32,
                                width: 32,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      DefaultImages.card,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Text(
                                "•••• •••• •••• •••• 4679",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 10,
                                    ),
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                "Cambiar",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 13,
                                      color: HexColor(
                                          AppTheme.primaryColorString!),
                                    ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ],
              ),
            ),
            CustomlabelLarge(
              text: "Confirmar pago",
              onTap: () {
                _saveReservationToFirebase();
                Get.dialog(
                  AlertDialog(
                    backgroundColor: AppTheme.isLightTheme == true
                        ? Colors.white
                        : const Color(0xff1F222A),
                    contentPadding: EdgeInsets.zero,
                    titlePadding: EdgeInsets.zero,
                    actionsPadding: EdgeInsets.zero,
                    insetPadding: const EdgeInsets.only(left: 30, right: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    content: Container(
                      height: 465,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: AppTheme.isLightTheme == true
                            ? Colors.white
                            : const Color(0xff1F222A),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 180,
                            width: 185,
                            child: Image.asset(
                              DefaultImages.p3,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Pago Exitoso!",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: HexColor(AppTheme.primaryColorString!),
                                ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Pago realizado con éxito en\nhoteles Sucre",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 14,
                                      height: 1.6,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          CustomlabelLarge(
                            text: "Ver boleto",
                            onTap: () {
                              Get.to(
                                const TicketScreen(),
                                transition: Transition.rightToLeft,
                              );
                            },
                          ),
                          const SizedBox(height: 12),
                          CustomlabelLarge(
                            text: "Volver al inicio",
                            onTap: () {
                              Get.offAll(
                                () => const TabScreen(),
                                transition: Transition.rightToLeft,
                              );
                            },
                            bgColor: AppTheme.isLightTheme == true
                                ? HexColor(AppTheme.primaryColorString!)
                                    .withOpacity(0.1)
                                : Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color!
                                    .withOpacity(0.1),
                            textColor: AppTheme.isLightTheme == true
                                ? HexColor(AppTheme.primaryColorString!)
                                : Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
