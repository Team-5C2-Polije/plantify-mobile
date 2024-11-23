import 'package:dio/dio.dart';
import 'package:tomato_leaf/domain/repositories/user_repository.dart';

class DeleteUserDeviceUseCase {
  final UserRepository repository;

  DeleteUserDeviceUseCase(this.repository);

  Future<Response?> call({
    required String email,
    required String deviceId,
  }) async {
    return await repository.deleteDevice(
      email: email,
      deviceId: deviceId,
    );
  }
}