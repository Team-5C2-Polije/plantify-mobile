import 'package:tomato_leaf/domain/repositories/user_repository.dart';

class GetDeviceIdsUseCase {
  final UserRepository repository;

  GetDeviceIdsUseCase(this.repository);

  Future<List<String>?> call() async {
    return await repository.getDeviceIds();
  }
}
