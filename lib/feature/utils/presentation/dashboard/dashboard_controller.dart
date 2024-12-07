import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';
import 'package:tomato_leaf/data/models/device/device_model.dart';
import 'package:tomato_leaf/domain/entities/device/device_entity.dart';
import 'package:tomato_leaf/domain/entities/user/user_device_entity.dart';
import 'package:tomato_leaf/domain/entities/user/user_entity.dart';
import 'package:tomato_leaf/domain/usecases/device/my_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/add_or_update_user_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/delete_user_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/get_current_login_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/get_device_ids_usecase.dart';
import 'package:tomato_leaf/feature/device/presentation/detail_device/detail_device_page.dart';
import 'package:tomato_leaf/feature/device/presentation/update_device/update_device_page.dart';

class DashboardController extends GetxController {
  final GetCurrentLoginUseCase getCurrentLoginUseCase;
  final GetDeviceIdsUseCase getDeviceIdsUseCase;
  final MyDeviceUseCase myDeviceUseCase;
  final DeleteUserDeviceUseCase deleteUserDeviceUseCase;
  final AddOrUpdateUserUseCase addUserDeviceUseCase;

  var isLoading = false.obs;
  var deviceIds = <String>[].obs;
  var userData = UserEntity().obs;
  var myDevices = <DeviceEntity>[].obs;
  var filteredDevices = <DeviceEntity>[].obs;
  var searchQuery = ''.obs;

  DashboardController({
    required this.getCurrentLoginUseCase,
    required this.getDeviceIdsUseCase,
    required this.myDeviceUseCase,
    required this.deleteUserDeviceUseCase,
    required this.addUserDeviceUseCase,
  });

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    await fetchData();
    isLoading.value = false;
  }

  Future<void> fetchData() async {
    try{
      deviceIds.value = await getDeviceIdsUseCase() ?? [];
      userData.value = await getCurrentLoginUseCase() ?? UserEntity();
      myDevices.value = await getMyDevices() ?? [];
      filteredDevices.assignAll(myDevices);
    }catch(ex, s){
      LogPrint.exception(ex, s, this, 'fetchData');
    }
  }

  Future<List<DeviceEntity>?> getMyDevices() async {
    try{
      final response = await myDeviceUseCase(ids: deviceIds);

      Map<String, dynamic> payload = response?.data;

      if(response?.statusCode == HttpStatus.ok){
        return DeviceModel.fromListJson(payload['data']).map((e) => e.toEntity()).toList();
      }
    }catch(ex, s){
      LogPrint.exception(ex, s, this, 'getMyDevices');
    }

    return [];
  }

  void filterDevices(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredDevices.assignAll(myDevices);
    } else {
      filteredDevices.assignAll(
        myDevices.where((device) {
          return device.name?.toLowerCase().contains(query.toLowerCase()) == true;
        }).toList(),
      );
    }
  }

  Future<void> goToUpdateDeviceAddMode() async {
    try {
      await Get.toNamed(UpdateDevicePage.routeName.toString(), arguments: {
        "isModeEdit": false,
      });
      await fetchData();
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'updateDevice');
    }
  }

  Future<void> goToUpdateDeviceEditMode({
    required int index,
  }) async {
    var device = myDevices[index];
    try {
      await Get.toNamed(UpdateDevicePage.routeName.toString(), arguments: {
        "isModeEdit": true,
        "deviceId": device.deviceId,
        "deviceName": device.name,
      });
      await fetchData();
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'updateDevice');
    }
  }

  Future<void> goToDetailDevice({
    required int index,
  }) async {
    var device = myDevices[index];
    try {
      await Get.toNamed(
        DetailDevicePage.routeName.toString(),
        arguments: device.deviceId,
      );
      await fetchData();
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'updateDevice');
    }
  }

  Future<void> deleteDevice(int index) async {
    try {
      String deviceId = myDevices[index].deviceId ?? '';

      final response = await deleteUserDeviceUseCase.call(
        email: userData.value.email ?? '',
        deviceId: deviceId,
      );

      LogPrint.debug("PAYLOAD : ${response?.data}");
      Map<String, dynamic> payload = response?.data;

      if(response?.statusCode == HttpStatus.ok){
        Fluttertoast.showToast(msg: "Device berhasil dihapus");
        // menambahkan data device baru ke list
        List<UserDeviceEntity> devices = userData.value.devices != null
            ? List.from(userData.value.devices!)
            : [];
        devices.removeAt(index);
        UserEntity updatedUser = userData.value.copyWith(devices: devices);

        await addUserDeviceUseCase(user: updatedUser);
        await fetchData();
      }else{
        Fluttertoast.showToast(msg: "Failure : ${payload['message']}");
      }
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'deleteDevice');
    }
  }

  void confirmDelete(BuildContext context, int index) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Hapus'),
          content: const Text('Apakah Anda yakin ingin menghapus Device ini?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () async {
                Get.back();
                await deleteDevice(index);
                await fetchData();
              },
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );
  }
}
