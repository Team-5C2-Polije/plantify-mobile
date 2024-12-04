import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomato_leaf/core/styles/app_colors.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/detail_photo/detail_photo_controller.dart';

class DetailPhotoPage extends StatelessWidget {
  static String routeName = '/detail_photo';

  const DetailPhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    DetailPhotoController controller = Get.find();

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
              Obx(() {
                return GestureDetector(
                  onTap: (){
                    controller.goToPhotoViewer();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 250.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.network(
                        controller.currentPhoto.value.photoUrl ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: 20.h),
              Text(
                "Prediksi Foto : ",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                  fontSize: 16,
                ),
              ),
              controller.currentPhoto.value.predictions?.isNotEmpty == false
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          controller.currentPhoto.value.predictions?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("No : ${++index}"),
                                  Text("X : 10"),
                                  Text("Y : 10"),
                                  Text("Height : 10"),
                                  Text("Width : 10"),
                                  Text("Class : 10"),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Container()
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
              GestureDetector(
                onTap: () async {
                  await controller.tapLeft();
                },
                child: Container(
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
              ),
              Obx(() {
                return Text(
                  "${controller.displayIndex}/${controller.photos.length}",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                );
              }),
              GestureDetector(
                onTap: () async {
                  await controller.tapRight();
                },
                child: Container(
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
              ),
              SizedBox(width: 1.w),
            ],
          ),
        ),
      ),
    );
  }
}
