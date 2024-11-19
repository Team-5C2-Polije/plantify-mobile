import 'package:tomato_leaf/domain/entities/user/user_entity.dart';
import 'package:tomato_leaf/domain/repositories/user_repository.dart';

class AddOrUpdateUserUseCase{
  final UserRepository authRepository;

  AddOrUpdateUserUseCase(this.authRepository);

  Future<void> call({required UserEntity user}) async {
    authRepository.addOrUpdateUser(user: user);
  }
}