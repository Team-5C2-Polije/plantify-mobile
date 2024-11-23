import 'package:dio/dio.dart';
import 'package:tomato_leaf/domain/repositories/device_repository.dart';

class UpdateDeviceUseCase {
  final DeviceRepository repository;

  UpdateDeviceUseCase(this.repository);

  Future<Response?> call({
    required String deviceId,
    required String name,
  }) async {
    return await repository.updateDevice(
      deviceId: deviceId,
      name: name,
    );
  }
}
