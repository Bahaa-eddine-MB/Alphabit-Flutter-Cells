import 'package:first_session/Controllers/login_controller.dart';
import 'package:first_session/Controllers/register_controller.dart';
import 'package:first_session/Widget/text_widgets.dart';
import 'package:first_session/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: registerController.formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                Image.asset(
                  "assets/images/logo.png",
                  height: 80,
                  width: 80,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget.appTitle("Welcome to Lafyuu"),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Create an account to continue",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.accent),
                ),
                const SizedBox(
                  height: 35,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field is required";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    registerController.firstName = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide:
                            BorderSide(color: AppColors.background, width: 2)),
                    hintText: "Your First name",
                    prefixIcon: ImageIcon(Svg('assets/icons/Message.svg'),
                        color: AppColors.accent),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field is required";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    registerController.lastName = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide:
                            BorderSide(color: AppColors.background, width: 2)),
                    hintText: "Your Last name",
                    prefixIcon: ImageIcon(Svg('assets/icons/Message.svg'),
                        color: AppColors.accent),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  validator: (value) {
                    if (!RegExp(
                            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                        .hasMatch(value!)) {
                      return 'wrong email format';
                    }
                    if (value.isEmpty) {
                      return "Email is required";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    registerController.email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide:
                            BorderSide(color: AppColors.background, width: 2)),
                    hintText: "Your Email",
                    prefixIcon: ImageIcon(Svg('assets/icons/Message.svg'),
                        color: AppColors.accent),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                GetBuilder<RegisterController>(builder: (context) {
                  return TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password is required";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      registerController.password = value;
                    },
                    obscureText: registerController.hidePassword,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: AppColors.background, width: 2)),
                      hintText: "Your password",
                      suffixIcon: IconButton(
                          onPressed: () {
                            registerController.togglePassword();
                          },
                          icon: Icon(
                            registerController.hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.accent,
                          )),
                      prefixIcon: const ImageIcon(
                          Svg('assets/icons/Password.svg'),
                          color: AppColors.accent),
                    ),
                  );
                }),
                const SizedBox(
                  height: 25,
                ),
                GetBuilder<RegisterController>(builder: (context) {
                  return TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password is required";
                      }
                      if (value != registerController.password) {
                        return "Wrong password";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      registerController.confirmPassword = value;
                    },
                    obscureText: registerController.hidePassword,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: AppColors.background, width: 2)),
                      hintText: "Confirm Your password",
                      suffixIcon: IconButton(
                          onPressed: () {
                            registerController.togglePassword();
                          },
                          icon: Icon(
                            registerController.hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.accent,
                          )),
                      prefixIcon: const ImageIcon(
                          Svg('assets/icons/Password.svg'),
                          color: AppColors.accent),
                    ),
                  );
                }),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {
                          registerController.register();
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 18),
                          child: Text("Sign up"),
                        ))),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    "Go back to login",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
