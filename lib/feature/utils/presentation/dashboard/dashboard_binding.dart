import 'package:get/get.dart';
import 'package:tomato_leaf/data/datasources/local/device_local_datasource.dart';
import 'package:tomato_leaf/data/datasources/local/user_local_datasource.dart';
import 'package:tomato_leaf/data/datasources/remote/device_remote_datasource.dart';
import 'package:tomato_leaf/data/datasources/remote/user_remote_datasource.dart';
import 'package:tomato_leaf/data/repositories/device_repository_impl.dart';
import 'package:tomato_leaf/data/repositories/user_repository_impl.dart';
import 'package:tomato_leaf/domain/repositories/device_repository.dart';
import 'package:tomato_leaf/domain/usecases/device/my_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/add_or_update_user_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/delete_user_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/get_current_login_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/get_device_ids_usecase.dart';
import 'package:tomato_leaf/feature/utils/presentation/dashboard/dashboard_controller.dart';

import '../../../../domain/repositories/user_repository.dart';

class DashboardBinding extends Bindings {
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
    Get.lazyPut<GetDeviceIdsUseCase>(() => GetDeviceIdsUseCase(Get.find<UserRepository>()));
    Get.lazyPut<GetCurrentLoginUseCase>(() => GetCurrentLoginUseCase(Get.find<UserRepository>()));
    Get.lazyPut<DeleteUserDeviceUseCase>(() => DeleteUserDeviceUseCase(Get.find<UserRepository>()));
    Get.lazyPut<AddOrUpdateUserUseCase>(() => AddOrUpdateUserUseCase(Get.find<UserRepository>()));

    // device
    Get.lazyPut<DeviceLocalDataSource>(() => DeviceLocalDataSource());
    Get.lazyPut<DeviceRemoteDataSource>(() => DeviceRemoteDataSource());
    Get.lazyPut<DeviceRepository>(() => DeviceRepositoryImpl(
      deviceLocalDataSource: Get.find<DeviceLocalDataSource>(),
      deviceRemoteDataSource: Get.find<DeviceRemoteDataSource>(),
    ));
    Get.lazyPut<MyDeviceUseCase>(() => MyDeviceUseCase(Get.find<DeviceRepository>()));

    Get.lazyPut(() => DashboardController(
      getCurrentLoginUseCase: Get.find<GetCurrentLoginUseCase>(),
      getDeviceIdsUseCase: Get.find<GetDeviceIdsUseCase>(),
      myDeviceUseCase: Get.find<MyDeviceUseCase>(),
      deleteUserDeviceUseCase: Get.find<DeleteUserDeviceUseCase>(),
      addUserDeviceUseCase: Get.find<AddOrUpdateUserUseCase>(),
    ));
  }
}
