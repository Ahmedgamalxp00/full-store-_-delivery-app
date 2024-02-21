import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/app_links.dart';
import 'package:delivery_app/core/errors/failures.dart';
import 'package:delivery_app/core/utils/api_services.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart';

class ArchivedRepo {
  ApiService apiService = Get.find();

  Future<Either<Failure, Map>> archived({
    required String deliveryId,
  }) async {
    try {
      var data = await apiService.post(link: AppLinks.archivedLink, data: {
        "delivery_id": deliveryId,
      });
      if (data['status'] == 'success') {
        return right(data);
      } else {
        return left(ServerFailure(data['massage']));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErorr(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
