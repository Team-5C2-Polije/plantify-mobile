import 'package:dio/dio.dart';
import 'package:tomato_leaf/domain/repositories/user_repository.dart';

class LogoutFromApiUseCase {
  final UserRepository repository;

  LogoutFromApiUseCase(this.repository);

  Future<Response?> call({required String email}) async {
    return await repository.logoutFromApi(email: email);
  }
}
