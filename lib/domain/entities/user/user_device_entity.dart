import 'package:isar/isar.dart';

part 'user_device_entity.g.dart';

@embedded
class UserDeviceEntity {
  final String? deviceId;
  final DateTime? createdAt;
  final String? name;

  UserDeviceEntity({
    this.deviceId,
    this.createdAt,
    this.name,
  });

  UserDeviceEntity copyWith({
    String? deviceId,
    DateTime? createdAt,
    String? name,
  }) {
    return UserDeviceEntity(
      deviceId: deviceId ?? this.deviceId,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
    );
  }
}
