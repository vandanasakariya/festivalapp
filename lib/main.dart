import 'package:festivalapp/splashscreen_controller.dart';
import 'package:festivalapp/utils/navigation-utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashscreen,
      getPages: Routes.pages,
      initialBinding: AppBidding(),
    );
  }
}

class AppBidding implements Bindings {
  @override
  void dependencies() {
    Get.put(SpleshController());
  }
}
