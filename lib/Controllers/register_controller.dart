import 'package:first_session/service/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  bool hidePassword = true;
  String email = "";
  String password = "";
  String confirmPassword = "";
  String firstName = "";
  String lastName = "";
  String phone = "";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;

  void register() async {
    if (formKey.currentState!.validate()) {
      Services.signInWithEmailAndPassword(email, password,firstName,lastName,phone);
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
