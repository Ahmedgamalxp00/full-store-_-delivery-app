import 'package:delivery_app/controllers/order_controller.dart';
import 'package:delivery_app/core/constants.dart';
import 'package:delivery_app/core/utils/app_router.dart';
import 'package:delivery_app/core/utils/app_styles.dart';
import 'package:delivery_app/data/models/order_model/order_model.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrdersListViewItem extends StatelessWidget {
  const OrdersListViewItem({super.key, this.onDeleteTap, required this.order});
  final OrderModel order;
  final void Function()? onDeleteTap;
  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.find();
    String orderPaymentMethod =
        order.oredersPaymentMethod == 0 ? 'Cash' : 'Cards';
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Order Number : ${order.ordersId}',
                style: AppStyles.styleSemiBold18
                    .copyWith(color: kTextColor, height: 2),
              ),
              const Spacer(),
              Text(Jiffy.parse('${order.ordersDatetime}').fromNow(),
                  style:
                      AppStyles.styleSemiBold14.copyWith(color: kPrimeryColor)),
            ],
          ),
          Text(
            'Payment method : $orderPaymentMethod',
            style: AppStyles.styleSemiBold14,
          ),
          // Text(
          //   'Order delivery type : $orderDeliveryType',
          //   style: AppStyles.styleSemiBold14,
          // ),
          Text(
            'Order price : ${order.ordersPrice} \$',
            style: AppStyles.styleSemiBold14,
          ),
          Text(
            'order discount :  ${order.ordersDiscount} %',
            style: AppStyles.styleSemiBold14,
          ),
          Text(
            'Delivery price :  ${order.ordersDeliveryPrice} \$',
            style: AppStyles.styleSemiBold14,
          ),
          // Text(
          //   'Order status :  ${orderController.printOrderStatus('${order.ordersStatus}')}',
          //   style: AppStyles.styleSemiBold14,
          // ),
          const Divider(),
          Text(
            'Total Price : ${order.ordersTotalprice} \$',
            style: AppStyles.styleSemiBold18.copyWith(color: kPrimeryColor),
          ),
          const Divider(),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                color: kPrimeryColor,
                onPressed: () {
                  Get.toNamed(AppRoute.ordersDetailsView,
                      arguments: {"order": order});
                },
                child: Text(
                  'Details',
                  style:
                      AppStyles.styleSemiBold18.copyWith(color: Colors.white),
                ),
              ),
              if (order.ordersStatus == 2)
                MaterialButton(
                  color: kPrimeryColor,
                  onPressed: () async {
                    await orderController.approveOrder(
                        orderId: '${order.ordersId}',
                        userId: "${order.ordersUsersid}");
                  },
                  child: Text(
                    'Approve',
                    style:
                        AppStyles.styleSemiBold18.copyWith(color: Colors.white),
                  ),
                ),
              if (order.ordersStatus == 3)
                MaterialButton(
                  color: kPrimeryColor,
                  onPressed: () async {
                    await orderController.deliveryDone(
                        orderId: '${order.ordersId}',
                        userId: "${order.ordersUsersid}");
                  },
                  child: Text(
                    'Delivery Done',
                    style:
                        AppStyles.styleSemiBold18.copyWith(color: Colors.white),
                  ),
                ),
            ],
          )
        ],
      ),
    ));
  }
}
