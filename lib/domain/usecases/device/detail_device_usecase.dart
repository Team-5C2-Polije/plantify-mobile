import 'package:dio/dio.dart';
import 'package:tomato_leaf/domain/repositories/device_repository.dart';

class DetailDeviceUseCase {
  final DeviceRepository repository;

  DetailDeviceUseCase(this.repository);

  Future<Response?> call({
    required String deviceId,
  }) async {
    return await repository.detailDevice(
      deviceId: deviceId,
    );
  }
}
