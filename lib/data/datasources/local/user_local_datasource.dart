import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:tomato_leaf/core/services/isar_service.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';
import 'package:tomato_leaf/domain/entities/user/user_entity.dart';

class UserLocalDataSource{
  final IsarService isarService = Get.find<IsarService>();
  Isar get isar => isarService.isar;

  Future<void> addOrUpdateUser(UserEntity? user) async {
    try {
      if (user == null) return;
      await isar.writeTxn(() async {
        await isar.userEntitys.clear();
        await isar.userEntitys.put(user);
        LogPrint.info('User saved : ${user.email}');
      });
    } catch (ex, s) {
      LogPrint.exception(ex, s, this, 'addOrUpdateUser');
    }
  }
}