import 'package:get/get.dart';
import 'package:tomato_leaf/feature/device/presentation/detail_device/detail_device_binding.dart';
import 'package:tomato_leaf/feature/device/presentation/detail_device/detail_device_page.dart';
import 'package:tomato_leaf/feature/sensor/presentation/light_intensity/light_intensity_binding.dart';
import 'package:tomato_leaf/feature/sensor/presentation/light_intensity/light_intensity_page.dart';
import 'package:tomato_leaf/feature/sensor/presentation/volume/volume_binding.dart';
import 'package:tomato_leaf/feature/sensor/presentation/volume/volume_page.dart';
import 'package:tomato_leaf/feature/utils/presentation/auth/auth_binding.dart';
import 'package:tomato_leaf/feature/utils/presentation/auth/auth_page.dart';
import 'package:tomato_leaf/feature/utils/presentation/dashboard/dashboard_binding.dart';
import 'package:tomato_leaf/feature/utils/presentation/dashboard/dashboard_page.dart';
import 'package:tomato_leaf/feature/utils/presentation/splash_screen/splash_screen_binding.dart';
import 'package:tomato_leaf/feature/utils/presentation/splash_screen/splash_screen_page.dart';

class AppRoutes {
  static const String initialRoute = "/splash_screen";

  static final routes = [
    GetPage(
      name: SplashScreenPage.routeName.toString(),
      page: () => const SplashScreenPage(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AuthPage.routeName.toString(),
      page: () => const AuthPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: DashboardPage.routeName.toString(),
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: DetailDevicePage.routeName.toString(),
      page: () => const DetailDevicePage(),
      binding: DetailDeviceBinding(),
    ),
    GetPage(
      name: VolumePage.routeName.toString(),
      page: () => const VolumePage(),
      binding: VolumeBinding(),
    ),
    GetPage(
      name: LightIntensityPage.routeName.toString(),
      page: () => const LightIntensityPage(),
      binding: LightIntensityBinding(),
    ),
  ];
}
