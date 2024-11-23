import 'package:tomato_leaf/domain/entities/device/device_schedule_entity.dart';
import 'package:tomato_leaf/domain/entities/device/device_sensor_entity.dart';

class DeviceEntity {
  final DateTime? createdAt;
  final String? name;
  final List<DeviceScheduleEntity>? schedules;
  final DeviceSensorEntity? sensors;
  final String? token;
  final DateTime? updatedAt;
  final int? totalPhoto;
  final int? totalSchedule;

  DeviceEntity({
    this.createdAt,
    this.name,
    this.schedules,
    this.sensors,
    this.token,
    this.updatedAt,
    this.totalPhoto,
    this.totalSchedule,
  });
}