import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tomato_leaf/data/datasources/local/device_local_datasource.dart';
import 'package:tomato_leaf/data/datasources/remote/device_remote_datasource.dart';
import 'package:tomato_leaf/domain/repositories/device_repository.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  final DeviceLocalDataSource deviceLocalDataSource;
  final DeviceRemoteDataSource deviceRemoteDataSource;

  DeviceRepositoryImpl({
    required this.deviceLocalDataSource,
    required this.deviceRemoteDataSource,
  });

  @override
  Future<Response?> addPhoto({
    required String deviceId,
    required File photo,
  }) async {
    return await deviceRemoteDataSource.addPhoto(
      deviceId: deviceId,
      photo: photo,
    );
  }

  @override
  Future<Response?> addSchedule({
    required String deviceId,
    required String hour,
  }) async {
    return await deviceRemoteDataSource.addSchedule(
      deviceId: deviceId,
      hour: hour,
    );
  }

  @override
  Future<Response?> deleteSchedule({
    required String deviceId,
    required String hour,
  }) async {
    return await deviceRemoteDataSource.deleteSchedule(
      deviceId: deviceId,
      hour: hour,
    );
  }

  @override
  Future<Response?> detailDevice({
    required String deviceId,
  }) async {
    return await deviceRemoteDataSource.detailDevice(
      deviceId: deviceId,
    );
  }

  @override
  Future<Response?> getDetailPhoto({
    required String deviceId,
    required String photoId,
  }) async {
    return await deviceRemoteDataSource.getDetailPhoto(
      deviceId: deviceId,
      photoId: photoId,
    );
  }

  @override
  Future<Response?> getHistories({
    required String deviceId,
  }) async {
    return await deviceRemoteDataSource.getHistories(
      deviceId: deviceId,
    );
  }

  @override
  Future<Response?> getPhotos({
    required String deviceId,
  }) async {
    return await deviceRemoteDataSource.getPhotos(
      deviceId: deviceId,
    );
  }

  @override
  Future<Response?> myDevice({
    required List<String> ids,
  }) async {
    return await deviceRemoteDataSource.myDevice(
      ids: ids,
    );
  }

  @override
  Future<Response?> updateDevice({
    required String deviceId,
    required String name,
  }) async {
    return await deviceRemoteDataSource.updateDevice(
      deviceId: deviceId,
      name: name,
    );
  }

  @override
  Future<Response?> updateSchedule({
    required String deviceId,
    required String hour,
    required String status,
  }) async {
    return await deviceRemoteDataSource.updateSchedule(
      deviceId: deviceId,
      hour: hour,
      status: status,
    );
  }

  @override
  Stream<num> getSensorValue({
    required String deviceId,
    required String data,
  }) {
    return deviceRemoteDataSource.getSensorValue(
      deviceId: deviceId,
      data: data,
    );
  }

  @override
  Stream<String> getUpdatedAt({required String deviceId}) {
    return deviceRemoteDataSource.getUpdatedAt(deviceId: deviceId);
  }
}
