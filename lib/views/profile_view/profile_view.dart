import 'package:delivery_app/controllers/profile_controller.dart';
import 'package:delivery_app/core/functions/eixt_app_alert.dart';
import 'package:delivery_app/views/profile_view/widgets/profile_list.dart';
import 'package:delivery_app/views/profile_view/widgets/user_info.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'widgets/profile_picture.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        exitAppAlert();
      },
      child: const Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfilePicture(),
                UserInfo(),
                ProfileList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
