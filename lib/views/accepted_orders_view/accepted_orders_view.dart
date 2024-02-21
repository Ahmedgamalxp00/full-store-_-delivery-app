import 'package:delivery_app/controllers/order_controller.dart';
import 'package:delivery_app/views/accepted_orders_view/widgets/accepted_orders_listview.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AcceptedView extends StatelessWidget {
  const AcceptedView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accepted Orders'),
      ),
      body: const AcceptedListView(),
    );
  }
}
