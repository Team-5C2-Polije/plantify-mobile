import 'package:dio/dio.dart';
import 'package:tomato_leaf/domain/repositories/device_repository.dart';

class DeleteScheduleUseCase {
  final DeviceRepository repository;

  DeleteScheduleUseCase(this.repository);

  Future<Response?> call({
    required String deviceId,
    required String hour,
  }) async {
    return await repository.deleteSchedule(
      deviceId: deviceId,
      hour: hour,
    );
  }
}
