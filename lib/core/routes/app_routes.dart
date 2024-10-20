import 'package:get/get.dart';
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
  ];
}
