import 'package:flutter/material.dart';

import '../theam/app_img.dart';
import '../theam/app_string.dart';
import '../utils/size_utils.dart';
import '../widget/custom_text.dart';

class ColorFullBackground extends StatelessWidget {
  const ColorFullBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeUtils.verticalBlockSize * 3,
              horizontal: SizeUtils.horizontalBlockSize * 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: AppText(
                    text: AppString.chooseColorBg,
                    fontSize: SizeUtils.fSize_19(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
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
                      //Navigation.pushNamed(Routes.colorFullBackground);
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
        ),
      ),
    );
  }
}

_commonRow({
  String name = "",
  String name1 = "",
  String name2 = "",
  String name3 = "",
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: SizeUtils.verticalBlockSize * 2,
        horizontal: SizeUtils.horizontalBlockSize * 3),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            height: SizeUtils.verticalBlockSize * 8,
            width: SizeUtils.horizontalBlockSize * 15,
            color: Colors.grey.shade400,
            child: Image.asset(name)),
        Container(
          height: SizeUtils.verticalBlockSize * 8,
          width: SizeUtils.horizontalBlockSize * 15,
          color: Colors.grey.shade400,
          child: Image.asset(name1),
        ),
        Container(
          height: SizeUtils.verticalBlockSize * 8,
          width: SizeUtils.horizontalBlockSize * 15,
          color: Colors.grey.shade400,
          child: Image.asset(name2),
        ),
        Container(
          height: SizeUtils.verticalBlockSize * 8,
          width: SizeUtils.horizontalBlockSize * 15,
          color: Colors.grey.shade400,
          child: Image.asset(name3),
        ),
      ],
    ),
  );
}
