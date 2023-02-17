import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowSnackBar {
  static snackError(
      {required String title,
      required String sub,
      SnackPosition position = SnackPosition.BOTTOM}) {
    Get.snackbar(title, sub,
        shouldIconPulse: true,
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
        duration: const Duration(seconds: 3),
        overlayColor: Colors.red,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        colorText: Colors.red,
        forwardAnimationCurve: Curves.elasticInOut,
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING);
  }

  static snackSuccess(
      {required String title,
      required String sub,
      SnackPosition position = SnackPosition.BOTTOM}) {
    Get.snackbar(title, sub,
        shouldIconPulse: true,
        icon: const Icon(
          Icons.check,
          color: Colors.blue,
        ),
        duration: const Duration(seconds: 3),
        overlayColor: Colors.green,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        colorText: Colors.blue,
        forwardAnimationCurve: Curves.elasticInOut,
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING);
  }
}
