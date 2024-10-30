import 'package:get/get.dart';
import 'package:tomato_leaf/feature/sensor/presentation/watering_manually/watering_manually_controller.dart';

class WateringManuallyBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => WateringManuallyController());
  }
}