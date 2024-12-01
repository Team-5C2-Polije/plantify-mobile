import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomato_leaf/core/widgets/device_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomato_leaf/feature/device/presentation/photos/detail_photo/detail_photo_page.dart';

class ListPhotoPage extends StatelessWidget {
  static String routeName = '/list_photo';

  const ListPhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.h),
            PageTitle(
              pageTitle: 'Tampilan Foto',
              deviceName: 'Device Name',
              photo: 'assets/images/img-device.png',
              token: '(-20 / 50)',
              updatedAt: '15:00',
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              space: 0,
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.all(15.r),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Get.toNamed(DetailPhotoPage.routeName.toString());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'assets/images/img-tomato.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
