import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomato_leaf/core/widgets/device_top.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
    required this.pageTitle,
    this.deviceName,
    this.photo,
    this.token,
    this.updatedAt,
    required this.child,
    this.space = 50,
    this.padding = const EdgeInsets.fromLTRB(25, 40, 25, 0),
  });

  final String pageTitle;
  final String? deviceName;
  final String? photo;
  final String? token;
  final String? updatedAt;
  final Widget child;
  final double space;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
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
            token: token,
            updatedAt: updatedAt,
          ),
          SizedBox(height: space.h),
          child,
        ],
      ),
    );
  }
}
