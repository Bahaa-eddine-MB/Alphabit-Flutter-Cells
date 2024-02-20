import 'package:first_session/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialogs {
  static void showLoadingDialog() {
    Get.defaultDialog(
        title: "Loading", content: const CircularProgressIndicator());
  }

  static void showSnackBar(String title, String message, bool isError) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: isError ? Colors.red : AppColors.primary,
        icon: Icon(isError ? Icons.error : Icons.check),
        colorText: Colors.white);
  }
}
