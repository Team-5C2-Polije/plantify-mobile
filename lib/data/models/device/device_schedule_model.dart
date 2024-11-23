import 'package:tomato_leaf/domain/entities/device/device_schedule_entity.dart';

class DeviceScheduleModel {
  final String? time;
  final bool? isActive;

  DeviceScheduleModel({
    this.time,
    this.isActive,
  });

  factory DeviceScheduleModel.fromMapEntry(MapEntry<String, dynamic> entry) {
    return DeviceScheduleModel(
      time: entry.key,
      isActive: entry.value as bool,
    );
  }

  Map<String, dynamic> toJson() {
    if(time == null) return {};
    return {time!: isActive};
  }

  static DeviceScheduleModel fromEntity(DeviceScheduleEntity entity) {
    return DeviceScheduleModel(
      time: entity.time,
      isActive: entity.isActive,
    );
  }

  DeviceScheduleEntity toEntity() {
    return DeviceScheduleEntity(
      time: time,
      isActive: isActive,
    );
  }

  static List<DeviceScheduleModel> fromListMapEntry(List<MapEntry<String, dynamic>> entries) {
    return entries.map((entry) => DeviceScheduleModel.fromMapEntry(entry)).toList();
  }
}
