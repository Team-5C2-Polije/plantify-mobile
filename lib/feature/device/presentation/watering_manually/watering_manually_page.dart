import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomato_leaf/core/styles/app_colors.dart';
import 'package:tomato_leaf/core/widgets/device_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomato_leaf/feature/device/presentation/components/item_feature.dart';

class WateringManuallyPage extends StatelessWidget {
  static String routeName = '/watering_manually';

  const WateringManuallyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: PageTitle(
          pageTitle: 'Penyiraman Manual',
          deviceName: 'Device Name',
          photo: 'assets/images/img-device.png',
          token: '(-20 / 50)',
          updatedAt: '15:00',
          space: 50.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 250.h,
                height: 250.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: Center(
                  child: Text(
                    "Hidupkan Penyiraman",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              ItemFeature(
                imagePath: 'assets/icons/ic-water-blue.svg',
                title: 'Volume Air',
                value: '40%',
                width: double.infinity,
                height: 180.h,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
