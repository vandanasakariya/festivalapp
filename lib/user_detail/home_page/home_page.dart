import 'dart:io';

import 'package:festivalapp/helper/ad_manager/banner_ad.dart';
import 'package:festivalapp/utils/navigation-utils/navigation.dart';
import 'package:festivalapp/utils/navigation-utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../helper/ad_manager/ad_controller.dart';
import '../../theam/app_string.dart';
import '../../utils/size_utils.dart';
import '../../widget/custom_text.dart';
import 'festival_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final AdController adController = Get.find();

  FestivalController festivalController = Get.put(FestivalController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () {
            exit(0);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeUtils.verticalBlockSize * 3,
                horizontal: SizeUtils.horizontalBlockSize * 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeUtils.horizontalBlockSize * 1,
                      vertical: SizeUtils.verticalBlockSize * 1),
                  child: AppText(
                    text: AppString.festivals,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeUtils.fSize_18(),
                  ),
                ),
                SizedBox(height: SizeUtils.verticalBlockSize * 2),
                Obx(
                  () => festivalController.loding.value == true
                      ? Padding(
                          padding: EdgeInsets.only(
                            top: SizeUtils.verticalBlockSize *
                                35, /*left: SizeUtils.horizontalBlockSize * 5*/
                          ),
                          child: SpinKitSpinningLines(
                            color: Colors.black,
                            size: SizeUtils.horizontalBlockSize * 15,
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                            itemCount: festivalController
                                    .festivalModal.value.festival?.length ??
                                0,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    /*vertical: SizeUtils.verticalBlockSize * 1*/
                                    horizontal:
                                        SizeUtils.horizontalBlockSize * 2),
                                child: GestureDetector(
                                  onTap: () {
                                    BannerAds();
                                    if (festivalController.festivalModal.value
                                            .festival![index] ==
                                        "Dhan-Teras") {
                                      festivalController.getDhanTeras();
                                      festivalController.isCheckApi.value = 1;
                                    } else if (festivalController.festivalModal
                                            .value.festival![index] ==
                                        "Diwali") {
                                      festivalController.getDiwaliMeth();
                                      festivalController.isCheckApi.value = 2;
                                    } else if (festivalController.festivalModal
                                            .value.festival![index] ==
                                        "happy-New-Year") {
                                      festivalController.getHappyNewYearMeth();
                                      festivalController.isCheckApi.value = 3;
                                    } else if (festivalController.festivalModal
                                            .value.festival![index] ==
                                        "Janmashtami") {
                                      festivalController.getMahashivratriMeth();
                                      print("mahashivratri---7");

                                      festivalController.isCheckApi.value = 4;
                                    }
                                    festivalController.imageChange.value = "";
                                    Navigation.pushNamed(Routes.formatPage,
                                        arg: {
                                          "checkApi": festivalController
                                              .isCheckApi.value,
                                        });
                                  },
                                  child: Container(
                                    height: SizeUtils.verticalBlockSize * 5,
                                    // width: SizeUtils.horizontalBlockSize * 5,
                                    child: Text(festivalController
                                        .festivalModal.value.festival![index]),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(
                                thickness: 2,
                              );
                            },
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          child: BannerAds(),
        ),
      ),
    );
  }
}
