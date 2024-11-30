import 'package:get/get.dart';
import 'package:tomato_leaf/data/datasources/local/user_local_datasource.dart';
import 'package:tomato_leaf/data/datasources/remote/user_remote_datasource.dart';
import 'package:tomato_leaf/data/repositories/user_repository_impl.dart';
import 'package:tomato_leaf/domain/repositories/user_repository.dart';
import 'package:tomato_leaf/domain/usecases/user/get_current_login_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/logout_from_local_usecase.dart';
import 'package:tomato_leaf/feature/profile/presentation/profile/profile_controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {

    // user
    Get.lazyPut<UserLocalDataSource>(() => UserLocalDataSource());
    Get.lazyPut<UserRemoteDataSource>(() => UserRemoteDataSource());
    Get.lazyPut<UserRepository>(() =>
        UserRepositoryImpl(
          authRemoteDataSource: Get.find<UserRemoteDataSource>(),
          authLocalDataSource: Get.find<UserLocalDataSource>(),
        ));
    Get.lazyPut<GetCurrentLoginUseCase>(() => GetCurrentLoginUseCase(Get.find<UserRepository>()));
    Get.lazyPut<LogoutFromLocalUseCase>(() => LogoutFromLocalUseCase(Get.find<UserRepository>()));

    Get.lazyPut(() => ProfileController(
      logoutFromLocalUseCase: Get.find<LogoutFromLocalUseCase>(),
      getCurrentLoginUseCase: Get.find<GetCurrentLoginUseCase>(),
    ));
  }
}