import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tomato_leaf/feature/device/presentation/components/item_feature.dart';
import 'package:tomato_leaf/feature/sensor/presentation/watering_manually/watering_manually_page.dart';

import '../../../../core/widgets/device_page.dart';

class LightIntensityPage extends StatelessWidget {
  static const routeName = '/light_intensity_page';

  const LightIntensityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageTitle(
        pageTitle: 'Intensitas Cahaya',
        deviceName: 'Device Name',
        photo: 'assets/images/img-device.png',
        indicator: '(-20 / 50)',
        lastWatering: '07:00',
        nextWatering: '15:00',
        child: ItemFeature(
          imagePath: 'assets/icons/ic-sun-orange.svg',
          title: 'Intensitas Cahaya',
          value: '400',
          width: double.infinity,
          height: 180.h,
          onTap: () {
            Get.toNamed(WateringManuallyPage.routeName.toString());
          },
        ),
      ),
    );
  }
}


