import 'package:get/get.dart';
import 'package:tomato_leaf/data/datasources/local/user_local_datasource.dart';
import 'package:tomato_leaf/data/datasources/remote/user_remote_datasource.dart';
import 'package:tomato_leaf/data/repositories/user_repository_impl.dart';
import 'package:tomato_leaf/domain/repositories/user_repository.dart';
import 'package:tomato_leaf/domain/usecases/user/add_or_update_user_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/auth_usecase.dart';
import 'package:tomato_leaf/feature/utils/presentation/auth/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserLocalDataSource>(() => UserLocalDataSource());
    Get.lazyPut<UserRemoteDataSource>(() => UserRemoteDataSource());
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(
          authRemoteDataSource: Get.find<UserRemoteDataSource>(),
          authLocalDataSource: Get.find<UserLocalDataSource>(),
        ));
    Get.lazyPut(() => AuthUseCase(Get.find<UserRepository>()));
    Get.lazyPut(() => AddOrUpdateUserUseCase(Get.find<UserRepository>()));

    Get.lazyPut(() => AuthController(
        authUseCase: Get.find<AuthUseCase>(),
        addOrUpdateUserUseCase: Get.find<AddOrUpdateUserUseCase>(),
    ));
  }
}
