import 'package:festivalapp/splash_screen.dart';
import 'package:festivalapp/theam/app_img.dart';
import 'package:festivalapp/user_detail/home_page/cards_page/cards-page.dart';
import 'package:festivalapp/user_detail/home_page/cards_page/colorfull_background.dart';

import 'package:festivalapp/user_detail/home_page/cards_page/format_page.dart';
import 'package:festivalapp/user_detail/user_detail.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import '../../user_detail/home_page/cards_page/download_img/download_img.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;
  static const splashscreen = "/splashscreen";
  static const homePage = "/homePage";
  static const cardsPage = "/CardsPage";
  static const formatPage = "/formatPage";
  static const colorFullBackground = "/colorFullBackground";
  static const downloadImage = "/downloadImage";

  static List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: splashscreen,
      page: () => SplashScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: homePage,
      page: () => UserDetail(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: cardsPage,
      page: () => CardsPage(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: formatPage,
      page: () => FormatPage(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: colorFullBackground,
      page: () =>
          ColorFullBackground(festivalImage: AssetImage(AppImage.festivalLogo)),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: downloadImage,
      page: () => DownloadImage(),
      transition: defaultTransition,
    ),
  ];
}
