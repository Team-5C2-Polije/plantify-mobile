import 'package:dio/dio.dart';
import 'package:tomato_leaf/domain/repositories/user_repository.dart';

class NotificationsUseCase {
  final UserRepository repository;

  NotificationsUseCase(this.repository);

  Future<Response?> call({
    required String email,
  }) async {
    return await repository.notifications(email: email);
  }
}