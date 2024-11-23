import 'package:dio/dio.dart';
import 'package:tomato_leaf/domain/repositories/device_repository.dart';

class GetPhotosUseCase {
  final DeviceRepository repository;

  GetPhotosUseCase(this.repository);

  Future<Response?> call({
    required String deviceId,
  }) async {
    return await repository.getPhotos(deviceId: deviceId);
  }
}
