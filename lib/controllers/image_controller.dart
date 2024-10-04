import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../models/image_model.dart';
import '../repository/image_repository.dart';

class ImageController extends GetxController {
  final ImageRepository repository;

  ImageController({required this.repository});

  var images = <ImageModel>[].obs;
  var isLoading = false.obs;
  var currentPage = 1;
  double imageWidth = kIsWeb ? 200 : 100;

  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }

  Future<void> fetchImages() async {
    try {
      isLoading(true);
      final newImages = await repository.fetchImages(currentPage);
      images.addAll(newImages);
      currentPage++;
    } finally {
      isLoading(false);
    }
  }

  void loadMoreImages() {
    if (!isLoading.value) {
      fetchImages();
    }
  }
}
