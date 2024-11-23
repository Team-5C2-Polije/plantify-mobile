import 'package:dio/dio.dart';
import 'package:tomato_leaf/domain/repositories/device_repository.dart';

class AddScheduleUseCase {
  final DeviceRepository repository;

  AddScheduleUseCase(this.repository);

  Future<Response?> call({
    required String deviceId,
    required String hour,
  }) async {
    return await repository.addSchedule(
      deviceId: deviceId,
      hour: hour,
    );
  }
}
