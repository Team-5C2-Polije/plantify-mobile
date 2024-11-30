import 'package:tomato_leaf/core/utils/datetime_converter.dart';
import 'package:tomato_leaf/domain/entities/user/user_device_entity.dart';

class UserDeviceModel {
  final String? deviceId;
  final DateTime? createdAt;
  final String? name;

  UserDeviceModel({
    this.deviceId,
    this.createdAt,
    this.name,
  });

  factory UserDeviceModel.fromMapEntry(MapEntry<String, dynamic> entry, {bool ignoreCreated = false}) {
    final deviceData = entry.value;

    return UserDeviceModel(
      deviceId: entry.key,
      createdAt: ignoreCreated ? deviceData['createdAt'] != null
          ? DateTimeConverter.parseRFC1123(deviceData['createdAt'])
          : null : DateTime.now(),
      name: deviceData['name'],
    );
  }

  Map<String, dynamic> toJson() {
    if (deviceId != null) {
      return {
        deviceId!: {
          'createdAt': createdAt?.toIso8601String(),
          'name': name,
        }
      };
    } else {
      return {};
    }
  }

  static List<UserDeviceModel> fromMapEntryList(Map<String, dynamic> map) {
    return map.entries.map((entry) {
      return UserDeviceModel.fromMapEntry(entry);
    }).toList();
  }
  UserDeviceEntity toEntity() {
    return UserDeviceEntity(
      deviceId: deviceId,
      createdAt: createdAt,
      name: name,
    );
  }

  static UserDeviceModel fromEntity(UserDeviceEntity entity) {
    return UserDeviceModel(
      deviceId: entity.deviceId,
      createdAt: entity.createdAt,
      name: entity.name,
    );
  }
}
