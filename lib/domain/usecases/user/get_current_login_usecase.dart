import 'package:tomato_leaf/domain/entities/user/user_entity.dart';
import 'package:tomato_leaf/domain/repositories/user_repository.dart';

class GetCurrentLoginUseCase {
  final UserRepository repository;

  GetCurrentLoginUseCase(this.repository);

  Future<UserEntity?> call() async {
    return await repository.getCurrentLogin();
  }
}
