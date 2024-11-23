import 'package:dio/dio.dart';
import 'package:tomato_leaf/domain/repositories/device_repository.dart';

class GetHistoriesUseCase {
  final DeviceRepository repository;

  GetHistoriesUseCase(this.repository);

  Future<Response?> call({
    required String deviceId,
  }) async {
    return await repository.getHistories(deviceId: deviceId);
  }
}
