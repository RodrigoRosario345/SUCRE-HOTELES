// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/config/text_style.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textFieldController;
  final Widget prefix;
  final Widget sufix;
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.textFieldController,
      required this.prefix,
      required this.sufix,
      required Null Function(dynamic value) onChanged,
      required InkWell suffix});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: Get.width,
      child: TextFormField(
        controller: textFieldController,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 14,
            ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 15),
          fillColor: AppTheme.isLightTheme == true
              ? const Color(0xffFAFAFA)
              : const Color(0xff1F222A),
          filled: true,
          hintText: hintText,
          suffixIcon: sufix,
          prefixIcon: prefix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: const Color(0xff9E9E9E),
                fontSize: 14,
              ),
        ),
      ),
    );
  }
}

class CustomField extends StatelessWidget {
  final String hintText;
  final TextEditingController textFieldController;

  final Widget sufix;
  const CustomField(
      {super.key,
      required this.hintText,
      required this.textFieldController,
      required this.sufix});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: Get.width,
      child: TextFormField(
        controller: textFieldController,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 14,
            ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 15, left: 16),
          fillColor: AppTheme.isLightTheme == true
              ? const Color(0xffFAFAFA)
              : const Color(0xff1F222A),
          filled: true,
          hintText: hintText,
          suffixIcon: sufix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: const Color(0xff9E9E9E),
                fontSize: 14,
              ),
        ),
      ),
    );
  }
}
