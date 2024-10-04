import 'package:flutter/material.dart';
import 'package:image_gallery/repository/image_repository.dart';
import 'package:image_gallery/view/item_image.dart';
import 'package:get/get.dart';

import '../controllers/image_controller.dart';

class ImageGalleryScreen extends StatelessWidget {
  final repository = Get.put<ImageRepository>(ImageRepository());
  final ImageController controller =
      Get.put(ImageController(repository: Get.find()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Image Gallery",
          ),
          centerTitle: true),
      body: Obx(() {
        if (controller.isLoading.value && controller.images.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!controller.isLoading.value &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              controller.loadMoreImages();
            }
            return false;
          },
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  (MediaQuery.of(context).size.width / controller.imageWidth)
                      .floor(),
            ),
            itemCount: controller.images.length,
            itemBuilder: (context, index) {
              final image = controller.images[index];
              return ItemImage(image: image);
            },
          ),
        );
      }),
    );
  }
}
