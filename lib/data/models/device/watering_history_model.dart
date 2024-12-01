import 'package:tomato_leaf/domain/entities/device/watering_history_entity.dart';

class WateringHistoryModel {
  final String? createdAt;
  final String? id;
  final bool? isManually;
  final int? lightIntensity;
  final String? schedule;
  final int? soilMoisture;
  final int? temperature;
  final int? waterVol;

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
      createdAt: json['createdAt'] as String?,
      id: json['id'] as String?,
      isManually: json['isManually'] as bool?,
      lightIntensity: json['lightIntensity'] as int?,
      schedule: json['schedule'] as String?,
      soilMoisture: json['soilMoisture'] as int?,
      temperature: json['temperature'] as int?,
      waterVol: json['waterVol'] as int?,
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
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
      id: id,
      isManually: isManually,
      lightIntensity: lightIntensity,
      schedule: schedule,
      soilMoisture: soilMoisture,
      temperature: temperature,
      waterVol: waterVol,
    );
  }

  static WateringHistoryModel fromEntity(WateringHistoryEntity entity) {
    return WateringHistoryModel(
      createdAt: entity.createdAt?.toIso8601String(),
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
