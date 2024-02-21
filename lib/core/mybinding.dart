import 'package:delivery_app/core/utils/api_services.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => SignUpController(), fenix: true);
    Get.put(Dio());
    Get.put(ApiService());
    // Get.put(MainViewController());
  }
}
