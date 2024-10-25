import 'package:get/get.dart';
import 'package:tomato_leaf/feature/sensor/presentation/volume/volume_controller.dart';

class VolumeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => VolumeController());
  }
}