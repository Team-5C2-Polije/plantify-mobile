import 'package:tomato_leaf/domain/repositories/user_repository.dart';
import 'package:dio/dio.dart';

class AuthUseCase {
  final UserRepository repository;

  AuthUseCase(this.repository);

  Future<Response?> call({
    required String email,
    required String uid,
    required String fullName,
    required String fcmToken,
  }) async {
    return await repository.auth(
      email: email,
      uid: uid,
      fullName: fullName,
      fcmToken: fcmToken,
    );
  }
}
