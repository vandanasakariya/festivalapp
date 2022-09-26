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
import '../share_page.dart';
import 'format_pages.dart';

class FormatPage extends StatefulWidget {
  FormatPage({Key? key}) : super(key: key);

  @override
  State<FormatPage> createState() => _FormatPageState();
}

class _FormatPageState extends State<FormatPage> {
  List page = [
    FormatePages(),
    SharePage(),
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
        ),
        /* Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeUtils.verticalBlockSize * 3,
              horizontal: SizeUtils.horizontalBlockSize * 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: AppText(
                    text: AppString.chooseFormat,
                    fontSize: SizeUtils.fSize_19(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "${i == 1 ? AppImage.festivalLogo : i == 2 ? AppImage.rK : i == 3 ? AppImage.md : i == 4 ? AppImage.rK : AppImage.noimagefound}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: SizeUtils.verticalBlockSize * 30,
                    width: SizeUtils.horizontalBlockSize * 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(10),
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                SizedBox(
                  height: SizeUtils.verticalBlockSize * 2,
                ),
                _commonRow(
                  fOnTap: () {
                    setState(() {
                      i = 1;
                      // print("Blank");
                    });
                  },
                  sOnTap: () {
                    setState(() {
                      i = 2;
                    });
                  },
                  tOnTap: () {
                    setState(() {
                      i = 3;
                    });
                  },
                  foOnTap: () {
                    setState(() {
                      i = 4;
                    });
                  },
                  name: AppImage.festivalLogo,
                  name1: AppImage.rK,
                  name2: AppImage.md,
                  name3: AppImage.rK,
                ),
                _commonRow(
                  name: AppImage.festivalLogo,
                  name1: AppImage.festivalLogo,
                  name2: AppImage.festivalLogo,
                  name3: AppImage.festivalLogo,
                ),
                _commonRow(
                  name: AppImage.festivalLogo,
                  name1: AppImage.festivalLogo,
                  name2: AppImage.festivalLogo,
                  name3: AppImage.festivalLogo,
                ),
                Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeUtils.verticalBlockSize * 1,
                      horizontal: SizeUtils.horizontalBlockSize * 1),
                  child: InkWell(
                    onTap: () {
                      Navigation.pushNamed(Routes.colorFullBackground);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ColorFullBackground(
                            festivalImage: AssetImage(i == 1
                                ? AppImage.festivalLogo
                                : i == 2
                                    ? AppImage.rK
                                    : i == 3
                                        ? AppImage.md
                                        : i == 4
                                            ? AppImage.rK
                                            : AppImage.noimagefound),
                          ),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 29,
                      backgroundColor: Colors.grey.shade400,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeUtils.verticalBlockSize * 1,
                ),
                AppText(
                  text: AppString.next,
                  fontSize: SizeUtils.fSize_19(),
                ),
              ],
            ),
          ),
        ),*/
      ),
    );
  }

  /* _commonRow({
    String name = "",
    String name1 = "",
    String name2 = "",
    String name3 = "",
    final GestureTapCallback? fOnTap,
    final GestureTapCallback? sOnTap,
    final GestureTapCallback? tOnTap,
    final GestureTapCallback? foOnTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: SizeUtils.verticalBlockSize * 2,
          horizontal: SizeUtils.horizontalBlockSize * 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: fOnTap,
            child: Container(
                height: SizeUtils.verticalBlockSize * 8,
                width: SizeUtils.horizontalBlockSize * 15,
                color: Colors.grey.shade400,
                child: Image.asset(
                  name,
                  fit: BoxFit.cover,
                )),
          ),
          GestureDetector(
            onTap: sOnTap,
            child: Container(
              height: SizeUtils.verticalBlockSize * 8,
              width: SizeUtils.horizontalBlockSize * 15,
              color: Colors.grey.shade400,
              child: Image.asset(
                name1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          GestureDetector(
            onTap: tOnTap,
            child: Container(
              height: SizeUtils.verticalBlockSize * 8,
              width: SizeUtils.horizontalBlockSize * 15,
              color: Colors.grey.shade400,
              child: Image.asset(
                name2,
                fit: BoxFit.cover,
              ),
            ),
          ),
          GestureDetector(
            onTap: foOnTap,
            child: Container(
              height: SizeUtils.verticalBlockSize * 8,
              width: SizeUtils.horizontalBlockSize * 15,
              color: Colors.grey.shade400,
              child: Image.asset(
                name3,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }*/
}
