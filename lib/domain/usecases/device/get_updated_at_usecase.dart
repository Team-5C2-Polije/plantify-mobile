import 'package:tomato_leaf/domain/repositories/device_repository.dart';

class GetUpdatedAtUseCase {
  final DeviceRepository repository;

  GetUpdatedAtUseCase(this.repository);

  Stream<String> call({
    required String deviceId,
  }) {
    return repository.getUpdatedAt(
      deviceId: deviceId,
    );
  }
}
