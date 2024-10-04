import 'package:flutter/material.dart';
import 'package:image_gallery/controllers/image_controller.dart';
import 'package:get/get.dart';
import '../../models/image_model.dart';

class ItemImage extends StatelessWidget {
  final ImageModel image;

  ItemImage({required this.image});

  ImageController controller = Get.find<ImageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Center(
            child: Image.network(
              width: controller.imageWidth,
              height: controller.imageWidth,
              image.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.thumb_up_alt, size: 14, color: Colors.white),
                      Text(
                        '${image.likes} ',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          size: 14,
                          color: Colors.white,
                        ),
                        Text('${image.views} ',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
