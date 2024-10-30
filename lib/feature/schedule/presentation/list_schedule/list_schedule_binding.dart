import 'package:get/get.dart';
import 'package:tomato_leaf/feature/schedule/presentation/list_schedule/list_schedule_controller.dart';

class ListScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListScheduleController());
  }
}
