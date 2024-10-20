import 'package:get/get.dart';
import 'package:tomato_leaf/feature/utils/presentation/auth/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
