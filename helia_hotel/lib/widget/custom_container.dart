// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/config/text_style.dart';

class CustomlabelLarge extends StatelessWidget {
  final String text;
  final Color? bgColor;
  final Color? textColor;
  final VoidCallback onTap;
  const CustomlabelLarge(
      {super.key,
      required this.text,
      this.bgColor,
      this.textColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          color: bgColor ?? HexColor(AppTheme.primaryColorString!),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: textColor ?? Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
