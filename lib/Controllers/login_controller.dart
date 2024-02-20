import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  bool hidePassword = true;
  String email = "";
  String password = "";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;

  void login() async {
    if (formKey.currentState!.validate()) {
      Get.defaultDialog(
          title: "Loading", content: const CircularProgressIndicator());
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Get.back();
        Get.snackbar("Succecc", "login successfully");
      } catch (e) {
        Get.back();
        Get.snackbar("Error", "Something went wrong",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.error),
            colorText: Colors.white);
      }
    }
  }

  void laod() {
    loading = !loading;
    update();
  }

  void togglePassword() {
    hidePassword = !hidePassword;
    update();
  }
}
