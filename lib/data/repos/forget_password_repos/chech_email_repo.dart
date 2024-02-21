import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:delivery_app/core/app_links.dart';
import 'package:delivery_app/core/errors/failures.dart';
import 'package:delivery_app/core/utils/api_services.dart';
import 'package:get/get.dart';

class CheckEmailRepo {
  ApiService apiService = Get.find();
  Future<Either<Failure, int>> checkEmail({
    required String email,
  }) async {
    try {
      var data = await apiService.post(link: AppLinks.checkEmailLink, data: {
        "email": email,
      });

      if (data['status'] == 'success') {
        return right(1);
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
