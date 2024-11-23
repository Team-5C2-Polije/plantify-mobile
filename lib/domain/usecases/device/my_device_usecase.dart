import 'package:dio/dio.dart';
import 'package:tomato_leaf/domain/repositories/device_repository.dart';

class MyDeviceUseCase {
  final DeviceRepository repository;

  MyDeviceUseCase(this.repository);

  Future<Response?> call({
    required List<String> ids,
  }) async {
    return await repository.myDevice(ids: ids);
  }
}
