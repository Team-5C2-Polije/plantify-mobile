import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomato_leaf/core/styles/app_colors.dart';
import 'package:tomato_leaf/core/styles/app_sizes.dart';
import 'package:tomato_leaf/core/utils/datetime_converter.dart';
import 'package:tomato_leaf/core/widgets/device_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomato_leaf/feature/device/presentation/watering_history/watering_history_controller.dart';

class WateringHistoryPage extends StatelessWidget {
  static String routeName = '/watering_history';

  const WateringHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    WateringHistoryController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        return PageTitle(
          pageTitle: 'History Penyiraman',
          deviceName: '${controller.deviceDetail.value.name}',
          photo: 'assets/images/img-device.png',
          token: '${controller.deviceDetail.value.token}',
          updatedAt: '${controller.updatedAt}',
          space: 5,
          child: ListView.builder(
            itemCount: controller.histories.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var history = controller.histories[index];
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
                              "${history.lightIntensity} / ${history.waterVol}%",
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${DateTimeConverter.toUpdatedAtStyle(history.createdAt)}",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
