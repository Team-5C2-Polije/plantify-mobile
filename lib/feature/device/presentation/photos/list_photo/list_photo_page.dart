import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomato_leaf/core/styles/app_colors.dart';
import 'package:tomato_leaf/core/widgets/device_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/detail_photo/detail_photo_page.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/list_photo/dialog/bottom_sheet_pick_photo.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/list_photo/list_photo_controller.dart';

class ListPhotoPage extends StatelessWidget {
  static String routeName = '/list_photo';

  const ListPhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    ListPhotoController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Obx(() {
                  return PageTitle(
                    pageTitle: 'Tampilan Foto',
                    deviceName: '${controller.deviceDetail.value.name}',
                    photo: 'assets/images/img-device.png',
                    token: '${controller.deviceDetail.value.token}',
                    updatedAt: '${controller.updatedAt}',
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    space: 0,
                    child: Container(),
                  );
                }),
                Obx(() {
                  return Padding(
                    padding: EdgeInsets.all(15.r),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemCount: controller.photos.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.goToDetailPhoto(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.network(
                              controller.photos[index].photoUrl ?? '',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
          Obx(() {
            return controller.isLoadingUploadImage.value
                ? const Positioned.fill(
                    child: Center(
                    child: CircularProgressIndicator(),
                  ))
                : Container();
          })
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          BottomSheetPickPhoto(
            controller: controller,
          ).show();
        },
        child: Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: const Icon(
            Icons.add_a_photo_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
