import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import 'photo_viewer_controller.dart';

class PhotoViewerPage extends StatelessWidget {
  const PhotoViewerPage({super.key});

  static String routeName = '/photo_view';

  @override
  Widget build(BuildContext context) {
    final PhotoViewerController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text('Photo Viewer')),
      body: Obx(() {
        return Center(
          child: PhotoView(
            imageProvider: NetworkImage(
              controller.urlImage.value,
            ),
            backgroundDecoration: const BoxDecoration(
              color: Colors.black, // Background color
            ),
          ),
        );
      }),
    );
  }
}
