import 'package:festivalapp/theam/app_img.dart';
import 'package:festivalapp/user_detail/home_page/cards_page/colorfull_background.dart';
import 'package:festivalapp/utils/navigation-utils/routes.dart';
import 'package:festivalapp/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theam/app_string.dart';
import '../../../utils/navigation-utils/navigation.dart';
import '../../../utils/size_utils.dart';
import '../../user_detail.dart';
import '../home_page.dart';
import 'format_pages.dart';

class FormatPage extends StatefulWidget {
  FormatPage({Key? key}) : super(key: key);

  @override
  State<FormatPage> createState() => _FormatPageState();
}

class _FormatPageState extends State<FormatPage> {
  List page = [
    FormatePages(),
    UserDetail(),
  ];

  int count = 0;

  int i = 0;
  void _onItemTapped(int index) {
    setState(
      () {
        count = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: page.elementAt(count),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile",
            ),
          ],
          currentIndex: count,
          selectedItemColor: Colors.deepOrange,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
