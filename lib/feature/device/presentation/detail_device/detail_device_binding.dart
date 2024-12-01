import 'package:get/get.dart';
import 'package:tomato_leaf/data/datasources/local/device_local_datasource.dart';
import 'package:tomato_leaf/data/datasources/remote/device_remote_datasource.dart';
import 'package:tomato_leaf/data/repositories/device_repository_impl.dart';
import 'package:tomato_leaf/domain/repositories/device_repository.dart';
import 'package:tomato_leaf/domain/usecases/device/detail_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/get_sensor_value_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/get_updated_at_usecase.dart';
import 'package:tomato_leaf/feature/device/presentation/detail_device/detail_device_controller.dart';

class DetailDeviceBinding extends Bindings {
  @override
  void dependencies() {

    // device
    Get.lazyPut<DeviceLocalDataSource>(() => DeviceLocalDataSource());
    Get.lazyPut<DeviceRemoteDataSource>(() => DeviceRemoteDataSource());
    Get.lazyPut<DeviceRepository>(() => DeviceRepositoryImpl(
          deviceLocalDataSource: Get.find<DeviceLocalDataSource>(),
          deviceRemoteDataSource: Get.find<DeviceRemoteDataSource>(),
        ));
    Get.lazyPut<DetailDeviceUseCase>(
        () => DetailDeviceUseCase(Get.find<DeviceRepository>()));
    Get.lazyPut<GetSensorValueUseCase>(
            () => GetSensorValueUseCase(Get.find<DeviceRepository>()));
    Get.lazyPut<GetUpdatedAtUseCase>(
    () => GetUpdatedAtUseCase(Get.find<DeviceRepository>()));

    Get.lazyPut(
      () => DetailDeviceController(
        detailDeviceUseCase: Get.find<DetailDeviceUseCase>(),
        getSensorValueUseCase: Get.find<GetSensorValueUseCase>(),
        getUpdatedAtUseCase: Get.find<GetUpdatedAtUseCase>(),
      ),
    );
  }
}
