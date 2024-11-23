import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:tomato_leaf/core/services/isar_service.dart';

class DeviceLocalDataSource {
  final IsarService isarService = Get.find<IsarService>();

  Isar get isar => isarService.isar;
}