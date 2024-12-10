import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';
import 'package:tomato_leaf/data/models/device/photo_model.dart';
import 'package:tomato_leaf/domain/entities/device/photo_entity.dart';
import 'package:tomato_leaf/domain/entities/device/prediction_entity.dart';
import 'package:tomato_leaf/domain/usecases/device/get_detail_photo_usecase.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/photo_argument.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/photo_view/photo_viewer_page.dart';

class DetailPhotoController extends GetxController {
  final GetDetailPhotoUseCase getDetailPhotoUseCase;

  PhotoArgument? photoArgument;
  var deviceId = ''.obs;
  var photos = <PhotoEntity>[].obs;
  var index = 0.obs;
  int get displayIndex => index.value + 1;
  var currentPhoto = PhotoEntity().obs;
  var healthyPercentage = 0.obs;
  var sickPercentage = 0.obs;

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
      if (photoId.isEmpty) {
        Fluttertoast.showToast(msg: "Photo ID is missing");
        return;
      }

      final response = await getDetailPhotoUseCase(
        deviceId: deviceId.value,
        photoId: photoId,
      );

      Map<String, dynamic>? payload = response?.data;

      if (response?.statusCode == HttpStatus.ok && payload != null) {
        currentPhoto.value = PhotoModel.fromJson(payload['data']).toEntity();
        if(currentPhoto.value.predictions?.isEmpty == true) return;

        for(var predict in currentPhoto.value.predictions as List<PredictionEntity>){
          LogPrint.info("predict : ${predict.label}");
        }
        int totalPredict = currentPhoto.value.predictions!.length;
        healthyPercentage.value = (((currentPhoto.value.predictions
        !.where((e) => e.label == 'Sehat')
            .toList()
            .length) / totalPredict) * 100).toInt();
        sickPercentage.value = (((currentPhoto.value.predictions
        !.where((e) => e.label == 'Sakit')
            .toList()
            .length) / totalPredict) * 100).toInt();
      } else {
        Fluttertoast.showToast(
          msg: "Failed to get data: ${payload?['message'] ?? 'Unknown error'}",
        );
      }
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'getDetailPhoto');
    }
  }

  Future<void> tapRight() async {
    try{
      if (index.value >= photos.length - 1) {
        return;
      } else {
        index.value++;
      }
      await getDetailPhoto();
    }catch(ex, s){
      LogPrint.exception(ex, s, this, 'tapRight');
    }
  }

  Future<void> tapLeft() async {
    try{
      if (index.value <= 0) {
        index.value = 0;
        return;
      } else {
        index.value--;
      }

      await getDetailPhoto();
    }catch(ex, s){
      LogPrint.exception(ex, s, this, 'tapLeft');
    }
  }

  void goToPhotoViewer() {
    Get.toNamed(
      PhotoViewerPage.routeName.toString(),
      arguments: currentPhoto.value.photoUrl,
    );
  }
}
