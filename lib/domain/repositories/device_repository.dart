import 'dart:io';

import 'package:dio/dio.dart';

abstract class DeviceRepository{

  Future<Response?> updateDevice({
    required String deviceId,
    required String name,
  });

  Future<Response?> myDevice({
    required List<String> ids,
  });

  Future<Response?> detailDevice({
    required String deviceId,
  });

  Future<Response?> getPhotos({
    required String deviceId,
  });

  Future<Response?> getDetailPhoto({
    required String deviceId,
    required String photoId,
  });

  Future<Response?> addPhoto({
    required String deviceId,
    required File photo,
  });

  Future<Response?> getHistories({
    required String deviceId,
  });

  Future<Response?> addSchedule({
    required String deviceId,
    required String hour,
  });

  Future<Response?> updateSchedule({
    required String deviceId,
    required String hour,
    required String status,
  });

  Future<Response?> deleteSchedule({
    required String deviceId,
    required String hour,
  });

  Stream<int> getSensorValue({
    required String deviceId,
    required String data,
  });

  Stream<String> getUpdatedAt({required String deviceId});
}