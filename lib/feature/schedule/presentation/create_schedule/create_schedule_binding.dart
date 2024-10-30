import 'package:get/get.dart';
import 'package:tomato_leaf/feature/schedule/presentation/create_schedule/create_schedule_controller.dart';

class CreateScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateScheduleController());
  }
}
