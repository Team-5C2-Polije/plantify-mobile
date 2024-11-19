import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tomato_leaf/domain/entities/user/user_entity.dart';

class IsarService extends GetxService {
  late Isar isar;

  Future<IsarService> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [
        UserEntitySchema,
      ], // Schema Isar
      directory: dir.path,
    );
    await clearAllData();
    return this;
  }
  Future<void> clearAllData() async {
    await isar.writeTxn(() async {
      // await isar.studentEntitys.clear();
    });
  }
}
