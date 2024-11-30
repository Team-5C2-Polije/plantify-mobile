import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tomato_leaf/core/routes/app_routes.dart';
import 'package:tomato_leaf/core/services/dio_service.dart';
import 'package:tomato_leaf/core/services/isar_service.dart';
import 'package:tomato_leaf/core/styles/app_sizes.dart';
import 'package:tomato_leaf/data/datasources/local/device_local_datasource.dart';
import 'package:tomato_leaf/data/datasources/local/user_local_datasource.dart';
import 'package:tomato_leaf/data/datasources/remote/device_remote_datasource.dart';
import 'package:tomato_leaf/data/datasources/remote/user_remote_datasource.dart';
import 'package:tomato_leaf/data/repositories/device_repository_impl.dart';
import 'package:tomato_leaf/data/repositories/user_repository_impl.dart';
import 'package:tomato_leaf/domain/repositories/device_repository.dart';
import 'package:tomato_leaf/domain/repositories/user_repository.dart';
import 'package:tomato_leaf/domain/usecases/device/add_photo_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/add_schedule_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/delete_schedule_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/detail_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/get_detail_photo_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/get_histories_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/get_photos_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/my_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/update_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/device/update_schedule_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/add_or_update_user_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/add_user_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/auth_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/delete_user_device_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/get_current_login_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/get_device_ids_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/is_login_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/logout_from_local_usecase.dart';
import 'package:tomato_leaf/feature/utils/presentation/splash_screen/splash_screen_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Get.putAsync<IsarService>(() async => await IsarService().init());
  await Get.putAsync<DioService>(() async => DioService());

  // user
  Get.lazyPut<UserLocalDataSource>(() => UserLocalDataSource());
  Get.lazyPut<UserRemoteDataSource>(() => UserRemoteDataSource());
  Get.lazyPut<UserRepository>(() =>
      UserRepositoryImpl(
        authRemoteDataSource: Get.find<UserRemoteDataSource>(),
        authLocalDataSource: Get.find<UserLocalDataSource>(),
      ));
  Get.lazyPut<AuthUseCase>(() => AuthUseCase(Get.find<UserRepository>()));
  Get.lazyPut<AddOrUpdateUserUseCase>(() => AddOrUpdateUserUseCase(Get.find<UserRepository>()));
  Get.lazyPut<AddUserDeviceUseCase>(() => AddUserDeviceUseCase(Get.find<UserRepository>()));
  Get.lazyPut<IsLoginUseCase>(() => IsLoginUseCase(Get.find<UserRepository>()));
  Get.lazyPut<LogoutFromLocalUseCase>(() => LogoutFromLocalUseCase(Get.find<UserRepository>()));
  Get.lazyPut<GetDeviceIdsUseCase>(() => GetDeviceIdsUseCase(Get.find<UserRepository>()));
  Get.lazyPut<GetCurrentLoginUseCase>(() => GetCurrentLoginUseCase(Get.find<UserRepository>()));

  // device
  Get.lazyPut<DeviceLocalDataSource>(() => DeviceLocalDataSource());
  Get.lazyPut<DeviceRemoteDataSource>(() => DeviceRemoteDataSource());
  Get.lazyPut<DeviceRepository>(() => DeviceRepositoryImpl(
        deviceLocalDataSource: Get.find<DeviceLocalDataSource>(),
        deviceRemoteDataSource: Get.find<DeviceRemoteDataSource>(),
      ));
  Get.lazyPut<AddPhotoUseCase>(() => AddPhotoUseCase(Get.find<DeviceRepository>()));
  Get.lazyPut<AddScheduleUseCase>(() => AddScheduleUseCase(Get.find<DeviceRepository>()));
  Get.lazyPut<DeleteScheduleUseCase>(() => DeleteScheduleUseCase(Get.find<DeviceRepository>()));
  Get.lazyPut<DetailDeviceUseCase>(() => DetailDeviceUseCase(Get.find<DeviceRepository>()));
  Get.lazyPut<GetDetailPhotoUseCase>(() => GetDetailPhotoUseCase(Get.find<DeviceRepository>()));
  Get.lazyPut<GetHistoriesUseCase>(() => GetHistoriesUseCase(Get.find<DeviceRepository>()));
  Get.lazyPut<GetPhotosUseCase>(() => GetPhotosUseCase(Get.find<DeviceRepository>()));
  Get.lazyPut<MyDeviceUseCase>(() => MyDeviceUseCase(Get.find<DeviceRepository>()));
  Get.lazyPut<UpdateDeviceUseCase>(() => UpdateDeviceUseCase(Get.find<DeviceRepository>()));
  Get.lazyPut<UpdateScheduleUseCase>(() => UpdateScheduleUseCase(Get.find<DeviceRepository>()));

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
