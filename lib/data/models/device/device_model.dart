import 'package:tomato_leaf/core/utils/datetime_converter.dart';
import 'package:tomato_leaf/data/models/device/device_schedule_model.dart';
import 'package:tomato_leaf/data/models/device/device_sensor_model.dart';
import 'package:tomato_leaf/domain/entities/device/device_entity.dart';

class DeviceModel {
  final String? deviceId;
  final DateTime? createdAt;
  final String? name;
  final List<DeviceScheduleModel>? schedules;
  final DeviceSensorModel? sensors;
  final String? token;
  final DateTime? updatedAt;
  final int? totalPhoto;
  final int? totalSchedule;

  DeviceModel({
    this.deviceId,
    this.createdAt,
    this.name,
    this.schedules,
    this.sensors,
    this.token,
    this.updatedAt,
    this.totalPhoto,
    this.totalSchedule,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      deviceId: json['deviceId'] as String?,
      createdAt: DateTimeConverter.parseRFC1123(json['createdAt'] as String?),
      name: json['name'] as String?,
      schedules: json['schedules'] != null
          ? DeviceScheduleModel.fromListMapEntry(
          (json['schedules'] as Map<String, dynamic>).entries.toList())
          : null,
      sensors: json['sensors'] != null
          ? DeviceSensorModel.fromJson(json['sensors'])
          : null,
      token: json['token'] as String?,
      updatedAt: DateTimeConverter.parseRFC1123(json['updatedAt'] as String?),
      totalPhoto: json['total_photo'] as int?,
      totalSchedule: json['total_schedule'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      'createdAt': createdAt?.toUtc().toIso8601String(),
      'name': name,
      'schedules': {
        schedules?.map((e) => e.toJson())
      },
      "sensors": sensors?.toJson(),
      'token': token,
      'updatedAt': updatedAt?.toUtc().toIso8601String(),
      'total_photo': totalPhoto,
      'total_schedule': totalSchedule,
    };
  }

  static DeviceModel fromEntity(DeviceEntity entity) {
    return DeviceModel(
      deviceId: entity.deviceId,
      createdAt: entity.createdAt,
      name: entity.name,
      schedules: entity.schedules?.map((schedule) => DeviceScheduleModel.fromEntity(schedule)).toList(),
      sensors: entity.sensors != null ? DeviceSensorModel.fromEntity(entity.sensors!) : null,
      token: entity.token,
      updatedAt: entity.updatedAt,
      totalPhoto: entity.totalPhoto,
      totalSchedule: entity.totalSchedule,
    );
  }

  DeviceEntity toEntity() {
    return DeviceEntity(
      deviceId: deviceId,
      createdAt: createdAt,
      name: name,
      schedules: schedules?.map((schedule) => schedule.toEntity()).toList(),
      sensors: sensors?.toEntity(),
      token: token,
      updatedAt: updatedAt,
      totalPhoto: totalPhoto,
      totalSchedule: totalSchedule,
    );
  }

  static List<DeviceModel> fromListJson(List<dynamic> jsonList) {
    return jsonList.map((json) => DeviceModel.fromJson(json as Map<String, dynamic>)).toList();
  }

}
