import 'package:delivery_app/core/utils/app_router.dart';
import 'package:delivery_app/services/services.dart';

import 'package:get/get.dart';

class ProfileController extends GetxController {
  MyServices myServices = Get.find();
  String? deliveryId;
  String? deliveryEmail;

  logOut() {
    // String userId = myServices.sharedPreferences.getString("id")!;
    // FirebaseMessaging.instance.unsubscribeFromTopic("users");
    // FirebaseMessaging.instance.unsubscribeFromTopic("users$userId");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.loginView);
  }

  @override
  void onInit() {
    deliveryId = myServices.sharedPreferences.getString("id")!;
    deliveryEmail = myServices.sharedPreferences.getString("email")!;

    super.onInit();
  }
}
