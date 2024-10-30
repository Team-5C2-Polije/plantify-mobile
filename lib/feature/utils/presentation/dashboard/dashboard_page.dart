import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomato_leaf/core/styles/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomato_leaf/core/styles/app_sizes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tomato_leaf/feature/device/presentation/detail_device/detail_device_page.dart';
import 'package:tomato_leaf/feature/device/presentation/update_device/update_device_page.dart';
import 'package:tomato_leaf/feature/profile/presentation/notification/notification_page.dart';
import 'package:tomato_leaf/feature/profile/presentation/profile/profile_page.dart';

class DashboardPage extends StatelessWidget {
  static String routeName = '/dashboard';

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Container(
                width: double.infinity,
                height: 115.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: AppSizes.radiusMedium,
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi Selamat Datang",
                            style: GoogleFonts.raleway(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Andhung Gusti",
                            style: GoogleFonts.raleway(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.toNamed(NotificationPage.routeName.toString());
                              },
                              child: SvgPicture.asset(
                                'assets/icons/ic-notif.svg',
                                width: 25.w,
                                height: 25.h,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            GestureDetector(
                              onTap: (){
                                Get.toNamed(ProfilePage.routeName.toString());
                              },
                              child: SizedBox(
                                width: 30.w,
                                height: 30.h,
                                child: const Icon(
                                  Icons.account_circle_sharp,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 75,
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: AppSizes.radiusMedium,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Cari Nama Device .... ",
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                            SvgPicture.asset('assets/icons/ic-search.svg'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    flex: 15,
                    child: GestureDetector(
                      onTap: (){
                        Get.toNamed(UpdateDevicePage.routeName.toString());
                      },
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: AppSizes.radiusMedium,
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 4,
                            )),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      Get.toNamed(DetailDevicePage.routeName.toString());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Container(
                        width: double.infinity,
                        height: 110.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffD9D9D9),
                          borderRadius: AppSizes.radiusMedium,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "DEVICE ${++index}",
                                    style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: const Color(0xff405268),
                                    ),
                                  ),
                                  Text(
                                    "2024-10-10 17:00",
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff405268),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/ic-water-gray.svg',
                                      ),
                                      SizedBox(width: 3.w),
                                      Text(
                                        "48",
                                        style: GoogleFonts.inter(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      SvgPicture.asset(
                                        'assets/icons/ic-sun.svg',
                                      ),
                                      SizedBox(width: 3.w),
                                      Text(
                                        "300",
                                        style: GoogleFonts.inter(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/icons/ic-tree.svg')
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
