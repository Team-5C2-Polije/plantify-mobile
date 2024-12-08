import 'package:tomato_leaf/core/utils/datetime_converter.dart';
import 'package:tomato_leaf/domain/entities/user/user_notification_entity.dart';

class UserNotificationModel {
  final String? id;
  final String? title;
  final String? body;
  final String? deviceName;
  final num? waterVol;
  final DateTime? sendAt;

  UserNotificationModel({
    this.id,
    this.title,
    this.body,
    this.sendAt,
    this.deviceName,
    this.waterVol,
  });

  factory UserNotificationModel.fromJson(Map<String, dynamic> json) {
    return UserNotificationModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      sendAt: json['sendAt'] != null ? DateTimeConverter.parseRFC1123(json['sendAt']) : null,
      waterVol: json['waterVol'] as num?,
      deviceName: json['deviceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'sendAt': sendAt?.toUtc().toIso8601String(),
      'waterVol': waterVol,
      'deviceName': deviceName,
    };
  }

  UserNotificationEntity toEntity() {
    return UserNotificationEntity(
      id: id,
      title: title,
      body: body,
      sendAt: sendAt,
      deviceName: deviceName,
      waterVol: waterVol,
    );
  }

  factory UserNotificationModel.fromEntity(UserNotificationEntity entity) {
    return UserNotificationModel(
      id: entity.id,
      title: entity.title,
      body: entity.body,
      sendAt: entity.sendAt,
      deviceName: entity.deviceName,
      waterVol: entity.waterVol,
    );
  }

  static List<UserNotificationModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => UserNotificationModel.fromJson(json)).toList();
  }
}
