import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBar {
  static void showErrorSnackBar(
      {required String message, required String title}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        borderRadius: 8,
        backgroundColor: Colors.black45,
        animationDuration: const Duration(milliseconds: 500),
        barBlur: 10,
        colorText: Colors.white,
        isDismissible: false);
  }
}

/// Snackbar
SnackbarController getSnackBar(title, subtitle, backgroundColor, time) {
  return Get.snackbar(
    title,
    subtitle,
    icon: const Icon(Icons.person, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: backgroundColor,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    colorText: Colors.white,
    duration: Duration(seconds: time ?? 3),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
