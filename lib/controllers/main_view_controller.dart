import 'package:delivery_app/views/accepted_orders_view/accepted_orders_view.dart';
import 'package:delivery_app/views/orders_view/orders_view.dart';
import 'package:delivery_app/views/profile_view/profile_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MainViewController extends GetxController {
  List<Widget> screens = [
    const OrdersView(),
    const AcceptedView(),
    const ProfileView()
  ];
  Widget currentView = const OrdersView();
  int selectedIndx = 0;
  onTabChange(int index) {
    currentView = screens[index];
    selectedIndx = index;
    update();
  }
}
