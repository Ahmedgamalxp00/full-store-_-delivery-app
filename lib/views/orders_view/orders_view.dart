import 'package:delivery_app/controllers/order_controller.dart';
import 'package:delivery_app/views/orders_view/widgets/orders_listview.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: const OrdersListView(),
    );
  }
}
