import 'package:delivery_app/core/utils/request_state.dart';
import 'package:delivery_app/data/models/order_model/order_model.dart';
import 'package:delivery_app/data/repos/archived_repo.dart';
import 'package:delivery_app/services/services.dart';

import 'package:get/get.dart';

class ArchivedController extends GetxController {
  ArchivedRepo archivedRepo = Get.put(ArchivedRepo());

  RequestState? requestState;
  late String requestError;
  MyServices myServices = Get.find();

  List<OrderModel> archivedList = [];

  archivedOrdersView() async {
    requestState = RequestState.loading;
    update();
    var resulte = await archivedRepo.archived(
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
        archivedList.add(OrderModel.fromJson(item));
      }

      requestState = RequestState.success;
    });
    update();
  }

  @override
  void onInit() {
    archivedOrdersView();
    super.onInit();
  }
}
