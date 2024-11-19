import 'package:tomato_leaf/core/utils/datetime_converter.dart';
import 'package:tomato_leaf/data/models/user/user_device_model.dart';
import 'package:tomato_leaf/domain/entities/user/user_entity.dart';

class UserModel {
  final String? email;
  final String? fcmToken;
  final String? fullname;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<UserDeviceModel>? devices;

  UserModel({
    this.email,
    this.fcmToken,
    this.fullname,
    this.createdAt,
    this.updatedAt,
    this.devices,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String?,
      fcmToken: map['fcmToken'] as String?,
      fullname: map['fullname'] as String?,
      createdAt: map['createdAt'] != null ? DateTimeConverter.parseRFC1123(map['createdAt']) : null,
      updatedAt: map['updatedAt'] != null ? DateTimeConverter.parseRFC1123(map['updatedAt']) : null,
      devices: map['devices'] != null
          ? UserDeviceModel.fromMapEntryList(map['devices'])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'fcmToken': fcmToken,
      'fullname': fullname,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'devices': devices?.map((device) => device.toJson()).toList(),
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      email: email,
      fcmToken: fcmToken,
      fullname: fullname,
      createdAt: createdAt,
      updatedAt: updatedAt,
      devices: devices?.map((device) => device.toEntity()).toList(),
    );
  }

  static UserModel fromEntity(UserEntity entity) {
    return UserModel(
      email: entity.email,
      fcmToken: entity.fcmToken,
      fullname: entity.fullname,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      devices: entity.devices != null
          ? entity.devices!.map((device) => UserDeviceModel.fromEntity(device)).toList()
          : [],
    );
  }
}
