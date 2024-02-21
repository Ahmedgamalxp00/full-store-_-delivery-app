import 'package:delivery_app/controllers/main_view_controller.dart';
import 'package:delivery_app/core/functions/eixt_app_alert.dart';
import 'package:delivery_app/core/shared/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainViewController());

    return GetBuilder<MainViewController>(
      builder: (controller) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            exitAppAlert();
          },
          child: Scaffold(
            extendBody: true,
            body: controller.currentView,
            bottomNavigationBar: CustomBottmNavBar(
              onTabChange: (index) => controller.onTabChange(index),
              selectedIndx: controller.selectedIndx,
            ),
          ),
        );
      },
    );
  }
}
