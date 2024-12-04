import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tomato_leaf/core/styles/app_sizes.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/list_photo/list_photo_controller.dart';

class BottomSheetPickPhoto {
  final ListPhotoController controller;

  BottomSheetPickPhoto({
    required this.controller,
  });

  void show() {
    Get.bottomSheet(
      Container(
        padding: AppSizes.paddingMedium.w,
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: AppSizes.radiusSmallMedium.r.topLeft,
            topRight: AppSizes.radiusSmallMedium.r.topRight,
          ),
        ),
        child: Wrap(
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "Update Profile Picture",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Divider(
                    thickness: 2,
                    color: Colors.grey[300],
                  ),
                   SizedBox(height: 10.h),
                  ListTile(
                    leading: Builder(builder: (context) {
                      return Icon(
                        Icons.photo_library,
                        color: Colors.blue,
                        size: AppSizes.iconMedium(context),
                      );
                    }),
                    title: Text(
                      "Choose from Gallery",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () async {
                      await controller.pickImageFromGallery();
                    },
                  ),
                   SizedBox(height: 10.h),
                  ListTile(
                    leading: Builder(builder: (context) {
                      return Icon(
                        Icons.camera_alt,
                        color: Colors.green,
                        size: AppSizes.iconMedium(context),
                      );
                    }),
                    title:  Text(
                      "Choose from Camera",
                      style: TextStyle(fontSize: 15.sp, color: Colors.black),
                    ),
                    onTap: () async {
                      await controller.pickImageFromCamera();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
    );
  }
}
