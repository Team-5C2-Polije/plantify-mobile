import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tomato_leaf/domain/repositories/device_repository.dart';

class AddPhotoUseCase {
  final DeviceRepository repository;

  AddPhotoUseCase(this.repository);

  Future<Response?> call({
    required String deviceId,
    required File photo,
  }) async {
    return await repository.addPhoto(
      deviceId: deviceId,
      photo: photo,
    );
  }
}
