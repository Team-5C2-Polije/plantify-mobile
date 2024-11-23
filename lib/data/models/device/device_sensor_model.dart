import 'package:tomato_leaf/domain/entities/device/device_sensor_entity.dart';

class DeviceSensorModel {
  final int? lightIntensity;
  final int? soilMoisture;
  final int? temperature;
  final int? waterVol;

  DeviceSensorModel({
    this.lightIntensity,
    this.soilMoisture,
    this.temperature,
    this.waterVol,
  });

  factory DeviceSensorModel.fromJson(Map<String, dynamic> json) {
    return DeviceSensorModel(
      lightIntensity: json['lightIntensity'] as int?,
      soilMoisture: json['soilMoisture'] as int?,
      temperature: json['temperature'] as int?,
      waterVol: json['waterVol'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lightIntensity': lightIntensity,
      'soilMoisture': soilMoisture,
      'temperature': temperature,
      'waterVol': waterVol,
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
