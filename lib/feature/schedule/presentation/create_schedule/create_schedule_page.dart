import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomato_leaf/core/styles/app_colors.dart';
import 'package:tomato_leaf/core/widgets/device_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateSchedulePage extends StatelessWidget {
  static String routeName = '/create_schedule';

  const CreateSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageTitle(
        pageTitle: 'Buat Jadwal',
        deviceName: 'Device Name',
        photo: 'assets/images/img-device.png',
        token: '(-20 / 50)',
        updatedAt: '15:00',
        space: 5,
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Jam Penyiraman",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.h),
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "08:00",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    const Icon(
                      Icons.calendar_month,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 100.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Simpan",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
