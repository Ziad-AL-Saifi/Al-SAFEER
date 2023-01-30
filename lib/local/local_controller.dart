import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MylocaControllar extends GetxController {
  void changeLang(String codelang) {
    Locale local = Locale(codelang);
    Get.updateLocale(local);
  }
}
