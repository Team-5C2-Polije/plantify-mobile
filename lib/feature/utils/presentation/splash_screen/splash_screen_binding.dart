import 'package:get/get.dart';
import 'package:tomato_leaf/data/datasources/local/user_local_datasource.dart';
import 'package:tomato_leaf/data/datasources/remote/user_remote_datasource.dart';
import 'package:tomato_leaf/data/repositories/user_repository_impl.dart';
import 'package:tomato_leaf/domain/repositories/user_repository.dart';
import 'package:tomato_leaf/domain/usecases/user/is_login_usecase.dart';

import 'splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<UserLocalDataSource>(() => UserLocalDataSource());
    Get.lazyPut<UserRemoteDataSource>(() => UserRemoteDataSource());
    Get.lazyPut<UserRepository>(() =>
        UserRepositoryImpl(
          authRemoteDataSource: Get.find<UserRemoteDataSource>(),
          authLocalDataSource: Get.find<UserLocalDataSource>(),
        ));
    Get.lazyPut<IsLoginUseCase>(() => IsLoginUseCase(Get.find<UserRepository>()));

    Get.put(SplashScreenController(
      isLoginUseCase: Get.find<IsLoginUseCase>(),
    ));
  }
}
