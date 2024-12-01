import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/app_colors.dart';

class DeviceTop extends StatelessWidget {
  const DeviceTop({
    super.key,
    required this.deviceName,
    required this.photo,
    required this.indicator,
    required this.lastWatering,
    required this.nextWatering,
  });

  final String deviceName;
  final String photo;
  final String indicator;
  final String lastWatering;
  final String nextWatering;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130.h,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 5, 20),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(photo),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 15, 10, 15),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 5, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        deviceName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.leagueSpartan(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primaryColor,
                          height: 1,
                        ),
                      ),
                      Text(
                        "indikator $indicator",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.leagueSpartan(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Terakhir Diupdate : ",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          height: 1.15,
                        ),
                      ),
                      Text(
                        nextWatering,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          height: 1.15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}