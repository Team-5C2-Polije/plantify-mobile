import 'package:get/get.dart';
import 'package:tomato_leaf/feature/sensor/presentation/light_intensity/light_intensity_controller.dart';

class LightIntensityBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LightIntensityController());
  }

}