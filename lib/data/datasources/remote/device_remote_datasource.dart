import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tomato_leaf/core/services/dio_service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:tomato_leaf/core/utils/api_constant.dart';
import 'package:tomato_leaf/core/utils/datetime_converter.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';

class DeviceRemoteDataSource {
  final DioService _dioService = Get.find<DioService>();

  Future<dio.Response?> updateDevice({
    required String deviceId,
    required String name,
  }) async {
    try {
      return await _dioService.dio.post(
        ApiConstant.updateDeviceEndpoint,
        data: {
          "device_id": deviceId,
          "name": name,
        },
      );
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'updateDevice');
      return null;
    }
  }

  Future<dio.Response?> myDevice({
    required List<String> ids,
  }) async {
    try {
      return await _dioService.dio.get(
        ApiConstant.myDeviceEndpoint,
        data: {
          "ids": ids.toList(),
        },
      );
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'myDevice');
      return null;
    }
  }

  Future<dio.Response?> detailDevice({
    required String deviceId,
  }) async {
    try {
      return await _dioService.dio.get(
        '${ApiConstant.detailDeviceEndpoint}$deviceId',
      );
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'detailDevice');
      return null;
    }
  }

  Future<dio.Response?> getPhotos({
    required String deviceId,
  }) async {
    try {
      return await _dioService.dio.get(
        '${ApiConstant.getPhotosEndpoint}$deviceId/photos',
      );
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'getPhotos');
      return null;
    }
  }

  Future<dio.Response?> getDetailPhoto({
    required String deviceId,
    required String photoId,
  }) async {
    try {
      return await _dioService.dio.get(
        '${ApiConstant.getDetailPhotoEndpoint}$deviceId/photos/$photoId',
      );
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'getDetailPhoto');
      return null;
    }
  }

  Future<dio.Response?> addPhoto({
    required String deviceId,
    required File photo,
  }) async {
    try {
      dio.FormData formData = dio.FormData.fromMap({
        "device_id": deviceId,
        "photo": await dio.MultipartFile.fromFile(
          photo.path,
          filename: photo.uri.pathSegments.last,
        ),
      });

      return await _dioService.dio.post(
        ApiConstant.addPhotoEndpoint,
        data: formData,
      );
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'addPhoto');
      return null;
    }
  }

  Future<dio.Response?> getHistories({
    required String deviceId,
  }) async {
    try {
      return await _dioService.dio.get(
        '${ApiConstant.getHistoriesEndpoint}$deviceId/histories',
      );
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'getHistories');
      return null;
    }
  }

  Future<dio.Response?> addSchedule({
    required String deviceId,
    required String hour,
  }) async {
    try {
      return await _dioService.dio.post(
        ApiConstant.addScheduleEndpoint,
        data: {
          "device_id": deviceId,
          "hour": hour,
        },
      );
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'addSchedule');
      return null;
    }
  }

  Future<dio.Response?> updateSchedule({
    required String deviceId,
    required String hour,
    required String status,
  }) async {
    try {
      return await _dioService.dio.post(
        ApiConstant.updateScheduleEndpoint,
        data: {
          "device_id": deviceId,
          "hour": hour,
          "status": status,
        },
      );
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'updateSchedule');
      return null;
    }
  }

  Future<dio.Response?> deleteSchedule({
    required String deviceId,
    required String hour,
  }) async {
    try {
      return await _dioService.dio.post(
        ApiConstant.deleteScheduleEndpoint,
        data: {
          "device_id": deviceId,
          "hour": hour,
        },
      );
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'deleteSchedule');
      return null;
    }
  }

  Stream<num> getSensorValue({required String deviceId, required String data}) {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      return firestore
          .collection('devices')
          .doc(deviceId)
          .snapshots()
          .map((snapshot) {
        if (snapshot.exists) {
          return snapshot.data()?['sensors'][data] ?? 0;
        }
        return 0;
      });
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, '');
      return Stream.value(0);
    }
  }

  Stream<String> getUpdatedAt({required String deviceId}) {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      return firestore
          .collection('devices')
          .doc(deviceId)
          .snapshots()
          .map((snapshot) {
        if (snapshot.exists) {
          Timestamp? updateAtTimeStamp = snapshot.data()?['updatedAt'];
          if(updateAtTimeStamp != null){
            DateTimeConverter.toUpdatedAtStyle(updateAtTimeStamp.toDate()) ?? 'NULL';
          }
        }
        return DateTimeConverter.toUpdatedAtStyle(DateTime.now()) ?? 'NULL';
      });
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, '');
      return Stream.value(DateTimeConverter.toUpdatedAtStyle(DateTime.now()) ?? 'NULL');
    }
  }

}
