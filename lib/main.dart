import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tomato_leaf/core/routes/app_routes.dart';
import 'package:tomato_leaf/core/services/dio_service.dart';
import 'package:tomato_leaf/core/services/isar_service.dart';
import 'package:tomato_leaf/core/styles/app_sizes.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';
import 'package:tomato_leaf/data/datasources/local/user_local_datasource.dart';
import 'package:tomato_leaf/data/datasources/remote/user_remote_datasource.dart';
import 'package:tomato_leaf/data/repositories/user_repository_impl.dart';
import 'package:tomato_leaf/domain/repositories/user_repository.dart';
import 'package:tomato_leaf/domain/usecases/add_or_update_user_usecase.dart';
import 'package:tomato_leaf/domain/usecases/auth_usecase.dart';
import 'package:tomato_leaf/feature/utils/presentation/splash_screen/splash_screen_page.dart';

import 'core/utils/fcm_token_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Get.putAsync<IsarService>(() async => await IsarService().init());
  await Get.putAsync<DioService>(() async => DioService());

  Get.lazyPut<UserLocalDataSource>(() => UserLocalDataSource());
  Get.lazyPut<UserRemoteDataSource>(() => UserRemoteDataSource());
  Get.lazyPut<UserRepository>(() =>
      UserRepositoryImpl(
        authRemoteDataSource: Get.find<UserRemoteDataSource>(),
        authLocalDataSource: Get.find<UserLocalDataSource>(),
      ));
  Get.lazyPut(() => AuthUseCase(Get.find<UserRepository>()));
  Get.lazyPut(() => AddOrUpdateUserUseCase(Get.find<UserRepository>()));

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Size _getDesignSize(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width > 1024) {
      return const Size(1440, 900);
    } else if (width > 768 && width <= 1024) {
      return const Size(
          1024 * 1.2, 1366 * 1.2);
    } else if (width > 600 && width <= 768) {
      return const Size(
          768 * 1.2, 1024 * 1.2);
    } else {
      return const Size(375, 812);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: _getDesignSize(context),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          double initSize;
          if (MediaQuery.of(context).size.shortestSide < 600) {
            initSize = 1.0;
          } else {
            initSize = 4.5;
          }

          AppSizes.init(context, initSize);

          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            initialRoute: SplashScreenPage.routeName.toString(),
            getPages: AppRoutes.routes,
            themeMode: ThemeMode.dark,
          );
        });
  }
}
