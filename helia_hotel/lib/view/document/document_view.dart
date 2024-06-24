// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel/config/images.dart';
import 'package:hotel/config/text_style.dart';
import 'package:hotel/controller/document_controller.dart';
import 'package:hotel/view/document/canceled_view.dart';
import 'package:hotel/view/document/completed_view.dart';
import 'package:hotel/view/document/ongoing_view.dart';

class DocumentView extends StatefulWidget {
  const DocumentView({super.key});

  @override
  State<DocumentView> createState() => _DocumentViewState();
}

class _DocumentViewState extends State<DocumentView> {
  final documentController = Get.put(DocumentController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 20),
          Row(
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
                "Mis Reservas",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const Expanded(child: SizedBox()),
              SizedBox(
                height: 28,
                width: 28,
                child: SvgPicture.asset(
                  DefaultImages.search,
                  fit: BoxFit.fill,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          GetX<DocumentController>(
            init: documentController,
            builder: (documentController) => Row(
              children: [
                tapCard(
                  "En curso",
                  documentController.isDocument.value == 0
                      ? HexColor(AppTheme.primaryColorString!)
                      : Colors.transparent,
                  () {
                    documentController.isDocument.value = 0;
                  },
                ),
                const SizedBox(width: 14),
                tapCard(
                  "Completado",
                  documentController.isDocument.value == 1
                      ? HexColor(AppTheme.primaryColorString!)
                      : Colors.transparent,
                  () {
                    documentController.isDocument.value = 1;
                  },
                ),
                const SizedBox(width: 14),
                tapCard(
                  "Cancelado",
                  documentController.isDocument.value == 2
                      ? HexColor(AppTheme.primaryColorString!)
                      : Colors.transparent,
                  () {
                    documentController.isDocument.value = 2;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GetX<DocumentController>(
            init: documentController,
            builder: (documentController) =>
                documentController.isDocument.value == 0
                    ? const OnGoingView()
                    : documentController.isDocument.value == 1
                        ? const CompletedView()
                        : const CanceledView(),
          ),
        ],
      ),
    );
  }

  Widget tapCard(String text, Color bgColor, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: HexColor(AppTheme.primaryColorString!),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 15,
                    color: bgColor == Colors.transparent
                        ? HexColor(AppTheme.primaryColorString!)
                        : Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
