import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebaomnipro/presentation/components/splashScreen/splashScreen_bindings.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Photos',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: Routes.splash,
      initialBinding: SplashScreenBindings(),
    );
  }
}
