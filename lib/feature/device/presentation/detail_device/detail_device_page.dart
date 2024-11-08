import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';
import 'package:tomato_leaf/core/widgets/device_top.dart';
import 'package:tomato_leaf/feature/device/presentation/components/item_feature.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/list_photo/list_photo_page.dart';
import 'package:tomato_leaf/feature/schedule/presentation/list_schedule/list_schedule_page.dart';
import 'package:tomato_leaf/feature/sensor/presentation/light_intensity/light_intensity_page.dart';
import 'package:tomato_leaf/feature/sensor/presentation/volume/volume_page.dart';

class DetailDevicePage extends StatefulWidget {
  static String routeName = '/detail_device_page';

  const DetailDevicePage({super.key});

  @override
  State<DetailDevicePage> createState() => _DetailDevicePageState();
}

class _DetailDevicePageState extends State<DetailDevicePage> {
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();

  String realtimeValue = '-';
  String getOnceValue = '0';

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
  }

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp();
    FirebaseDatabase.instance.ref().child('count').onValue.listen(
      (event) {
        setState(() {
          realtimeValue = event.snapshot.value.toString();
          LogPrint.debug("update realtime $realtimeValue");
        });
      },
      onError: (error) {
        log("Error : $error");
        LogPrint.error("Failed to retrieve data: $error");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: _fApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Something Wrong"));
          } else if (snapshot.hasData) {
            return Padding(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemFeature(
                        imagePath: 'assets/icons/ic-water-blue.svg',
                        title: "Volume Air",
                        value: "40%",
                        onTap: () {
                          Get.toNamed(VolumePage.routeName.toString());
                        },
                      ),
                      ItemFeature(
                        imagePath: 'assets/icons/ic-sun-orange.svg',
                        title: "Intensitas Cahaya",
                        value: "$realtimeValue",
                        onTap: () {
                          Get.toNamed(LightIntensityPage.routeName.toString());
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemFeature(
                        imagePath: 'assets/icons/ic-plant.svg',
                        title: "Jadwal Penyiraman",
                        value: "5",
                        onTap: () {
                          Get.toNamed(ListSchedulePage.routeName.toString());
                        },
                      ),
                      ItemFeature(
                        imagePath: 'assets/icons/ic-photos.svg',
                        title: "Total Foto",
                        value: "50",
                        onTap: () {
                          Get.toNamed(ListPhotoPage.routeName.toString());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
