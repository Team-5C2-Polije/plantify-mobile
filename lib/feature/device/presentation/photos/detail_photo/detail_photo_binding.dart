import 'package:get/get.dart';
import 'package:tomato_leaf/data/datasources/local/device_local_datasource.dart';
import 'package:tomato_leaf/data/datasources/remote/device_remote_datasource.dart';
import 'package:tomato_leaf/data/repositories/device_repository_impl.dart';
import 'package:tomato_leaf/domain/repositories/device_repository.dart';
import 'package:tomato_leaf/domain/usecases/device/detail_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/get_detail_photo_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/get_histories_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/get_updated_at_usecase.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/detail_photo/detail_photo_controller.dart';

class DetailPhotoBinding extends Bindings {
  @override
  void dependencies() {
    // device
    Get.lazyPut<DeviceLocalDataSource>(() => DeviceLocalDataSource());
    Get.lazyPut<DeviceRemoteDataSource>(() => DeviceRemoteDataSource());
    Get.lazyPut<DeviceRepository>(() => DeviceRepositoryImpl(
      deviceLocalDataSource: Get.find<DeviceLocalDataSource>(),
      deviceRemoteDataSource: Get.find<DeviceRemoteDataSource>(),
    ));
    Get.lazyPut<GetDetailPhotoUseCase>(() => GetDetailPhotoUseCase(Get.find<DeviceRepository>()));

    Get.lazyPut(() => DetailPhotoController(
      getDetailPhotoUseCase: Get.find<GetDetailPhotoUseCase>(),
    ));
  }
}
