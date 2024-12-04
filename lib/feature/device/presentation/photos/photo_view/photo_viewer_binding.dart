import 'package:get/get.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/photo_view/photo_viewer_controller.dart';

class PhotoViewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhotoViewerController());
  }
}
