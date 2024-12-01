import 'package:tomato_leaf/core/utils/datetime_converter.dart';
import 'package:tomato_leaf/domain/entities/device/watering_history_entity.dart';

class WateringHistoryModel {
  final DateTime? createdAt;
  final String? id;
  final bool? isManually;
  final String? schedule;
  final num? lightIntensity;
  final num? soilMoisture;
  final num? temperature;
  final num? waterVol;

  WateringHistoryModel({
    this.createdAt,
    this.id,
    this.isManually,
    this.lightIntensity,
    this.schedule,
    this.soilMoisture,
    this.temperature,
    this.waterVol,
  });

  factory WateringHistoryModel.fromJson(Map<String, dynamic> json) {
    return WateringHistoryModel(
      createdAt: DateTimeConverter.parseRFC1123(json['createdAt'] as String?),
      id: json['id'] as String?,
      isManually: json['isManually'] as bool?,
      schedule: json['schedule'] as String?,
      lightIntensity: json['lightIntensity'] as num?,
      soilMoisture: json['soilMoisture'] as num?,
      temperature: json['temperature'] as num?,
      waterVol: json['waterVol'] as num?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'id': id,
      'isManually': isManually,
      'lightIntensity': lightIntensity,
      'schedule': schedule,
      'soilMoisture': soilMoisture,
      'temperature': temperature,
      'waterVol': waterVol,
    };
  }

  WateringHistoryEntity toEntity() {
    return WateringHistoryEntity(
      createdAt: createdAt,
      id: id,
      isManually: isManually,
      schedule: schedule,
      lightIntensity: lightIntensity,
      soilMoisture: soilMoisture,
      temperature: temperature,
      waterVol: waterVol,
    );
  }

  static WateringHistoryModel fromEntity(WateringHistoryEntity entity) {
    return WateringHistoryModel(
      createdAt: entity.createdAt,
      id: entity.id,
      isManually: entity.isManually,
      lightIntensity: entity.lightIntensity,
      schedule: entity.schedule,
      soilMoisture: entity.soilMoisture,
      temperature: entity.temperature,
      waterVol: entity.waterVol,
    );
  }

  static List<WateringHistoryModel> fromListJson(List<dynamic> jsonList) {
    return jsonList
        .map((json) => WateringHistoryModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
