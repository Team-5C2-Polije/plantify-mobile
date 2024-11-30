import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomato_leaf/core/routes/app_routes.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';
import 'package:tomato_leaf/domain/entities/user/user_entity.dart';
import 'package:tomato_leaf/domain/usecases/user/get_current_login_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/logout_from_local_usecase.dart';
import 'package:tomato_leaf/feature/utils/presentation/auth/auth_page.dart';

class ProfileController extends GetxController {
  final GetCurrentLoginUseCase getCurrentLoginUseCase;
  final LogoutFromLocalUseCase logoutFromLocalUseCase;

  var userData = UserEntity().obs;

  ProfileController({
    required this.getCurrentLoginUseCase,
    required this.logoutFromLocalUseCase,
  });

  @override
  void onInit() async {
    super.onInit();
    await fetchData();
  }

  Future<void> fetchData() async {
    try{
      userData.value = await getCurrentLoginUseCase() ?? UserEntity();
    }catch(ex, s){
      LogPrint.exception(ex, s, this, 'fetchData');
    }
  }

  Future<void> confirmLogout(BuildContext context) async {
    try{
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Konfirmasi Logout'),
            content: const Text('Apakah Anda yakin ingin Logout dari Aplikasi?'),
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
                  await logout();
                },
                child: const Text('Logout'),
              ),
            ],
          );
        },
      );
    }catch(ex, s){
      LogPrint.exception(ex, s, this, 'confirmLogout');
    }
  }

  Future<void> logout() async {
    try{
      await logoutFromLocalUseCase();
      Get.offAllNamed(AuthPage.routeName.toString());
    }catch(ex, s){
      LogPrint.exception(ex, s, this, 'logout');
    }
  }
}
