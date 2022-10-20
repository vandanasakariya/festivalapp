import 'package:festivalapp/helper/ad_manager/ad_controller.dart';
import 'package:festivalapp/helper/ad_manager/app_lifecycle_reactor.dart';
import 'package:festivalapp/helper/ad_manager/app_open_ad_manager.dart';
import 'package:festivalapp/utils/navigation-utils/routes.dart';
import 'package:festivalapp/utils/shardprafrance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppPreference.initMySharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  late AppLifecycleReactor _appLifecycleReactor;

  @override
  void initState() {
    super.initState();
    AppOpenAdManager appOpenAdManager = AppOpenAdManager()..loadAd();
    _appLifecycleReactor =
        AppLifecycleReactor(appOpenAdManager: appOpenAdManager);
    _appLifecycleReactor.listenToAppStateChanges();
    print("r");
  }

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
    Get.put(AdController());

    //Get.put(FestivalController());
  }
}
