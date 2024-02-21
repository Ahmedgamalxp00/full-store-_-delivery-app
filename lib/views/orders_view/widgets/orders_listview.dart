import 'package:delivery_app/controllers/order_controller.dart';
import 'package:delivery_app/core/shared/custom_loading1.dart';
import 'package:delivery_app/core/shared/empty_widget.dart';
import 'package:delivery_app/core/utils/request_state.dart';
import 'package:delivery_app/views/orders_view/widgets/orders_listview_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<OrderController>();
    return GetBuilder<OrderController>(builder: (controller) {
      if (controller.requestState == RequestState.loading) {
        return const CustomLoadingWidget1();
      } else if (controller.requestState == RequestState.failure ||
          controller.pendingList.isEmpty) {
        return const CustomEmptyWidget();
      } else {
        return ListView.separated(
          padding:
              const EdgeInsets.only(top: 20, right: 10, left: 20, bottom: 100),
          itemCount: controller.pendingList.length,
          itemBuilder: (context, index) {
            return OrdersListViewItem(order: controller.pendingList[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 10,
            );
          },
        );
      }
    });
  }
}
