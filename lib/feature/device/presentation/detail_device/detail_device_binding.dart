import 'package:get/get.dart';
import 'package:tomato_leaf/feature/device/presentation/detail_device/detail_device_controller.dart';

class DetailDeviceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DetailDeviceController(),
    );
  }
}
