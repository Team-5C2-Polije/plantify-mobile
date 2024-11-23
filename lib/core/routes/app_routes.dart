import 'package:get/get.dart';
import 'package:tomato_leaf/feature/device/presentation/detail_device/detail_device_binding.dart';
import 'package:tomato_leaf/feature/device/presentation/detail_device/detail_device_page.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/detail_photo/detail_photo_binding.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/detail_photo/detail_photo_page.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/list_photo/list_photo_binding.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/list_photo/list_photo_page.dart';
import 'package:tomato_leaf/feature/device/presentation/update_device/update_device_binding.dart';
import 'package:tomato_leaf/feature/device/presentation/update_device/update_device_page.dart';
import 'package:tomato_leaf/feature/device/presentation/watering_history/watering_history_binding.dart';
import 'package:tomato_leaf/feature/device/presentation/watering_history/watering_history_page.dart';
import 'package:tomato_leaf/feature/device/presentation/watering_manually/watering_manually_binding.dart';
import 'package:tomato_leaf/feature/device/presentation/watering_manually/watering_manually_page.dart';
import 'package:tomato_leaf/feature/profile/presentation/notification/notification_binding.dart';
import 'package:tomato_leaf/feature/profile/presentation/notification/notification_page.dart';
import 'package:tomato_leaf/feature/profile/presentation/profile/profile_binding.dart';
import 'package:tomato_leaf/feature/profile/presentation/profile/profile_page.dart';
import 'package:tomato_leaf/feature/schedule/presentation/create_schedule/create_schedule_binding.dart';
import 'package:tomato_leaf/feature/schedule/presentation/create_schedule/create_schedule_page.dart';
import 'package:tomato_leaf/feature/schedule/presentation/list_schedule/list_schedule_binding.dart';
import 'package:tomato_leaf/feature/schedule/presentation/list_schedule/list_schedule_page.dart';
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
    GetPage(
      name: ListSchedulePage.routeName.toString(),
      page: () => const ListSchedulePage(),
      binding: ListScheduleBinding(),
    ),
    GetPage(
      name: WateringHistoryPage.routeName.toString(),
      page: () => const WateringHistoryPage(),
      binding: WateringHistoryBinding(),
    ),
    GetPage(
      name: CreateSchedulePage.routeName.toString(),
      page: () => const CreateSchedulePage(),
      binding: CreateScheduleBinding(),
    ),
    GetPage(
      name: ProfilePage.routeName.toString(),
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: NotificationPage.routeName.toString(),
      page: () => const NotificationPage(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: UpdateDevicePage.routeName.toString(),
      page: () => const UpdateDevicePage(),
      binding: UpdateDeviceBinding(),
    ),
    GetPage(
      name: ListPhotoPage.routeName.toString(),
      page: () => const ListPhotoPage(),
      binding: ListPhotoBinding(),
    ),
    GetPage(
      name: DetailPhotoPage.routeName.toString(),
      page: () => const DetailPhotoPage(),
      binding: DetailPhotoBinding(),
    ),
    GetPage(
      name: WateringManuallyPage.routeName.toString(),
      page: () => const WateringManuallyPage(),
      binding: WateringManuallyBinding(),
    ),
  ];
}
