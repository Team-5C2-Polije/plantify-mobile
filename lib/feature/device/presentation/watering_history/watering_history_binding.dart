import 'package:get/get.dart';
import 'package:tomato_leaf/data/datasources/local/device_local_datasource.dart';
import 'package:tomato_leaf/data/datasources/remote/device_remote_datasource.dart';
import 'package:tomato_leaf/data/repositories/device_repository_impl.dart';
import 'package:tomato_leaf/domain/repositories/device_repository.dart';
import 'package:tomato_leaf/domain/usecases/device/detail_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/get_histories_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/get_updated_at_usecase.dart';

import 'watering_history_controller.dart';

class WateringHistoryBinding extends Bindings {
  @override
  void dependencies() {

    // device
    Get.lazyPut<DeviceLocalDataSource>(() => DeviceLocalDataSource());
    Get.lazyPut<DeviceRemoteDataSource>(() => DeviceRemoteDataSource());
    Get.lazyPut<DeviceRepository>(() => DeviceRepositoryImpl(
      deviceLocalDataSource: Get.find<DeviceLocalDataSource>(),
      deviceRemoteDataSource: Get.find<DeviceRemoteDataSource>(),
    ));
    Get.lazyPut<GetHistoriesUseCase>(() => GetHistoriesUseCase(Get.find<DeviceRepository>()));
    Get.lazyPut<DetailDeviceUseCase>(() => DetailDeviceUseCase(Get.find<DeviceRepository>()));
    Get.lazyPut<GetUpdatedAtUseCase>(() => GetUpdatedAtUseCase(Get.find<DeviceRepository>()));

    Get.lazyPut(() => WateringHistoryController(
      getHistoriesUseCase: Get.find<GetHistoriesUseCase>(),
      detailDeviceUseCase: Get.find<DetailDeviceUseCase>(),
      getUpdatedAtUseCase: Get.find<GetUpdatedAtUseCase>(),
    ));
  }
}
