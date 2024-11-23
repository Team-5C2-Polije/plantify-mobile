import 'package:dio/dio.dart';
import 'package:tomato_leaf/domain/repositories/device_repository.dart';

class GetDetailPhotoUseCase {
  final DeviceRepository repository;

  GetDetailPhotoUseCase(this.repository);

  Future<Response?> call({
    required String deviceId,
    required String photoId,
  }) async {
    return await repository.getDetailPhoto(
      deviceId: deviceId,
      photoId: photoId,
    );
  }
}
