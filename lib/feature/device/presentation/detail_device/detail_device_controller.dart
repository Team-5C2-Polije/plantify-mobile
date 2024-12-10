import 'dart:async';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';
import 'package:tomato_leaf/data/models/device/device_model.dart';
import 'package:tomato_leaf/domain/entities/device/device_entity.dart';
import 'package:tomato_leaf/domain/usecases/device/detail_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/get_sensor_value_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/get_updated_at_usecase.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/list_photo/list_photo_page.dart';
import 'package:tomato_leaf/feature/device/presentation/watering_history/watering_history_page.dart';

class DetailDeviceController extends GetxController {
  final DetailDeviceUseCase detailDeviceUseCase;
  final GetSensorValueUseCase getSensorValueUseCase;
  final GetUpdatedAtUseCase getUpdatedAtUseCase;

  var deviceId = ''.obs;
  var lightIntensity = Rx<num>(0);
  var waterVol = Rx<num>(0);
  var temperature = Rx<num>(0);
  var soilMoisture = Rx<num>(0);
  var updatedAt = ''.obs;
  var deviceDetail = DeviceEntity().obs;
  late StreamSubscription<num> _subLightIntensity;
  late StreamSubscription<num> _subVolume;
  late StreamSubscription<num> _subTemperature;
  late StreamSubscription<num> _subSoilMoisture;
  late StreamSubscription<String> _subUpdatedAt;

  DetailDeviceController({
    required this.detailDeviceUseCase,
    required this.getSensorValueUseCase,
    required this.getUpdatedAtUseCase,
  });

  @override
  void onInit() async {
    super.onInit();
    deviceId.value = Get.arguments ?? '';
    await getDetailDevice();
    // lightIntensity sensor
    _subLightIntensity =
        getSensorValueUseCase(deviceId: deviceId.value, data: 'lightIntensity')
            .listen((value) {
      lightIntensity.value = value;
      LogPrint.debug("~device getSensorValueUseCase-lightIntensity : $value");
    });

    // water volume
    _subVolume =
        getSensorValueUseCase(deviceId: deviceId.value, data: 'waterVol')
            .listen((value) {
      waterVol.value = value;
      LogPrint.debug("~device getSensorValueUseCase-waterVol : $value");
    });

    // temperature
    _subTemperature =
        getSensorValueUseCase(deviceId: deviceId.value, data: 'temperature')
            .listen((value) {
      temperature.value = value;
      LogPrint.debug("~device getSensorValueUseCase-temperature : $value");
    });

    // soil moisture
    _subSoilMoisture =
        getSensorValueUseCase(deviceId: deviceId.value, data: 'soilMoisture')
            .listen((value) {
      soilMoisture.value = value;
      LogPrint.debug("~device getSensorValueUseCase-soilMoisture : $value");
    });

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
    _subLightIntensity.cancel();
    _subVolume.cancel();
    _subSoilMoisture.cancel();
    _subTemperature.cancel();
    _subUpdatedAt.cancel();
  }

  Future<void> getDetailDevice() async {
    try {
      final response = await detailDeviceUseCase(deviceId: deviceId.value);
      Map<String, dynamic> payload = response?.data;

      if (response?.statusCode == HttpStatus.ok) {
        deviceDetail.value = DeviceModel.fromJson(payload['data']).toEntity();
      } else {
        Fluttertoast.showToast(
            msg: "Gagal mendapatakan data Device : ${payload['message']}");
      }
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'getDetailDevice');
    }
  }

  Future<void> goToWateringHistory() async {
    Get.toNamed(
      WateringHistoryPage.routeName.toString(),
      arguments: deviceId.value,
    );
  }

  Future<void> goToPhotoList() async {
    Get.toNamed(
      ListPhotoPage.routeName.toString(),
      arguments: deviceId.value,
    );
  }
}
