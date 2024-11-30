import 'package:tomato_leaf/data/datasources/local/user_local_datasource.dart';
import 'package:tomato_leaf/data/datasources/remote/user_remote_datasource.dart';
import 'package:tomato_leaf/domain/entities/user/user_entity.dart';
import 'package:tomato_leaf/domain/repositories/user_repository.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository{

  final UserRemoteDataSource authRemoteDataSource;
  final UserLocalDataSource authLocalDataSource;

  UserRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<void> addOrUpdateUser({required UserEntity? user}) async {
    await authLocalDataSource.addOrUpdateUser(user);
  }

  @override
  Future<Response?> auth({
    required String email,
    required String uid,
    required String fullName,
    required String fcmToken,
  }) {
    return authRemoteDataSource.auth(
      email: email,
      uid: uid,
      fullName: fullName,
      fcmToken: fcmToken,
    );
  }

  @override
  Future<Response?> addDevice({
    required String email,
    required String token,
  }) async {
    return await authRemoteDataSource.addDevice(
      email: email,
      token: token,
    );
  }

  @override
  Future<Response?> deleteDevice({
    required String email,
    required String deviceId,
  }) async {
    return await authRemoteDataSource.deleteDevice(
      email: email,
      deviceId: deviceId,
    );
  }

  @override
  Future<List<String>?> getDeviceIds() async{
    return await authLocalDataSource.getDeviceIds();
  }

  @override
  Future<bool> isLogin() async{
    return await authLocalDataSource.isLogin();
  }

  @override
  Future<bool> logoutFromLocal() async{
    return await authLocalDataSource.logoutFromLocal();
  }

  @override
  Future<UserEntity?> getCurrentLogin() async {
    return await authLocalDataSource.getCurrentLogin();
  }
}