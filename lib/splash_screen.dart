import 'dart:async';

import 'package:festivalapp/theam/app_img.dart';
import 'package:festivalapp/utils/navigation-utils/navigation.dart';
import 'package:festivalapp/utils/navigation-utils/routes.dart';
import 'package:festivalapp/utils/shardprafrance.dart';
import 'package:festivalapp/utils/size_utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      const Duration(seconds: 3),
      () => AppPreference.getBoolean("user") == true
          ? Navigation.pushNamed(Routes.cardsPage)
          : Navigation.pushNamed(Routes.homePage),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: SizeUtils.verticalBlockSize * 97,
          width: SizeUtils.horizontalBlockSize * 99.5,
          child: Image.asset(
            AppImage.festivalLogo, fit: BoxFit.fill,
            alignment: Alignment.center,
            // height: SizeUtils.verticalBlockSize * 100,
          ),
        ),
      ),
    );
  }
}
