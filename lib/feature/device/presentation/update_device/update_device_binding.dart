import 'package:get/get.dart';
import 'package:tomato_leaf/data/datasources/local/device_local_datasource.dart';
import 'package:tomato_leaf/data/datasources/local/user_local_datasource.dart';
import 'package:tomato_leaf/data/datasources/remote/device_remote_datasource.dart';
import 'package:tomato_leaf/data/datasources/remote/user_remote_datasource.dart';
import 'package:tomato_leaf/data/repositories/device_repository_impl.dart';
import 'package:tomato_leaf/data/repositories/user_repository_impl.dart';
import 'package:tomato_leaf/domain/repositories/device_repository.dart';
import 'package:tomato_leaf/domain/repositories/user_repository.dart';
import 'package:tomato_leaf/domain/usecases/device/update_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/add_or_update_user_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/add_user_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/get_current_login_usecase.dart';
import 'package:tomato_leaf/feature/device/presentation/update_device/update_device_controller.dart';

class UpdateDeviceBinding extends Bindings {
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
    Get.lazyPut<AddOrUpdateUserUseCase>(() => AddOrUpdateUserUseCase(Get.find<UserRepository>()));
    Get.lazyPut<AddUserDeviceUseCase>(() => AddUserDeviceUseCase(Get.find<UserRepository>()));
    Get.lazyPut<GetCurrentLoginUseCase>(() => GetCurrentLoginUseCase(Get.find<UserRepository>()));

    // device
    Get.lazyPut<DeviceLocalDataSource>(() => DeviceLocalDataSource());
    Get.lazyPut<DeviceRemoteDataSource>(() => DeviceRemoteDataSource());
    Get.lazyPut<DeviceRepository>(() => DeviceRepositoryImpl(
      deviceLocalDataSource: Get.find<DeviceLocalDataSource>(),
      deviceRemoteDataSource: Get.find<DeviceRemoteDataSource>(),
    ));
    Get.lazyPut<UpdateDeviceUseCase>(() => UpdateDeviceUseCase(Get.find<DeviceRepository>()));

    Get.lazyPut(() => UpdateDeviceController(
      addOrUpdateUserUseCase: Get.find<AddOrUpdateUserUseCase>(),
      getCurrentLoginUseCase: Get.find<GetCurrentLoginUseCase>(),
      addUserDeviceUseCase: Get.find<AddUserDeviceUseCase>(),
      updateDeviceController: Get.find<UpdateDeviceUseCase>(),
    ));
  }
}
