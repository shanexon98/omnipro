import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pruebaomnipro/presentation/components/photosScreen/photosScreen_page.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import './splashScreen_controller.dart';
import '../../../app/utils/assets_util.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const PhotosScreenPage(),
      duration: 5000,
      imageSize: 130,
      text: "Bienvenido",
      imageSrc: Assets.logo,
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(
        fontSize: 40.0,
      ),
      colors: const [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.white,
    );
  }
}
