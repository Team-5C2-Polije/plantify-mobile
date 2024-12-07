import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';
import 'package:tomato_leaf/data/models/device/device_model.dart';
import 'package:tomato_leaf/data/models/device/photo_model.dart';
import 'package:tomato_leaf/domain/entities/device/device_entity.dart';
import 'package:tomato_leaf/domain/entities/device/photo_entity.dart';
import 'package:tomato_leaf/domain/usecases/device/add_photo_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/detail_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/get_photos_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/get_updated_at_usecase.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/detail_photo/detail_photo_page.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/photo_argument.dart';

class ListPhotoController extends GetxController {
  final DetailDeviceUseCase detailDeviceUseCase;
  final GetUpdatedAtUseCase getUpdatedAtUseCase;
  final GetPhotosUseCase getPhotosUseCase;
  final AddPhotoUseCase addPhotoUseCase;

  var deviceId = ''.obs;
  var deviceDetail = DeviceEntity().obs;
  var updatedAt = ''.obs;
  var photos = <PhotoEntity>[].obs;
  var isLoadingUploadImage = false.obs;
  late StreamSubscription<String> _subUpdatedAt;

  final ImagePicker _picker = ImagePicker();
  var selectedImage = Rx<XFile?>(null);
  var selectedImageBytes = Rx<Uint8List?>(null);
  var isImageSelected = false.obs;

  ListPhotoController({
    required this.detailDeviceUseCase,
    required this.getUpdatedAtUseCase,
    required this.getPhotosUseCase,
    required this.addPhotoUseCase,
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
  Future<void> _uploadPhoto() async {
    try {
      if (selectedImage.value != null) {
        File file = File(selectedImage.value!.path);

        showLoadingDialog();

        final response = await addPhotoUseCase.call(
          deviceId: deviceId.value,
          photo: file,
        );

        Map<String, dynamic> payload = response?.data;

        if (response?.statusCode == HttpStatus.ok) {
          Fluttertoast.showToast(msg: "Foto berhasil diupload");
        } else {
          Fluttertoast.showToast(msg: "Failure : ${payload['message']}");
        }
      } else {
        LogPrint.error('No file selected.');
      }
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'uploadPhoto');
    } finally {
      Get.back();
    }
  }

  void showLoadingDialog() {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  color: Colors.blueAccent,
                  strokeWidth: 5,
                ),
                SizedBox(height: 20),
                Text(
                  'Uploading...',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  Future<void> pickImageFromGallery() async {
    try {
      Get.back();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        selectedImage.value = image;
        selectedImageBytes.value = await image.readAsBytes();
        isImageSelected.value = true;
      }

      await _preprocessingImage();
      isLoadingUploadImage.value = true;
      await _uploadPhoto();
      await getPhotos();

    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'pickImageFromGallery');
      Fluttertoast.showToast(msg: "An error occurred: $ex");
    } finally {
      isLoadingUploadImage.value = false;
    }
  }

  Future<void> pickImageFromCamera() async {
    try {
      Get.back();
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        selectedImage.value = image;
        isImageSelected.value = true;
        selectedImageBytes.value = await image.readAsBytes();
      }

      await _preprocessingImage();
      isLoadingUploadImage.value = true;
      await _uploadPhoto();
      await getPhotos();

    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'pickImageFromCamera');
      Fluttertoast.showToast(msg: "An error occurred: $ex");
    } finally {
      isLoadingUploadImage.value = false;
    }
  }

  Future<void> _preprocessingImage() async {
    try{
      if (selectedImage.value == null) {
        return;
      }

      final File file = File(selectedImage.value!.path);

      if (!file.existsSync()) {
        Fluttertoast.showToast(msg: "File not found or invalid");
        return;
      }

      final croppedImage = await _croppingImage(file);

      if (croppedImage != null) {
        // update image after cropped
        selectedImage.value = XFile(croppedImage.path);
        selectedImageBytes.value = await croppedImage.readAsBytes();
        isImageSelected.value = true;
      }

      if(selectedImage.value == null){
        LogPrint.debug("~edit profile XFile is null");
        return;
      }

      await _compressedImage();
    }catch(ex, s){
      LogPrint.exception(ex, s, this, '_preprocessingImage');
    }
  }

  Future<File?>? _croppingImage(File imgFile, {CropStyle cropStyle = CropStyle.rectangle}) async {
    LogPrint.debug("~edit profile opnened crop file : ${imgFile.path}");
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imgFile.path,
      compressFormat: ImageCompressFormat.png,
      compressQuality: 70,
      cropStyle: cropStyle,
      aspectRatioPresets: Platform.isAndroid
          ? cropStyle == CropStyle.circle
          ? [CropAspectRatioPreset.square]
          : [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : cropStyle == CropStyle.circle
          ? [CropAspectRatioPreset.square]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarWidgetColor: Colors.black,
          initAspectRatio: CropAspectRatioPreset.original,
          toolbarColor: Colors.white,
          lockAspectRatio: false,
        ),
        IOSUiSettings(title: 'Crop Image'),
      ],
    );

    if (croppedFile != null) {
      return File(croppedFile.path);
    }
    return null;
  }

  Future<void> _compressedImage() async {
    try{
      LogPrint.debug("~edit profile prepare compress image");
      final Uint8List? compressedBytes = await FlutterImageCompress.compressWithFile(
        selectedImage.value!.path,
        quality: 75,
        minWidth: 1080,
        minHeight: 1920,
      );

      if (compressedBytes != null) {
        LogPrint.debug("~edit profile compress bytes not null");
        selectedImageBytes.value = compressedBytes;

        final String compressedImagePath = selectedImage.value!.path.replaceFirst('.png', '_compressed.png');
        await File(compressedImagePath).writeAsBytes(compressedBytes);
        selectedImage.value = XFile(compressedImagePath);
      } else {
        LogPrint.debug("~edit profile compress bytes is null");
      }
    }catch(ex, s){
      LogPrint.exception(ex, s, this, 'compressImage');
    }
  }


}
