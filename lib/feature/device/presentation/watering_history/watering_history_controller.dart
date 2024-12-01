import 'dart:async';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';
import 'package:tomato_leaf/data/models/device/watering_history_model.dart';
import 'package:tomato_leaf/domain/entities/device/device_entity.dart';
import 'package:tomato_leaf/domain/entities/device/watering_history_entity.dart';
import 'package:tomato_leaf/domain/usecases/device/detail_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/get_histories_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/get_updated_at_usecase.dart';

import '../../../../data/models/device/device_model.dart';

class WateringHistoryController extends GetxController {
  final DetailDeviceUseCase detailDeviceUseCase;
  final GetHistoriesUseCase getHistoriesUseCase;
  final GetUpdatedAtUseCase getUpdatedAtUseCase;

  var deviceId = ''.obs;
  var deviceDetail = DeviceEntity().obs;
  var updatedAt = ''.obs;
  var histories = <WateringHistoryEntity>[].obs;
  late StreamSubscription<String> _subUpdatedAt;

  WateringHistoryController({
    required this.detailDeviceUseCase,
    required this.getHistoriesUseCase,
    required this.getUpdatedAtUseCase,
  });

  @override
  void onInit() async{
    super.onInit();
    deviceId.value = Get.arguments;
    await getDetailDevice();
    await getHistories();

    // updated at
    _subUpdatedAt =
        getUpdatedAtUseCase(deviceId: deviceId.value).listen((value) {
      updatedAt.value = value;
      LogPrint.debug("~device getUpadatedAt : $value");
    });
  }

  @override
  void onClose() {
    super.onClose();
    _subUpdatedAt.cancel();
  }

  Future<void> getDetailDevice() async {
    try{
      final response = await detailDeviceUseCase(deviceId: deviceId.value);
      Map<String, dynamic> payload = response?.data;

      if(response?.statusCode == HttpStatus.ok){
        deviceDetail.value = DeviceModel.fromJson(payload['data']).toEntity();
      }else{
        Fluttertoast.showToast(msg: "Gagal mendapatakan data Device : ${payload['message']}");
      }
    }catch(ex, s){
      LogPrint.exception(ex, s, this, 'getDetailDevice');
    }
  }

  Future<void> getHistories() async {
    try{
      final response = await getHistoriesUseCase(deviceId: deviceId.value);
      Map<String, dynamic> payload = response?.data;

      if(response?.statusCode == HttpStatus.ok){
        histories.value = WateringHistoryModel.fromListJson(payload['data']).map((e) => e.toEntity()).toList();
      }else{
        Fluttertoast.showToast(msg: "Gagal mendapatakan history : ${payload['message']}");
      }
    }catch(ex, s){
      LogPrint.exception(ex, s, this, 'getHistories');
    }
  }
}
