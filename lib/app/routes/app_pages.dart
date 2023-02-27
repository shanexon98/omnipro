import 'package:get/get.dart';

//Pages
import 'package:pruebaomnipro/presentation/components/photosScreen/photosScreen_bindings.dart';
import 'package:pruebaomnipro/presentation/components/splashScreen/splashScreen_page.dart';
//Bindings
import 'package:pruebaomnipro/presentation/components/photosScreen/photosScreen_page.dart';
import 'package:pruebaomnipro/presentation/components/splashScreen/splashScreen_bindings.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashScreenPage(),
        transition: Transition.circularReveal,
        binding: SplashScreenBindings()),
    GetPage(
        name: Routes.photo,
        page: () => const PhotosScreenPage(),
        transition: Transition.circularReveal,
        binding: PhotosScreenBindings()),
  ];
}
