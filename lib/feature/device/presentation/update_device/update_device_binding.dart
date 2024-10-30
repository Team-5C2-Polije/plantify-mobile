import 'package:get/get.dart';
import 'package:tomato_leaf/feature/device/presentation/update_device/update_device_controller.dart';

class UpdateDeviceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateDeviceController());
  }
}
