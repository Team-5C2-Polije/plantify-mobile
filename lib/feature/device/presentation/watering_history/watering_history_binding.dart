import 'package:get/get.dart';

import 'watering_history_controller.dart';

class WateringHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WateringHistoryController());
  }
}
