import 'package:isar/isar.dart';
import 'package:tomato_leaf/domain/entities/user/user_device_entity.dart';

part 'user_entity.g.dart';

@Collection()
class UserEntity {
  Id id = Isar.autoIncrement;
  final String? email;
  final String? fcmToken;
  final String? fullname;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<UserDeviceEntity>? devices;

  UserEntity({
    this.email,
    this.fcmToken,
    this.fullname,
    this.createdAt,
    this.updatedAt,
    this.devices,
  });
}