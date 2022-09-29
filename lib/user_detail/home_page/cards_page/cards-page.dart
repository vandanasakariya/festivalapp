import 'dart:convert';

import 'package:festivalapp/user_detail/home_page/festival_controller.dart';
import 'package:festivalapp/user_detail/home_page/home_page.dart';
import 'package:festivalapp/user_detail/user_detail.dart';
import 'package:festivalapp/utils/shardprafrance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CardsPage extends StatefulWidget {
  CardsPage({Key? key}) : super(key: key);

  @override
  State<CardsPage> createState() => _CardsPageState();
}

final FestivalController festivalController = Get.find();

class _CardsPageState extends State<CardsPage> {
  List page = [
    HomePage(),
    UserDetail(),
  ];

  int count = 0;

  void _onItemTapped(int index) {
    setState(
      () {
        count = index;

        print("count---$count");
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
          )),
    );
  }
}
