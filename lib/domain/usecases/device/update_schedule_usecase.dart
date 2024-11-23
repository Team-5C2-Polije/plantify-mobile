import 'package:dio/dio.dart';
import 'package:tomato_leaf/domain/repositories/device_repository.dart';

class UpdateScheduleUseCase {
  final DeviceRepository repository;

  UpdateScheduleUseCase(this.repository);

  Future<Response?> call({
    required String deviceId,
    required String hour,
    required String status,
  }) async {
    return await repository.updateSchedule(
      deviceId: deviceId,
      hour: hour,
      status: status,
    );
  }
}
