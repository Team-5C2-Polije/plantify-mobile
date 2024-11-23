import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomato_leaf/core/styles/app_colors.dart';
import 'package:tomato_leaf/core/styles/app_sizes.dart';
import 'package:tomato_leaf/core/widgets/device_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WateringHistoryPage extends StatelessWidget {
  static String routeName = '/watering_history';

  const WateringHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageTitle(
        pageTitle: 'History Penyiraman',
        deviceName: 'Device Name',
        photo: 'assets/images/img-device.png',
        indicator: '(-20 / 50)',
        lastWatering: '07:00',
        nextWatering: '15:00',
        space: 5,
        child: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Container(
                width: double.infinity,
                height: 90.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: AppSizes.radiusSmall,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "08:00",
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "27 September 2024",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      Text(
                        "Manual",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
