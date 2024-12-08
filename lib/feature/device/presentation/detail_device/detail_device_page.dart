import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomato_leaf/core/widgets/device_top.dart';
import 'package:tomato_leaf/feature/device/presentation/components/item_feature.dart';
import 'package:tomato_leaf/feature/device/presentation/detail_device/detail_device_controller.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/list_photo/list_photo_page.dart';

class DetailDevicePage extends StatelessWidget {
  static String routeName = '/detail_device_page';

  const DetailDevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    DetailDeviceController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40.h, 25, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              Text(
                "Informasi Device",
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 15),
              Obx(() {
                return DeviceTop(
                  deviceName: '${controller.deviceDetail.value.name}',
                  photo: 'assets/images/img-device.png',
                  token: '${controller.deviceDetail.value.token}',
                  updatedAt: '${controller.updatedAt}',
                );
              }),
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    return ItemFeature(
                      imagePath: 'assets/icons/ic-water-blue.svg',
                      title: "Volume Air",
                      value: "${controller.waterVol.value}%",
                      onTap: () {
                        // Get.toNamed(VolumePage.routeName.toString());
                      },
                    );
                  }),
                  Obx(() {
                    return ItemFeature(
                      imagePath: 'assets/icons/ic-sun-orange.svg',
                      title: "Intensitas Cahaya",
                      value: "${controller.lightIntensity.value}",
                      onTap: () {
                        // Get.toNamed(LightIntensityPage.routeName.toString());
                      },
                    );
                  }),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    return ItemFeature(
                      imagePath: 'assets/icons/ic_temperature.svg',
                      title: "Temperature",
                      value: "${controller.temperature.value}°C",
                      onTap: () {
                        // Get.toNamed(VolumePage.routeName.toString());
                      },
                    );
                  }),
                  Obx(() {
                    return ItemFeature(
                      imagePath: 'assets/icons/ic_soil.svg',
                      title: "Kelembapan",
                      value: "${controller.soilMoisture.value}",
                      onTap: () {
                        // Get.toNamed(LightIntensityPage.routeName.toString());
                      },
                    );
                  }),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    return ItemFeature(
                      imagePath: 'assets/icons/ic-plant.svg',
                      title: "Histori Penyiraman",
                      value: "${controller.deviceDetail.value.totalHistory ??
                          0}",
                      onTap: () {
                        controller.goToWateringHistory();
                      },
                    );
                  }),
                  Obx(() {
                    return ItemFeature(
                      imagePath: 'assets/icons/ic-photos.svg',
                      title: "Total Foto",
                      value: "${controller.deviceDetail.value.totalPhoto ?? 0}",
                      onTap: () {
                        controller.goToPhotoList();
                      },
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
