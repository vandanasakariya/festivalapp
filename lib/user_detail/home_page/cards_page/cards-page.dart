import 'dart:convert';

import 'package:festivalapp/user_detail/home_page/festival_controller.dart';
import 'package:festivalapp/user_detail/home_page/home_page.dart';
import 'package:festivalapp/user_detail/home_page/share_page.dart';
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
    SharePage(),
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
          /* body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeUtils.verticalBlockSize * 3,
                horizontal: SizeUtils.horizontalBlockSize * 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: AppString.hereYoutAllCard,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeUtils.fSize_18(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeUtils.verticalBlockSize * 5,
                      horizontal: SizeUtils.horizontalBlockSize * 5),
                  child: Stack(
                    children: [
                      Container(
                          width: SizeUtils.horizontalBlockSize * 90,
                          height: SizeUtils.verticalBlockSize * 60,
                          color: Colors.grey.shade200),
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeUtils.verticalBlockSize * 3,
                              horizontal: SizeUtils.horizontalBlockSize * 5),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Container(
                                height: SizeUtils.verticalBlockSize * 20,
                                width: SizeUtils.horizontalBlockSize * 8,
                                child: ListTile(
                                  leading: Container(
                                    width: SizeUtils.horizontalBlockSize * 25,
                                    height: SizeUtils.verticalBlockSize * 40,
                                    color: Colors.grey.shade400,
                                  ),
                                  title: AppText(text: AppString.festivalNm),
                                  subtitle: AppText(text: AppString.dateTime),
                                  //trailing: AppText(text: AppString.festivalNm),
                                  //subtitle: AppText(text: AppString.dateTime),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),*/
          body: page.elementAt(count),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.share),
                label: "Share",
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
