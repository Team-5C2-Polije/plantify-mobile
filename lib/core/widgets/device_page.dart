import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomato_leaf/core/widgets/device_top.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
    required this.pageTitle,
    required this.deviceName,
    required this.photo,
    required this.indicator,
    required this.lastWatering,
    required this.nextWatering,
    required this.child,
  });

  final String pageTitle;
  final String deviceName;
  final String photo;
  final String indicator;
  final String lastWatering;
  final String nextWatering;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 40.h, 25, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          Text(
            pageTitle,
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 15),
          DeviceTop(
            deviceName: deviceName,
            photo: photo,
            indicator: indicator,
            lastWatering: lastWatering,
            nextWatering: nextWatering,
          ),
          SizedBox(height: 50.h),
          child,
        ],
      ),
    );
  }
}