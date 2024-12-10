import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomato_leaf/core/styles/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomato_leaf/core/styles/app_sizes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tomato_leaf/core/utils/datetime_converter.dart';
import 'package:tomato_leaf/feature/profile/presentation/notification/notification_page.dart';
import 'package:tomato_leaf/feature/profile/presentation/profile/profile_page.dart';
import 'package:tomato_leaf/feature/utils/presentation/dashboard/dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  static String routeName = '/dashboard';

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        return !controller.isLoading.value
            ? SingleChildScrollView(
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
                                    controller.userData.value.fullname ??
                                        'NULL',
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
                                      onTap: () {
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
                                      onTap: () {
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
                      DashboardAction(controller: controller),
                      Obx(() {
                        return ListView.builder(
                          itemCount: controller.filteredDevices.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var device = controller.filteredDevices[index];
                            return GestureDetector(
                              onTap: () async {
                                controller.goToDetailDevice(index: index);
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${device.name}",
                                              style: GoogleFonts.inter(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w800,
                                                color: const Color(0xff405268),
                                              ),
                                            ),
                                            Text(
                                              "${DateTimeConverter.toUpdatedAtStyle(device.updatedAt)}",
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/ic-water-gray.svg',
                                                ),
                                                SizedBox(width: 3.w),
                                                Text(
                                                  "${device.sensors?.waterVol ?? 0}",
                                                  style: GoogleFonts.inter(
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(width: 10.w),
                                                SvgPicture.asset(
                                                  'assets/icons/ic-sun.svg',
                                                ),
                                                SizedBox(width: 3.w),
                                                Text(
                                                  "${device.sensors?.lightIntensity ?? 0}",
                                                  style: GoogleFonts.inter(
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    showSheet(context, controller, index);
                                                  },
                                                  child: SvgPicture.asset(
                                                    'assets/icons/ic-tree.svg',
                                                    width: 10,
                                                    height: 10,
                                                  ),
                                                )
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
                        );
                      }),
                    ],
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}

class DashboardAction extends StatelessWidget {
  const DashboardAction({
    super.key,
    required this.controller,
  });

  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Cari Nama Device ....",
                        hintStyle: GoogleFonts.poppins(color: Colors.white),
                        border: InputBorder.none,
                      ),
                      style: GoogleFonts.poppins(color: Colors.white),
                      textInputAction: TextInputAction.search,
                      onChanged: (text) {
                        controller.filterDevices(text);
                      },
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/ic-search.svg',
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(width: 5.w),
        Expanded(
          flex: 15,
          child: GestureDetector(
            onTap: () {
              controller.goToUpdateDeviceAddMode();
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
    );
  }
}

void showSheet(
  BuildContext context,
  DashboardController controller,
  int index,
) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit'),
              onTap: () {
                Get.back();
                controller.goToUpdateDeviceEditMode(index: index);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.delete,
              ),
              title: const Text('Hapus'),
              onTap: () {
                Get.back();
                controller.confirmDelete(
                  context,
                  index,
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
