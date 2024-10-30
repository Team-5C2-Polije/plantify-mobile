import 'package:get/get.dart';
import 'package:tomato_leaf/feature/profile/presentation/profile/profile_controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}