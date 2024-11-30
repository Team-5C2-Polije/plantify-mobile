import 'package:tomato_leaf/domain/entities/device/device_sensor_entity.dart';

class DeviceSensorModel {
  final num? lightIntensity;
  final num? soilMoisture;
  final num? temperature;
  final num? waterVol;

  DeviceSensorModel({
    this.lightIntensity,
    this.soilMoisture,
    this.temperature,
    this.waterVol,
  });

  factory DeviceSensorModel.fromJson(Map<String, dynamic> json) {
    return DeviceSensorModel(
      lightIntensity: json['lightIntensity'] as num?,
      soilMoisture: json['soilMoisture'] as num?,
      temperature: json['temperature'] as num?,
      waterVol: json['waterVol'] as num?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lightIntensity': lightIntensity ?? 0,
      'soilMoisture': soilMoisture ?? 0,
      'temperature': temperature ?? 0,
      'waterVol': waterVol ?? 0,
    };
  }

  factory DeviceSensorModel.fromEntity(DeviceSensorEntity entity) {
    return DeviceSensorModel(
      lightIntensity: entity.lightIntensity,
      soilMoisture: entity.soilMoisture,
      temperature: entity.temperature,
      waterVol: entity.waterVol,
    );
  }

  DeviceSensorEntity toEntity() {
    return DeviceSensorEntity(
      lightIntensity: lightIntensity,
      soilMoisture: soilMoisture,
      temperature: temperature,
      waterVol: waterVol,
    );
  }
}
