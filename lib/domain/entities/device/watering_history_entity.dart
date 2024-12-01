class WateringHistoryEntity {
  final DateTime? createdAt;
  final String? id;
  final bool? isManually;
  final String? schedule;
  final num? lightIntensity;
  final num? soilMoisture;
  final num? temperature;
  final num? waterVol;

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
