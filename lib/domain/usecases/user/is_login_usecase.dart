import 'package:tomato_leaf/domain/repositories/user_repository.dart';

class IsLoginUseCase {
  final UserRepository repository;

  IsLoginUseCase(this.repository);

  Future<bool> call() async {
    return await repository.isLogin();
  }
}
