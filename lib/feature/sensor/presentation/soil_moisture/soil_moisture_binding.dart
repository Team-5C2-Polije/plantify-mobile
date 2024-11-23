import 'package:get/get.dart';
import 'package:tomato_leaf/feature/sensor/presentation/soil_moisture/soil_moisture_controller.dart';

class SoilMoistureBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SoilMoistureController());
  }
}