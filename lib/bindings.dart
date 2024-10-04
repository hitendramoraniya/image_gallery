import 'package:image_gallery/repository/image_repository.dart';
import 'package:get/get.dart';
import 'controllers/image_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImageRepository());
    Get.lazyPut(() => ImageController(repository: Get.find<ImageRepository>()));
  }
}
