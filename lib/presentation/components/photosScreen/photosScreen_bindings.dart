import 'package:get/get.dart';
import './photosScreen_controller.dart';

class PhotosScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(PhotosController());
  }
}
