import 'package:get/get.dart';
import 'package:tomato_leaf/feature/sensor/presentation/watering_history/watering_history_controller.dart';

class WateringHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WateringHistoryController());
  }
}
