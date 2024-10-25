import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomato_leaf/core/widgets/device_top.dart';
import 'package:tomato_leaf/feature/device/presentation/components/item_feature.dart';

class DetailDevicePage extends StatelessWidget {
  static String routeName = '/detail_device_page';

  const DetailDevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40.h, 25, 0),
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
            const DeviceTop(
              deviceName: 'Device Name',
              photo: 'assets/images/img-device.png',
              indicator: '(-20 / 50)',
              lastWatering: '07:00',
              nextWatering: '15:00',
            ),
            SizedBox(height: 50.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemFeature(
                  imagePath: 'assets/icons/ic-water-blue.svg',
                  title: "Volume Air",
                  value: "40%",
                ),
                ItemFeature(
                  imagePath: 'assets/icons/ic-sun-orange.svg',
                  title: "Intensitas Cahaya",
                  value: "300",
                ),
              ],
            ),
            SizedBox(height: 20.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemFeature(
                  imagePath: 'assets/icons/ic-plant.svg',
                  title: "Jadwal Penyiraman",
                  value: "5",
                ),
                ItemFeature(
                  imagePath: 'assets/icons/ic-photos.svg',
                  title: "Total Foto",
                  value: "50",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

