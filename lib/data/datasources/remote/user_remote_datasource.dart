import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:tomato_leaf/core/services/dio_service.dart';
import 'package:tomato_leaf/core/utils/api_constant.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';

class UserRemoteDataSource{
  final DioService _dioService = Get.find<DioService>();

  Future<dio.Response?> auth({
    required String email,
    required String uid,
    required String fullName,
    required String fcmToken,
  }) async {
    try {
      return await _dioService.dio.post(
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

  Future<dio.Response?> addDevice({
    required String email,
    required String token,
  }) async {
    try {
      return await _dioService.dio.post(
        ApiConstant.addUserDeviceEndpoint,
        data: {
          "email": email,
          "token": token,
        },
      );
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'addDevice');
      return null;
    }
  }

  Future<dio.Response?> deleteDevice({
    required String email,
    required String deviceId,
  }) async {
    try {
      return await _dioService.dio.post(
        ApiConstant.deleteUserDeviceEndpoint,
        data: {
          "email": email,
          "device_id": deviceId,
        },
      );
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'deleteDevice');
      return null;
    }
  }
}