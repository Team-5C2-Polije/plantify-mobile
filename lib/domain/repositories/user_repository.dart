import 'package:dio/dio.dart';
import 'package:tomato_leaf/domain/entities/user/user_entity.dart';

abstract class UserRepository {

  Future<void> addOrUpdateUser({
    required UserEntity? user,
  });

  Future<Response?> auth({
    required String email,
    required String uid,
    required String fullName,
    required String fcmToken,
  });

  Future<Response?> addDevice({
    required String email,
    required String token,
  });

  Future<Response?> deleteDevice({
    required String email,
    required String deviceId,
  });

  Future<bool> isLogin();

  Future<bool> logoutFromLocal();

  Future<List<String>?> getDeviceIds();

  Future<UserEntity?> getCurrentLogin();

  Future<Response?> notifications({
    required String email,
  });

  Future<Response?> logoutFromApi({
    required String email,
  });
}
