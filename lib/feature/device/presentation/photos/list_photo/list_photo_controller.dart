import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';
import 'package:tomato_leaf/data/models/device/device_model.dart';
import 'package:tomato_leaf/data/models/device/photo_model.dart';
import 'package:tomato_leaf/domain/entities/device/device_entity.dart';
import 'package:tomato_leaf/domain/entities/device/photo_entity.dart';
import 'package:tomato_leaf/domain/usecases/device/detail_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/get_photos_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/get_updated_at_usecase.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/detail_photo/detail_photo_page.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/photo_argument.dart';

class ListPhotoController extends GetxController {
  final DetailDeviceUseCase detailDeviceUseCase;
  final GetUpdatedAtUseCase getUpdatedAtUseCase;
  final GetPhotosUseCase getPhotosUseCase;

  var deviceId = ''.obs;
  var deviceDetail = DeviceEntity().obs;
  var updatedAt = ''.obs;
  var photos = <PhotoEntity>[].obs;
  late StreamSubscription<String> _subUpdatedAt;

  ListPhotoController({
    required this.detailDeviceUseCase,
    required this.getUpdatedAtUseCase,
    required this.getPhotosUseCase,
  });

  @override
  void onInit() async {
    super.onInit();
    deviceId.value = Get.arguments;
    await getDetailDevice();
    await getPhotos();
    // updated at
    _subUpdatedAt =
        getUpdatedAtUseCase(deviceId: deviceId.value).listen((value) {
      updatedAt.value = value;
      LogPrint.debug("~device getUpadatedAt : $value");
    });
  }

  @override
  void onClose() {
    super.onClose();
    _subUpdatedAt.cancel();
  }

  Future<void> getDetailDevice() async {
    try {
      final response = await detailDeviceUseCase(deviceId: deviceId.value);
      Map<String, dynamic> payload = response?.data;

      if (response?.statusCode == HttpStatus.ok) {
        deviceDetail.value = DeviceModel.fromJson(payload['data']).toEntity();
      } else {
        Fluttertoast.showToast(
            msg: "Gagal mendapatakan data Device : ${payload['message']}");
      }
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'getDetailDevice');
    }
  }

  Future<void> getPhotos() async {
    try {
      final response = await getPhotosUseCase(deviceId: deviceId.value);
      Map<String, dynamic> payload = response?.data;

      if (response?.statusCode == HttpStatus.ok) {
        photos.value = PhotoModel.fromListJson(payload['data'])
            .map((e) => e.toEntity())
            .toList();
      } else {
        Fluttertoast.showToast(
            msg: "Gagal mendapatakan photo : ${payload['message']}");
      }
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'getPhotos');
    }
  }

  void goToDetailPhoto(int index) {
    PhotoArgument photoArgument = PhotoArgument(
      deviceId: deviceId.value,
      index: index,
      photos: photos,
    );
    Get.toNamed(
      DetailPhotoPage.routeName.toString(),
      arguments: photoArgument,
    );
  }
}
