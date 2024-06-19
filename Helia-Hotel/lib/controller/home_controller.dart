import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  RxInt flag = 0.obs;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  RxInt recently = 0.obs;
  RxList<bool> tapList = [true, true, false, false, false].obs;
}
