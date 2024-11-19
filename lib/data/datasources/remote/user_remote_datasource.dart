import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:tomato_leaf/core/services/dio_service.dart';
import 'package:tomato_leaf/core/utils/api_constant.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';

class UserRemoteDataSource{
  final DioService dioService = Get.find<DioService>();

  Future<dio.Response?> auth({
    required String email,
    required String uid,
    required String fullName,
    required String fcmToken,
  }) async {
    try {
      return await dioService.dio.post(
        ApiConstant.authEndpoint,
        data: {
          "email": email,
          "uid": uid,
          "fullname": fullName,
          "fcmToken": fcmToken,
        },
      );
    } on DioException catch (ex, s) {
      LogPrint.exception(ex, s, this, 'auth');
      return null;
    }
  }
}