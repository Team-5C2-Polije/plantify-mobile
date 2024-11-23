import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomato_leaf/core/styles/app_colors.dart';
import 'package:tomato_leaf/core/styles/app_sizes.dart';
import 'package:tomato_leaf/core/widgets/device_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomato_leaf/feature/device/presentation/watering_history/watering_history_page.dart';
import 'package:tomato_leaf/feature/schedule/presentation/create_schedule/create_schedule_page.dart';

class ListSchedulePage extends StatelessWidget {
  static String routeName = '/list_schedule';

  const ListSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageTitle(
        pageTitle: 'Jadwal Penyiraman',
        deviceName: 'Device Name',
        photo: 'assets/images/img-device.png',
        indicator: '(-20 / 50)',
        lastWatering: '07:00',
        nextWatering: '15:00',
        space: 5,
        child: Column(
          children: [
            ListView.builder(
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
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "08:00",
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.delete,
                                size: 35,
                              ),
                              Switch(
                                value: false,
                                onChanged: (s) {
                                  //
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                Get.toNamed(WateringHistoryPage.routeName.toString());
              },
              child: Container(
                width: 100.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "List History",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 120.w),
            GestureDetector(
              onTap: () {
                Get.toNamed(CreateSchedulePage.routeName.toString());
              },
              child: Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 3,
                  ),
                ),
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
