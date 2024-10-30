import 'package:get/get.dart';
import 'package:tomato_leaf/feature/profile/presentation/notification/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}
