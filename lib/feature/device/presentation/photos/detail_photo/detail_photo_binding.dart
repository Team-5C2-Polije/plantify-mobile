import 'package:get/get.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/detail_photo/detail_photo_controller.dart';

class DetailPhotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailPhotoController());
  }
}
