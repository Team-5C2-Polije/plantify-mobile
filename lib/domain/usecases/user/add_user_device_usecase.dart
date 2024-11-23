import 'package:dio/dio.dart';
import 'package:tomato_leaf/domain/repositories/user_repository.dart';

class AddUserDeviceUseCase{

  final UserRepository repository;

  AddUserDeviceUseCase(this.repository);

  Future<Response?> call({
    required String email,
    required String token,
  }) async {
    return await repository.addDevice(
      email: email,
      token: token,
    );
  }
}