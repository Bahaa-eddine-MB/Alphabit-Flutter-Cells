import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_session/Model/UserModel.dart';
import 'package:first_session/service/services.dart';
import 'package:first_session/utils/dialogs.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  late UserModel userModel;
  bool loading = true;
  void setLoading(bool value) {
    loading = value;
    update();
  }

  void fetchDate() async {
    try {
      final documentSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      if (documentSnapshot.exists) {
        setLoading(false);

        userModel = UserModel.fromJson(documentSnapshot.data()!);
      } else {
        setLoading(false);
        Dialogs.showSnackBar('Error', "User doesn't exist!", true);
      }
    } catch (e) {
      setLoading(false);

      Dialogs.showSnackBar('Error', 'Something went wrong !', true);
    }
    userModel = Services.fetchUserData() as UserModel;
  }

  @override
  void onInit() {
    fetchDate();
    super.onInit();
  }
}
