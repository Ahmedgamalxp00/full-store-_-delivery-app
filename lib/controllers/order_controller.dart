import 'package:delivery_app/core/functions/custom_dialog.dart';
import 'package:delivery_app/core/utils/request_state.dart';
import 'package:delivery_app/data/models/order_model/order_model.dart';
import 'package:delivery_app/data/repos/orders_repo.dart';
import 'package:delivery_app/services/services.dart';

import 'package:get/get.dart';

class OrderController extends GetxController {
  OrderRepo orderRepo = Get.put(OrderRepo());

  RequestState? requestState;
  late String requestError;
  MyServices myServices = Get.find();
  List<OrderModel> ordersList = [];
  List<OrderModel> archivedList = [];
  List<OrderModel> acceptedList = [];
  List<OrderModel> pendingList = [];

  printOrderStatus(String value) {
    if (value == '0') {
      return "Pending approval";
    } else if (value == '1') {
      return "Order being prepared";
    } else if (value == '2') {
      return "order ready for delivery";
    } else if (value == '3') {
      return "Order on the way";
    } else {
      return "Oreder archived";
    }
  }

  viewOrders() async {
    requestState = RequestState.loading;
    update();
    var resulte = await orderRepo.view(
      deliveryId: myServices.sharedPreferences.getString("id") as String,
    );
    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      data['data'].sort((a, b) {
        return DateTime.parse(b['orders_datetime'])
            .compareTo(DateTime.parse(a['orders_datetime']));
      });

      for (var item in data['data']) {
        ordersList.add(OrderModel.fromJson(item));
      }
      for (var item in ordersList) {
        if (item.ordersStatus == 3 &&
            item.ordersDelivery.toString() ==
                "${myServices.sharedPreferences.getString("id")}") {
          acceptedList.add(item);
        }
        if (item.ordersStatus == 2) {
          pendingList.add(item);
        }
      }

      requestState = RequestState.success;
    });
    update();
  }

  archivedOrdersView() async {
    requestState = RequestState.loading;
    update();
    var resulte = await orderRepo.archived(
      deliveryId: myServices.sharedPreferences.getString("id") as String,
    );
    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      // customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      data['data'].sort((a, b) {
        return DateTime.parse(b['orders_datetime'])
            .compareTo(DateTime.parse(a['orders_datetime']));
      });

      for (var item in data['data']) {
        acceptedList.add(OrderModel.fromJson(item));
      }

      requestState = RequestState.success;
    });
    update();
  }

  approveOrder({required String orderId, required String userId}) async {
    requestState = RequestState.loading;
    update();
    var resulte = await orderRepo.approve(
      deliveryId: myServices.sharedPreferences.getString("id") as String,
      orderId: orderId,
      userId: userId,
    );
    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      // customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      requestState = RequestState.success;
      customDialog(title: 'Success', body: 'Order Approved Successfully');
      refreshOrdersView();
    });
    update();
  }

  deliveryDone({required String orderId, required String userId}) async {
    requestState = RequestState.loading;
    update();
    var resulte = await orderRepo.deliveryDone(
      deliveryId: myServices.sharedPreferences.getString("id") as String,
      orderId: orderId,
      userId: userId,
    );
    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      // customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      requestState = RequestState.success;
      customDialog(title: 'Success', body: 'Order Deliverd Successfully');
      refreshOrdersView();
    });
    update();
  }

  refreshOrdersView() {
    ordersList = [];
    pendingList = [];
    acceptedList = [];
    viewOrders();
  }

  @override
  void onInit() {
    viewOrders();
    super.onInit();
  }
}
