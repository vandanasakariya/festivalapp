import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../user_detail.dart';
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
