import 'package:cached_network_image/cached_network_image.dart';
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
                  onTap: () {
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
                      child: CachedNetworkImage(
                        imageUrl: controller.currentPhoto.value.photoUrl ?? '',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Container(),
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: 20.h),
              Visibility(
                visible: controller.currentPhoto.value.from != null,
                child: Text.rich(
                  TextSpan(
                    text: "Difoto dari : ",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: controller.currentPhoto.value.from,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Prediksi Foto : ",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                  fontSize: 16,
                ),
              ),
              Obx(() {
                return controller.currentPhoto.value.predictions?.isNotEmpty ==
                    true
                    ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.currentPhoto.value.predictions?.length,
                  itemBuilder: (context, index) {
                    var predict = controller.currentPhoto.value
                        .predictions?[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildPredictText("No : ${++index}"),
                              buildPredictText("X : ${predict?.x}"),
                              buildPredictText("Y : ${predict?.y}"),
                              buildPredictText("Height : ${predict?.height}"),
                              buildPredictText("Width : ${predict?.width}"),
                              buildPredictText("Class : ${predict?.label}"),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
                    : Container(
                  child: buildPredictText(
                      "Tidak ada prediksi yang terdeteksi"),
                );
              }),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: double.infinity,
                        height:  50.h,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Sehat : ${controller.healthyPercentage.value}%",
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: double.infinity,
                        height:  50.h,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Sakit : ${controller.sickPercentage.value}%",
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
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

  Text buildPredictText(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
