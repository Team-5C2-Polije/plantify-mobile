import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';
import 'package:tomato_leaf/data/models/user/user_device_model.dart';
import 'package:tomato_leaf/domain/entities/user/user_device_entity.dart';
import 'package:tomato_leaf/domain/entities/user/user_entity.dart';
import 'package:tomato_leaf/domain/usecases/device/update_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/add_or_update_user_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/add_user_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/get_current_login_usecase.dart';

class UpdateDeviceController extends GetxController {
  final GetCurrentLoginUseCase getCurrentLoginUseCase;
  final AddOrUpdateUserUseCase addOrUpdateUserUseCase;
  final AddUserDeviceUseCase addUserDeviceUseCase;
  final UpdateDeviceUseCase updateDeviceUseCase;

  UpdateDeviceController({
    required this.getCurrentLoginUseCase,
    required this.addOrUpdateUserUseCase,
    required this.addUserDeviceUseCase,
    required this.updateDeviceUseCase,
  });

  var isModeEdit = false.obs;
  var userData = UserEntity().obs;
  var deviceName = ''.obs;
  var deviceId = ''.obs;
  TextEditingController textController = TextEditingController(text: '');

  @override
  void onInit() async{
    super.onInit();
    userData.value = await getCurrentLoginUseCase() ?? UserEntity();
    isModeEdit.value = Get.arguments['isModeEdit'];
    deviceName.value = Get.arguments['deviceName'];
    deviceId.value = Get.arguments['deviceId'];
    textController = TextEditingController(text: isModeEdit.value ? deviceName.value : '');
  }

  Future<void> addDevice(String? token) async{
    try{
      if(userData.value.email == null || userData.value.email?.trim().isEmpty == true){
        Fluttertoast.showToast(msg: "Gagal menambahkan device karena email null");
        return;
      }

      if(token == null || token.trim().isEmpty == true){
        Fluttertoast.showToast(msg: "Gagal menambahkan device karena token null");
        return;
      }

      final response = await addUserDeviceUseCase(
        email: userData.value.email!,
        token: token,
      );

      Map<String, dynamic> payload = response?.data;

      if(response?.statusCode == HttpStatus.ok){
        // mendapatkan data entry map
        Map<String, dynamic> payloadData = payload['data'];
        final firstKey = payloadData.keys.first;
        final data = MapEntry<String, dynamic>(firstKey, payloadData[firstKey]);

        // menambahkan data device baru ke list
        Fluttertoast.showToast(msg: "Device berhasil ditambahakan");
        UserDeviceEntity newDevice = UserDeviceModel.fromMapEntry(data).toEntity();
        LogPrint.debug("device : ${newDevice.deviceId}");
        List<UserDeviceEntity> devices = userData.value.devices != null
            ? List.from(userData.value.devices!)
            : [];
        devices.add(newDevice.copyWith(createdAt: DateTime.now()));
        UserEntity updatedUser = userData.value.copyWith(devices: devices);

        // menyimpan list
        await addOrUpdateUserUseCase(user: updatedUser);
      }else{
        Fluttertoast.showToast(msg: "Device gagal ditambahkan : ${payload['message']}");
      }
    }catch(ex, s){
      LogPrint.exception(ex, s, this, 'addDevice');
    }
  }

  Future<void> updateDevice(String text) async {
    try {
      final response = await updateDeviceUseCase(
        deviceId: deviceId.value,
        name: text,
      );

      Map<String, dynamic> payload = response?.data;

      if(response?.statusCode == HttpStatus.ok){
        Fluttertoast.showToast(msg: "Device berhasil diupdate");
      }else{
        Fluttertoast.showToast(msg: "Gagal mengupdate Device : ${payload['message']}");
      }
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'addDevice');
    }
  }

  Future<void> action(String text) async {
    if(isModeEdit.value){
      await updateDevice(text);
    }else{
      await addDevice(text);
    }
  }
}