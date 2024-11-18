import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';

class FcmTokenService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String? _fcmToken;

  Future<FcmTokenService> init() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    log('User granted permission: ${settings.authorizationStatus}', name: 'FcmTokenService');

    _fcmToken = await _firebaseMessaging.getToken();
    log('"FCM Token: $_fcmToken"', name: 'FcmTokenService');

    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      _fcmToken = newToken;
      log("FCM Token refreshed: $newToken", name: 'FcmTokenService');
    });

    return this;
  }

  String? get fcmToken => _fcmToken;
}