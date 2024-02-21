import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:delivery_app/core/app_links.dart';
import 'package:delivery_app/core/errors/failures.dart';
import 'package:delivery_app/core/utils/api_services.dart';
import 'package:get/get.dart';

class TestRepo {
  ApiService apiService = Get.find();
  Future<Either<Failure, List>> getAllUsers() async {
    try {
      var data = await apiService.get(link: AppLinks.testLink);

      List users = [];
      users.addAll(data["data"]);

      return right(users);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErorr(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
