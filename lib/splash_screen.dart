import 'package:festivalapp/theam/app_img.dart';
import 'package:festivalapp/utils/size_utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return SafeArea(
      child: Scaffold(
        body: Image.asset(
          AppImage.festivalLogo,
          // height: SizeUtils.verticalBlockSize * 100,
        ),
      ),
    );
  }
}
