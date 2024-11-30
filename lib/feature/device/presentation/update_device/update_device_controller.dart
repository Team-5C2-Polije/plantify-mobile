import 'dart:io';

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
  final UpdateDeviceUseCase updateDeviceController;

  UpdateDeviceController({
    required this.getCurrentLoginUseCase,
    required this.addOrUpdateUserUseCase,
    required this.addUserDeviceUseCase,
    required this.updateDeviceController,
  });

  var isModeEdit = false.obs;
  var userData = UserEntity().obs;

  @override
  void onInit() async{
    super.onInit();
    userData.value = await getCurrentLoginUseCase() ?? UserEntity();
    isModeEdit.value = Get.arguments['isModeEdit'];
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

  Future<void> action(String text) async {
    if(isModeEdit.value){
      //
    }else{
      await addDevice(text);
    }
  }
}