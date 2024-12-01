import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';
import 'package:tomato_leaf/data/models/device/photo_model.dart';
import 'package:tomato_leaf/domain/entities/device/photo_entity.dart';
import 'package:tomato_leaf/domain/usecases/device/get_detail_photo_usecase.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/photo_argument.dart';

class DetailPhotoController extends GetxController {
  final GetDetailPhotoUseCase getDetailPhotoUseCase;

  PhotoArgument? photoArgument;
  var deviceId = ''.obs;
  var photos = <PhotoEntity>[].obs;
  var index = 0.obs;
  var currentPhoto = PhotoEntity().obs;

  DetailPhotoController({
    required this.getDetailPhotoUseCase,
  });

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      photoArgument = Get.arguments;
      deviceId.value = photoArgument?.deviceId ?? '';
      photos.addAll(photoArgument?.photos ?? []);
      index.value = photoArgument?.index ?? 0;
      await getDetailPhoto();
    });
  }

  Future<void> getDetailPhoto() async {
    try {
      String photoId = photos[index.value].id ?? '';
      final response = await getDetailPhotoUseCase(
        deviceId: deviceId.value,
        photoId: photoId,
      );

      Map<String, dynamic> payload = response?.data;

      if (response?.statusCode == HttpStatus.ok) {
        currentPhoto.value = PhotoModel.fromJson(payload['data']).toEntity();
      } else {
        Fluttertoast.showToast(msg: "Failure get data : ${payload['message']}");
      }
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'getDetailPhotos');
    }
  }
}
