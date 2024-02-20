import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_session/Screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  Timer? timer;
  @override
  void initState() {
    FirebaseAuth.instance.currentUser!.sendEmailVerification();
    timer = Timer.periodic(const Duration(seconds: 4), (_) async {
      await FirebaseAuth.instance.currentUser!.reload();
      bool result = FirebaseAuth.instance.currentUser!.emailVerified;
      if (result) {
        Get.offAll(() => const ProfilePage());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('We have sent you a verification email !'),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.currentUser!.sendEmailVerification();
                },
                child: const Text("Resend email "))
          ],
        ),
      ),
    );
  }
}
