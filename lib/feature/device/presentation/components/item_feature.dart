import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/app_colors.dart';

class ItemFeature extends StatelessWidget {
  const ItemFeature({
    super.key,
    required this.imagePath,
    required this.title,
    required this.value,
  });

  final String imagePath;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 150.h,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(imagePath),
          const SizedBox(height: 10),
          Text(
            value,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}