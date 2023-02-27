import 'package:get/get.dart';
import './splashScreen_controller.dart';

class SplashScreenBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(SplashScreenController());
    }
}