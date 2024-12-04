import 'package:get/get.dart';

class PhotoViewerController extends GetxController{

  var urlImage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    urlImage.value = Get.arguments;
  }
}