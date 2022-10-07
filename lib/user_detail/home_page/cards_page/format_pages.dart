import 'package:festivalapp/helper/ad_manager/ad_controller.dart';
import 'package:festivalapp/helper/ad_manager/banner_ad.dart';
import 'package:festivalapp/user_detail/home_page/cards_page/colorfull_background.dart';
import 'package:festivalapp/utils/navigation-utils/navigation.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theam/app_img.dart';
import '../../../theam/app_string.dart';

import '../../../utils/size_utils.dart';
import '../../../widget/custom_text.dart';
import '../festival_controller.dart';

class FormatePages extends StatefulWidget {
  const FormatePages({Key? key}) : super(key: key);

  @override
  _FormatePagesState createState() => _FormatePagesState();
}

class _FormatePagesState extends State<FormatePages> {
  final FestivalController festivalController = Get.find();
  // final argu = Get.arguments;
  final AdController adController = Get.find();

  int i = 0;
  var apiCheck;

  @override
  Widget build(BuildContext context) {
    apiCheck = Get.arguments;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeUtils.verticalBlockSize * 3,
              horizontal: SizeUtils.horizontalBlockSize * 5),
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
                child: Obx(
                  () => Container(
                    child: festivalController.imageChange.value.isEmpty
                        ? Image.asset(
                            AppImage.selectImage,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            festivalController.imageChange.value,
                            fit: BoxFit.cover,
                          ),
                    height: SizeUtils.verticalBlockSize * 30,
                    width: SizeUtils.horizontalBlockSize * 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(10),
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              Obx(() => festivalController.loding.value == true
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : apiCheck["checkApi"] == 1
                      ? Expanded(
                          child: GridView.builder(
                            itemCount: festivalController
                                .dhanteras.value.dhanTeras?.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 100 / 150),
                            itemBuilder: (BuildContext ctx, index) {
                              return InkWell(
                                onTap: () {
                                  festivalController.imageChange.value =
                                      festivalController.dhanteras.value
                                              .dhanTeras?[index] ??
                                          "";
                                },
                                child: Image.network(
                                    "${festivalController.dhanteras.value.dhanTeras?[index]}"),
                              );
                            },
                          ),
                        )
                      : apiCheck["checkApi"] == 2
                          ? Expanded(
                              child: GridView.builder(
                                itemCount: festivalController
                                    .diwaliModal.value.diwali?.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 12,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 100 / 150),
                                itemBuilder: (BuildContext ctx, index) {
                                  return InkWell(
                                    onTap: () {
                                      festivalController.imageChange.value =
                                          festivalController.diwaliModal.value
                                                  .diwali?[index] ??
                                              "";
                                    },
                                    child: Image.network(
                                        "${festivalController.diwaliModal.value.diwali?[index]}"),
                                  );
                                },
                              ),
                            )
                          : apiCheck["checkApi"] == 3
                              ? Expanded(
                                  child: GridView.builder(
                                    itemCount: festivalController
                                        .holiModal.value.holi?.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            crossAxisSpacing: 12,
                                            mainAxisSpacing: 10,
                                            childAspectRatio: 100 / 150),
                                    itemBuilder: (BuildContext ctx, index) {
                                      return InkWell(
                                        onTap: () {
                                          festivalController.imageChange.value =
                                              festivalController.holiModal.value
                                                      .holi?[index] ??
                                                  "";
                                        },
                                        child: Image.network(
                                            "${festivalController.holiModal.value.holi?[index]}"),
                                      );
                                    },
                                  ),
                                )
                              : apiCheck["checkApi"] == 4
                                  ? Expanded(
                                      child: GridView.builder(
                                        itemCount: festivalController
                                            .janmashtamiModal
                                            .value
                                            .janmashtami
                                            ?.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 4,
                                                crossAxisSpacing: 12,
                                                mainAxisSpacing: 10,
                                                childAspectRatio: 100 / 150),
                                        itemBuilder: (BuildContext ctx, index) {
                                          return InkWell(
                                            onTap: () {
                                              festivalController.imageChange
                                                  .value = festivalController
                                                      .janmashtamiModal
                                                      .value
                                                      .janmashtami?[index] ??
                                                  "";
                                            },
                                            child: Image.network(
                                                "${festivalController.janmashtamiModal.value.janmashtami?[index]}"),
                                          );
                                        },
                                      ),
                                    )
                                  : apiCheck["checkApi"] == 5
                                      ? Expanded(
                                          child: GridView.builder(
                                            itemCount: festivalController
                                                .dhanteras
                                                .value
                                                .dhanTeras
                                                ?.length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 4,
                                                    crossAxisSpacing: 12,
                                                    mainAxisSpacing: 10,
                                                    childAspectRatio:
                                                        100 / 150),
                                            itemBuilder:
                                                (BuildContext ctx, index) {
                                              return InkWell(
                                                onTap: () {
                                                  festivalController
                                                          .imageChange.value =
                                                      festivalController
                                                                  .dhanteras
                                                                  .value
                                                                  .dhanTeras?[
                                                              index] ??
                                                          "";
                                                },
                                                child: Image.network(
                                                    "${festivalController.dhanteras.value.dhanTeras?[index]}"),
                                              );
                                            },
                                          ),
                                        )
                                      : SizedBox()),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeUtils.verticalBlockSize * 1,
                    horizontal: SizeUtils.horizontalBlockSize * 1),
                child: InkWell(
                  onTap: () {
                    // Navigation.pushNamed(Routes.colorFullBackground);
                    BannerAds();
                    //adController.createInterstitialAd();
                    festivalController.imageChange.value == ""
                        ? showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                child: AlertDialog(
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigation.pop();
                                      },
                                      child: AppText(text: AppString.ok),
                                    ),
                                  ],
                                  title: AppText(
                                    text: AppString.plzSelectImg,
                                    fontSize: SizeUtils.fSize_13(),
                                  ),
                                ),
                              );
                            },
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ColorFullBackground(
                                festivalImage: NetworkImage(
                                    festivalController.imageChange.value),
                              ),
                            ),
                          );
                  },
                  child: CircleAvatar(
                    radius: 29,
                    backgroundColor: Colors.grey.shade400,
                    child: const Icon(
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
        bottomNavigationBar: Container(
          child: BannerAds(),
        ),
      ),
    );
  }

/*
  _commonRow({
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
              ),
            ),
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
  }
*/

}
