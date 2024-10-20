import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tomato_leaf/core/routes/app_routes.dart';
import 'package:tomato_leaf/core/styles/app_sizes.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';
import 'package:tomato_leaf/feature/utils/presentation/splash_screen/splash_screen_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Size _getDesignSize(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width > 1024) {
      // Desktop / Laptop
      return const Size(1440, 900); // Ukuran yang lebih besar untuk desktop
    } else if (width > 768 && width <= 1024) {
      // Tablet Besar
      return const Size(
          1024 * 1.2, 1366 * 1.2); // Ukuran untuk tablet besar seperti iPad Pro
    } else if (width > 600 && width <= 768) {
      // Tablet Kecil hingga Menengah
      return const Size(
          768 * 1.2, 1024 * 1.2); // Ukuran untuk tablet kecil hingga menengah
    } else {
      // Smartphone
      return const Size(375, 812); // Ukuran standar untuk smartphone
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

          // Kondisi untuk mendeteksi tablet atau handphone berdasarkan ukuran layar
          if (MediaQuery.of(context).size.shortestSide < 600) {
            // Jika lebar layar kurang dari 600dp, maka dianggap sebagai handphone
            initSize = 1.0;
          } else {
            // Jika lebih besar, maka dianggap sebagai tablet
            initSize = 4.5;
          }

          // Inisialisasi ukuran berdasarkan perangkat
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
