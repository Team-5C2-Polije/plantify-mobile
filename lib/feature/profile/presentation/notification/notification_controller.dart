import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tomato_leaf/data/models/user/user_notification_model.dart';
import 'package:tomato_leaf/domain/entities/user/user_entity.dart';
import 'package:tomato_leaf/domain/entities/user/user_notification_entity.dart';
import 'package:tomato_leaf/domain/usecases/user/get_current_login_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/notifications_usecase.dart';

import '../../../../core/utils/log_print.dart';

class NotificationController extends GetxController {
  final GetCurrentLoginUseCase getCurrentLoginUseCase;
  final NotificationsUseCase notificationsUseCase;

  var userData = UserEntity().obs;
  var notifications = <UserNotificationEntity>[].obs;
  var isLoading = false.obs;

  NotificationController({
    required this.getCurrentLoginUseCase,
    required this.notificationsUseCase,
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
      userData.value = await getCurrentLoginUseCase() ?? UserEntity();

      final response = await notificationsUseCase(
        email: userData.value.email ?? '',
      );

      Map<String, dynamic> payload = response?.data;

      if(response?.statusCode == HttpStatus.ok){
        notifications.value =
            UserNotificationModel.fromJsonList(payload['data'])
                .map((e) => e.toEntity())
                .toList();
      }else{
        Fluttertoast.showToast(msg: "Failure : ${payload['message']}");
      }
    }catch(ex, s){
      LogPrint.exception(ex, s, this, 'fetchData');
    }
  }
}
