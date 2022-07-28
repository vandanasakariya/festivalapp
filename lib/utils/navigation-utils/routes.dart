import 'package:festivalapp/home_page/cards-page.dart';
import 'package:festivalapp/home_page/colorfull_background.dart';
import 'package:festivalapp/home_page/format_page.dart';
import 'package:festivalapp/home_page/user_detail.dart';
import 'package:festivalapp/splash_screen.dart';

import 'package:get/get.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;
  static const splashscreen = "/splashscreen";
  static const homePage = "/homePage";
  static const cardsPage = "/CardsPage";
  static const formatPage = "/formatPage";
  static const colorFullBackground = "/colorFullBackground";

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
      page: () => ColorFullBackground(),
      transition: defaultTransition,
    ),
  ];
}
