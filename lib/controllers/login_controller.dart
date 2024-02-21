import 'package:delivery_app/core/functions/custom_dialog.dart';
import 'package:delivery_app/core/utils/app_router.dart';
import 'package:delivery_app/core/utils/request_state.dart';
import 'package:delivery_app/data/repos/auth_repos/login_repo.dart';
import 'package:delivery_app/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginRepo loginRepo = Get.put(LoginRepo());
  GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  bool isScure = false;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  RequestState? requestState;
  late String requestError;
  MyServices myServices = Get.find();

  login() async {
    if (loginformKey.currentState!.validate()) {
      loginformKey.currentState!.save();
      requestState = RequestState.loading;
      update();
      var resulte = await loginRepo.login(
        email: emailController.text,
        password: passwordController.text,
      );

      resulte.fold((failure) {
        requestError = failure.erorrMassage;
        requestState = RequestState.failure;
        customDialog(title: 'Error', body: failure.erorrMassage);
      }, (data) {
        if (data['data']['delivery_approve'] == 1) {
          myServices.sharedPreferences
              .setString("id", '${data['data']['delivery_id']}');
          myServices.sharedPreferences
              .setString("name", data['data']['delivery_name']);
          myServices.sharedPreferences
              .setString("email", data['data']['delivery_email']);
          myServices.sharedPreferences
              .setString("phone", data['data']['delivery_phone']);
          myServices.sharedPreferences.setString("step", "2");
          String userId = myServices.sharedPreferences.getString("id")!;
          FirebaseMessaging.instance.subscribeToTopic("delivery");
          FirebaseMessaging.instance.subscribeToTopic("delivery$userId");
          requestState = RequestState.success;
          Get.offAllNamed(AppRoute.mainView);
        } else {
          Get.toNamed(AppRoute.otpView,
              arguments: {"email": emailController.text});
        }
      });
      update();
    }
  }

  chanePassVisibility() {
    isScure = !isScure;
    update();
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print(value);
    // });
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
