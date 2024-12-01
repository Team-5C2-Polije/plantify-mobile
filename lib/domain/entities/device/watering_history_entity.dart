class WateringHistoryEntity {
  final DateTime? createdAt;
  final String? id;
  final bool? isManually;
  final int? lightIntensity;
  final String? schedule;
  final int? soilMoisture;
  final int? temperature;
  final int? waterVol;

  WateringHistoryEntity({
    this.createdAt,
    this.id,
    this.isManually,
    this.lightIntensity,
    this.schedule,
    this.soilMoisture,
    this.temperature,
    this.waterVol,
  });
}
