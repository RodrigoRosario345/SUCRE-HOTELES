import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final controller = TextEditingController().obs;
  RxList<bool> tapList = [true, false, false, false, false].obs;
}
