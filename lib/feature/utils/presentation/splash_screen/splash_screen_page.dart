import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomato_leaf/core/styles/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  static String routeName = '/splash_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.w,
                vertical: 50.h,
              ),
              child: Image.asset('assets/images/img-splash.png'),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.w,
                vertical: 120.h,
              ),
              child: Column(
                children: [
                  Text(
                    "Welcome",
                    style: GoogleFonts.raleway(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                  Text(
                    "To",
                    style: GoogleFonts.raleway(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                  Text(
                    "Tomato Leaf",
                    style: GoogleFonts.raleway(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Image.asset(
                    'assets/images/img-logo.png',
                    width: 200.w,
                    height: 200.h,
                  ),
                  SizedBox(height: 40.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "Plant sensors and automatic watering",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        fontSize: 37,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "Plant sensors and automatic watering",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        height: 1.1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
