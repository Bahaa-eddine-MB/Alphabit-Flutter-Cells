import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_session/Model/UserModel.dart';
import 'package:first_session/Screens/login_screen.dart';
import 'package:first_session/Screens/profile_screen.dart';
import 'package:first_session/utils/dialogs.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Services {
  static void signOut() {
    FirebaseAuth.instance.signOut();
    Get.offAll(() => const LoginScreen());
  }

  static void signInWithEmailAndPassword(
    String email,
    String password,
    String firstName,
    String lastName,
    String phone,
  ) async {
    try {
      Dialogs.showLoadingDialog();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'id': FirebaseAuth.instance.currentUser!.uid,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
      });
      Get.back();
      Get.to(()=>const ProfilePage());
    } on FirebaseAuthException catch (e) {
      Get.back();
      if (e.code == 'weak-password') {
        Dialogs.showSnackBar(
            'Error', 'The password provided is too weak.', true);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Dialogs.showSnackBar(
            'Error', 'The account already exists for that email.', true);
        print('The account already exists for that email.');
      }
    } catch (e) {
      Get.back();
      Dialogs.showSnackBar('Error', 'Something went wrong !', true);
      print(e);
    }
  }

  static Future<UserModel> fetchUserData() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    try {
      final documentSnapshot =
          await FirebaseFirestore.instance.collection("Users").doc(uid).get();
      if (documentSnapshot.exists) {
        final user = UserModel.fromJson(documentSnapshot.data()!);
        return user;
      } else {
        Dialogs.showSnackBar('Error', 'Something went wrong !', true);
        return UserModel(firstName: "", lastName: "", email: "");
      }
    } catch (e) {
      Dialogs.showSnackBar('Error', 'Something went wrong !', true);
      return UserModel(firstName: "", lastName: "", email: "");
    }
  }
}
