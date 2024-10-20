import 'package:get/get.dart';
import 'package:tomato_leaf/feature/utils/presentation/dashboard/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}
