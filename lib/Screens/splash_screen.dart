import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_session/Screens/login_screen.dart';
import 'package:first_session/Screens/profile_screen.dart';
import 'package:first_session/Screens/verify_email.dart';
import 'package:first_session/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      initialScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset('assets/images/white-logo.png'),
      ),
    );
  }
}

void initialScreen() {
  if (FirebaseAuth.instance.currentUser != null) {
    if (FirebaseAuth.instance.currentUser!.emailVerified == false) {
      Get.to(() => const VerifyEmail(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 500));
    } else {
      Get.to(() => const ProfilePage(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 500));
    }
  } else {
    Get.to(() => const LoginScreen(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 500));
  }
}
