import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool isDark = false.obs; //es un observador
  RxBool isNotify = true.obs;
  RxBool isSound = false.obs;
  RxBool isVibrate = false.obs;
  RxBool isApp = true.obs;
  RxBool isService = false.obs;
  RxBool isTips = false.obs;
  RxBool isFace = false.obs;
  RxBool isRemember = true.obs;
  RxBool isTouch = true.obs;
}
