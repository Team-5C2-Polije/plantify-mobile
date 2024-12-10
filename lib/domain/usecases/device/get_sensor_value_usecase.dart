import 'package:tomato_leaf/domain/repositories/device_repository.dart';

class GetSensorValueUseCase {
  final DeviceRepository repository;

  GetSensorValueUseCase(this.repository);

  Stream<num> call({
    required String deviceId,
    required String data,
  }) {
    return repository.getSensorValue(
      deviceId: deviceId,
      data: data,
    );
  }
}
