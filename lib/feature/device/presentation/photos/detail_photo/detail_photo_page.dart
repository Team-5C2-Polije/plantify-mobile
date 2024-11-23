import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomato_leaf/core/styles/app_colors.dart';

class DetailPhotoPage extends StatelessWidget {
  static String routeName = '/detail_photo';

  const DetailPhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Center(
                child: Text(
                  "Informasi Foto",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: double.infinity,
                height: 250.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    'assets/images/img-tomato.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Prediksi Foto : ",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                  fontSize: 16,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Text("lorem ipsum");
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: double.infinity,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 16.w),
              Container(
                width: 80.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_left_outlined,
                  size: 40.w,
                  color: Colors.white,
                ),
              ),
              Text(
                "10/200",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Container(
                width: 80.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_right_outlined,
                  size: 40.w,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 1.w),
            ],
          ),
        ),
      ),
    );
  }
}
