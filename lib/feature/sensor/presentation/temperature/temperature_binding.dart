import 'package:get/get.dart';
import 'package:tomato_leaf/feature/sensor/presentation/temperature/temperature_controller.dart';

class TemperatureBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TemperatureController());
  }
}