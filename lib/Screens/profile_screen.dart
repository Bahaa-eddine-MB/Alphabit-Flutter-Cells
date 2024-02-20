import 'package:first_session/Controllers/profile_controller.dart';
import 'package:first_session/Widget/custom_listTile.dart';
import 'package:first_session/service/services.dart';
import 'package:first_session/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.primary,
        child: Center(
            child: ElevatedButton(
          child: const Text("Sign out"),
          onPressed: () {
            Services.signOut();
          },
        )),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: AppColors.primary,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "My profile",
          style: TextStyle(color: AppColors.primary),
        ),
      ),
      body: GetBuilder<ProfileController>(builder: (context) {
        if (profileController.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.primary),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${profileController.userModel.firstName} ${profileController.userModel.lastName}",
                        style: const TextStyle(
                            color: AppColors.primary, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      Text(profileController.userModel.email),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              customListTile("First name", Icons.person, "profile"),
              customListTile("First name", Icons.person, "profile"),
              customListTile("First name", Icons.person, "profile"),
              customListTile("First name", Icons.person, "profile"),
              customListTile("First name", Icons.person, "profile"),
            ],
          );
        }
      }),
    );
  }
}
