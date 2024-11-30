import 'package:get/get.dart';
import 'package:tomato_leaf/core/routes/app_routes.dart';
import 'package:tomato_leaf/domain/usecases/user/is_login_usecase.dart';
import 'package:tomato_leaf/feature/utils/presentation/auth/auth_page.dart';
import 'package:tomato_leaf/feature/utils/presentation/dashboard/dashboard_page.dart';

class SplashScreenController extends GetxController {
  final IsLoginUseCase isLoginUseCase;

  SplashScreenController({
    required this.isLoginUseCase,
  });

  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 2));
    if(await isLoginUseCase()){
      Get.offAllNamed(DashboardPage.routeName.toString());
    }else{
      Get.offAllNamed(AuthPage.routeName.toString());
    }
  }
}
