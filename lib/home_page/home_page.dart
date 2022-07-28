import 'package:festivalapp/utils/navigation-utils/navigation.dart';
import 'package:festivalapp/utils/navigation-utils/routes.dart';
import 'package:flutter/material.dart';

import '../theam/app_string.dart';
import '../utils/size_utils.dart';
import '../widget/custom_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
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
                                leading: InkWell(
                                  onTap: () {
                                    Navigation.pushNamed(Routes.formatPage);
                                  },
                                  child: Container(
                                    width: SizeUtils.horizontalBlockSize * 25,
                                    height: SizeUtils.verticalBlockSize * 40,
                                    color: Colors.grey.shade400,
                                  ),
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
        ),
      ),
    );
  }
}
