import 'package:tomato_leaf/domain/repositories/user_repository.dart';

class LogoutFromLocalUseCase {
  final UserRepository repository;

  LogoutFromLocalUseCase(this.repository);

  Future<bool> call() async {
    return await repository.logoutFromLocal();
  }
}
