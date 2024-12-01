import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomato_leaf/core/widgets/device_page.dart';
import 'package:tomato_leaf/core/widgets/device_top.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomato_leaf/feature/device/presentation/components/item_feature.dart';

class VolumePage extends StatelessWidget {
  static String routeName = '/volume_page';

  const VolumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageTitle(
        pageTitle: 'Intensitas Cahaya',
        deviceName: 'Device Name',
        photo: 'assets/images/img-device.png',
        token: '(-20 / 50)',
        updatedAt: '15:00',
        child: ItemFeature(
          imagePath: 'assets/icons/ic-water-blue.svg',
          title: 'Volume Air',
          value: '40%',
          width: double.infinity,
          height: 180.h,
          onTap: () {},
        ),
      ),
    );
  }
}
