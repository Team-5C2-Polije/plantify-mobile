import 'package:get/get.dart';
import 'package:tomato_leaf/feature/device/presentation/watering_manually/watering_manually_controller.dart';

class WateringManuallyBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => WateringManuallyController());
  }
}