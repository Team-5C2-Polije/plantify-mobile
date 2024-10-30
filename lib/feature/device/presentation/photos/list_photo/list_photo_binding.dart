import 'package:get/get.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/list_photo/list_photo_controller.dart';

class ListPhotoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ListPhotoController());
  }
}