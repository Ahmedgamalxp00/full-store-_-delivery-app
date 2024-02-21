import 'package:delivery_app/controllers/archived_controller.dart';
import 'package:delivery_app/views/archived_orders_view/widgets/archived_orders_listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchivedOrdersView extends StatelessWidget {
  const ArchivedOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchivedController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: const ArchivedOrdersListView(),
    );
  }
}
