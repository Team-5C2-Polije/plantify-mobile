class UserNotificationEntity {
  final String? id;
  final String? title;
  final String? body;
  final DateTime? sendAt;
  final String? deviceName;
  final num? waterVol;

  UserNotificationEntity({
    this.id,
    this.title,
    this.body,
    this.sendAt,
    this.deviceName,
    this.waterVol,
  });

  UserNotificationEntity copyWith({
    String? id,
    String? title,
    String? body,
    DateTime? sendAt,
    String? deviceName,
    num? waterVol,
  }) {
    return UserNotificationEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      sendAt: sendAt ?? this.sendAt,
      deviceName: deviceName ?? this.deviceName,
      waterVol: waterVol ?? this.waterVol,
    );
  }
}
