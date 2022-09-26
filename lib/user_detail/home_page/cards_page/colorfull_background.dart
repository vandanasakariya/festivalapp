import 'dart:developer';
import 'dart:typed_data';

import 'package:festivalapp/theam/app_img.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

import '../../../theam/app_string.dart';
import '../../../utils/navigation-utils/navigation.dart';
import '../../../utils/navigation-utils/routes.dart';
import '../../../utils/size_utils.dart';
import '../../../widget/custom_text.dart';
import '../festival_controller.dart';

class ColorFullBackground extends StatefulWidget {
  ColorFullBackground({
    Key? key,
    required this.festivalImage,
  }) : super(key: key);
  final ImageProvider festivalImage;

  @override
  State<ColorFullBackground> createState() => _ColorFullBackgroundState();
}

class _ColorFullBackgroundState extends State<ColorFullBackground> {
  final FestivalController festivalController = Get.find()
    ..imageShow()
    ..company();
  ScreenshotController screenshotController = ScreenshotController();
  bool isChange = false;
  late Uint8List capturedImage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Padding(
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
                    child: Screenshot(
                      controller: screenshotController,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                child: Image(
                                  image: widget.festivalImage,
                                  fit: BoxFit.cover,
                                ),
                                height: SizeUtils.verticalBlockSize * 30,
                                width: SizeUtils.horizontalBlockSize * 60,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10),
                                  //color: Colors.grey.shade400,
                                ),
                              ),
                              festivalController.i.value == 1
                                  ? Positioned(
                                      bottom: 6,
                                      child: Container(
                                        height: SizeUtils.verticalBlockSize * 2,
                                        width:
                                            SizeUtils.horizontalBlockSize * 60,
                                        color: Colors.transparent,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              height:
                                                  SizeUtils.verticalBlockSize *
                                                      1,
                                              width: SizeUtils
                                                      .horizontalBlockSize *
                                                  16,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.grey.shade600),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: SizeUtils
                                                            .horizontalBlockSize *
                                                        1),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      AppImage.whatsapp,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                        "${festivalController.phoneNo.value}",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: SizeUtils
                                                                .fSize_6(),
                                                            color:
                                                                Colors.white)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            festivalController.insta.value == ""
                                                ? SizedBox()
                                                : Container(
                                                    height: SizeUtils
                                                            .verticalBlockSize *
                                                        1,
                                                    width: SizeUtils
                                                            .horizontalBlockSize *
                                                        22,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: Colors
                                                            .grey.shade600),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          AppImage.insta,
                                                          color: Colors.white,
                                                        ),
                                                        Center(
                                                          child: Text(
                                                            "${festivalController.insta.value}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: SizeUtils
                                                                    .fSize_6(),
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                            festivalController.fb.value == ""
                                                ? SizedBox()
                                                : Container(
                                                    height: SizeUtils
                                                            .verticalBlockSize *
                                                        1,
                                                    width: SizeUtils
                                                            .horizontalBlockSize *
                                                        20,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: Colors
                                                            .grey.shade600),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          AppImage.fb,
                                                          color: Colors.white,
                                                        ),
                                                        Center(
                                                          child: Text(
                                                            "${festivalController.fb.value}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: SizeUtils
                                                                    .fSize_6(),
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : festivalController.i.value == 3
                                      ? Positioned(
                                          bottom: 6,
                                          child: Container(
                                            height:
                                                SizeUtils.verticalBlockSize * 2,
                                            width:
                                                SizeUtils.horizontalBlockSize *
                                                    60,
                                            color: Colors.transparent,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  height: SizeUtils
                                                          .verticalBlockSize *
                                                      1,
                                                  width: SizeUtils
                                                          .horizontalBlockSize *
                                                      16,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color:
                                                          Colors.grey.shade600),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        AppImage.whatsapp,
                                                        color: Colors.white,
                                                      ),
                                                      Text(
                                                          "${festivalController.phoneNo.value}",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: SizeUtils
                                                                  .fSize_6(),
                                                              color: Colors
                                                                  .white)),
                                                    ],
                                                  ),
                                                ),
                                                festivalController
                                                            .insta.value ==
                                                        ""
                                                    ? SizedBox()
                                                    : Container(
                                                        height: SizeUtils
                                                                .verticalBlockSize *
                                                            1,
                                                        width: SizeUtils
                                                                .horizontalBlockSize *
                                                            22,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            color: Colors
                                                                .grey.shade600),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.asset(
                                                              AppImage.insta,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Center(
                                                              child: Text(
                                                                "${festivalController.insta.value}",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        SizeUtils
                                                                            .fSize_6(),
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                festivalController.fb.value ==
                                                        ""
                                                    ? SizedBox()
                                                    : Container(
                                                        height: SizeUtils
                                                                .verticalBlockSize *
                                                            1,
                                                        width: SizeUtils
                                                                .horizontalBlockSize *
                                                            20,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            color: Colors
                                                                .grey.shade600),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.asset(
                                                              AppImage.fb,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Center(
                                                              child: Text(
                                                                "${festivalController.fb.value}",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        SizeUtils
                                                                            .fSize_6(),
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : festivalController.i.value == 2
                                          ? Positioned(
                                              top: 5,
                                              child: Container(
                                                height: SizeUtils
                                                        .verticalBlockSize *
                                                    2,
                                                width: SizeUtils
                                                        .horizontalBlockSize *
                                                    60,
                                                color: Colors.transparent,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Container(
                                                      height: SizeUtils
                                                              .verticalBlockSize *
                                                          1,
                                                      width: SizeUtils
                                                              .horizontalBlockSize *
                                                          16,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          color: Colors
                                                              .grey.shade600),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            AppImage.whatsapp,
                                                            color: Colors.white,
                                                          ),
                                                          Text(
                                                              "${festivalController.phoneNo.value}",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      SizeUtils
                                                                          .fSize_6(),
                                                                  color: Colors
                                                                      .white)),
                                                        ],
                                                      ),
                                                    ),
                                                    festivalController
                                                                .insta.value ==
                                                            ""
                                                        ? SizedBox()
                                                        : Container(
                                                            height: SizeUtils
                                                                    .verticalBlockSize *
                                                                1,
                                                            width: SizeUtils
                                                                    .horizontalBlockSize *
                                                                22,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                color: Colors
                                                                    .grey
                                                                    .shade600),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Image.asset(
                                                                  AppImage
                                                                      .insta,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                Center(
                                                                  child: Text(
                                                                    "${festivalController.insta.value}",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            SizeUtils
                                                                                .fSize_6(),
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                    festivalController
                                                                .fb.value ==
                                                            ""
                                                        ? SizedBox()
                                                        : Container(
                                                            height: SizeUtils
                                                                    .verticalBlockSize *
                                                                1,
                                                            width: SizeUtils
                                                                    .horizontalBlockSize *
                                                                20,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                color: Colors
                                                                    .grey
                                                                    .shade600),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Image.asset(
                                                                  AppImage.fb,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                Center(
                                                                  child: Text(
                                                                    "${festivalController.fb.value}",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            SizeUtils
                                                                                .fSize_6(),
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : festivalController.i.value == 4
                                              ? Positioned(
                                                  top: 5,
                                                  child: Container(
                                                    height: SizeUtils
                                                            .verticalBlockSize *
                                                        2,
                                                    width: SizeUtils
                                                            .horizontalBlockSize *
                                                        60,
                                                    color: Colors.transparent,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Container(
                                                          height: SizeUtils
                                                                  .verticalBlockSize *
                                                              1,
                                                          width: SizeUtils
                                                                  .horizontalBlockSize *
                                                              16,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              color: Colors.grey
                                                                  .shade600),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Image.asset(
                                                                AppImage
                                                                    .whatsapp,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              Text(
                                                                  "${festivalController.phoneNo.value}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          SizeUtils
                                                                              .fSize_6(),
                                                                      color: Colors
                                                                          .white)),
                                                            ],
                                                          ),
                                                        ),
                                                        festivalController.insta
                                                                    .value ==
                                                                ""
                                                            ? SizedBox()
                                                            : Container(
                                                                height: SizeUtils
                                                                        .verticalBlockSize *
                                                                    1,
                                                                width: SizeUtils
                                                                        .horizontalBlockSize *
                                                                    22,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    color: Colors
                                                                        .grey
                                                                        .shade600),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Image.asset(
                                                                      AppImage
                                                                          .insta,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    Center(
                                                                      child:
                                                                          Text(
                                                                        "${festivalController.insta.value}",
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                SizeUtils.fSize_6(),
                                                                            color: Colors.white),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                        festivalController
                                                                    .fb.value ==
                                                                ""
                                                            ? SizedBox()
                                                            : Container(
                                                                height: SizeUtils
                                                                        .verticalBlockSize *
                                                                    1,
                                                                width: SizeUtils
                                                                        .horizontalBlockSize *
                                                                    20,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    color: Colors
                                                                        .grey
                                                                        .shade600),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Image.asset(
                                                                      AppImage
                                                                          .fb,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    Center(
                                                                      child:
                                                                          Text(
                                                                        "${festivalController.fb.value}",
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                SizeUtils.fSize_6(),
                                                                            color: Colors.white),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : Positioned(
                                                  bottom: 6,
                                                  child: Container(
                                                    height: SizeUtils
                                                            .verticalBlockSize *
                                                        2,
                                                    width: SizeUtils
                                                            .horizontalBlockSize *
                                                        60,
                                                    color: Colors.transparent,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Container(
                                                          height: SizeUtils
                                                                  .verticalBlockSize *
                                                              1,
                                                          width: SizeUtils
                                                                  .horizontalBlockSize *
                                                              16,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              color: Colors.grey
                                                                  .shade600),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        SizeUtils.horizontalBlockSize *
                                                                            1),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Image.asset(
                                                                  AppImage
                                                                      .whatsapp,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                Text(
                                                                    "${festivalController.phoneNo.value}",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            SizeUtils
                                                                                .fSize_6(),
                                                                        color: Colors
                                                                            .white)),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        festivalController.insta
                                                                    .value ==
                                                                ""
                                                            ? SizedBox()
                                                            : Container(
                                                                height: SizeUtils
                                                                        .verticalBlockSize *
                                                                    1,
                                                                width: SizeUtils
                                                                        .horizontalBlockSize *
                                                                    22,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    color: Colors
                                                                        .grey
                                                                        .shade600),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Image.asset(
                                                                      AppImage
                                                                          .insta,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    Center(
                                                                      child:
                                                                          Text(
                                                                        "${festivalController.insta.value}",
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                SizeUtils.fSize_6(),
                                                                            color: Colors.white),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                        festivalController
                                                                    .fb.value ==
                                                                ""
                                                            ? SizedBox()
                                                            : Container(
                                                                height: SizeUtils
                                                                        .verticalBlockSize *
                                                                    1,
                                                                width: SizeUtils
                                                                        .horizontalBlockSize *
                                                                    20,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    color: Colors
                                                                        .grey
                                                                        .shade600),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Image.asset(
                                                                      AppImage
                                                                          .fb,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    Center(
                                                                      child:
                                                                          Text(
                                                                        "${festivalController.fb.value}",
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                SizeUtils.fSize_6(),
                                                                            color: Colors.white),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  height: SizeUtils.verticalBlockSize * 1,
                                  width: SizeUtils.horizontalBlockSize * 60,
                                  color: Colors.grey.shade600,
                                  child: Text(
                                    "${festivalController.companyAdd.value + "," + festivalController.city.value}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: SizeUtils.fSize_6(),
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              festivalController.i.value == 1
                                  ? Positioned(
                                      top: 6,
                                      left: 5,
                                      child: Container(
                                        //color: Colors.red,
                                        alignment: Alignment.center,
                                        height: SizeUtils.verticalBlockSize * 4,
                                        width:
                                            SizeUtils.horizontalBlockSize * 20,
                                        child: Image.memory(
                                            festivalController.img64,
                                            fit: BoxFit.cover),
                                      ),
                                    )
                                  : festivalController.i.value == 2
                                      ? Positioned(
                                          left: 5,
                                          bottom: 10,
                                          child: Container(
                                              alignment: Alignment.center,
                                              height:
                                                  SizeUtils.verticalBlockSize *
                                                      4,
                                              width: SizeUtils
                                                      .horizontalBlockSize *
                                                  20,
                                              child: Image.memory(
                                                  festivalController.img64,
                                                  fit: BoxFit.cover)),
                                        )
                                      : festivalController.i.value == 3
                                          ? Positioned(
                                              top: 5,
                                              left: 130,
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  height: SizeUtils
                                                          .verticalBlockSize *
                                                      4,
                                                  width: SizeUtils
                                                          .horizontalBlockSize *
                                                      20,
                                                  child: Image.memory(
                                                      festivalController.img64,
                                                      fit: BoxFit.cover)),
                                            )
                                          : festivalController.i.value == 4
                                              ? Positioned(
                                                  bottom: 10,
                                                  left: 130,
                                                  child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: SizeUtils
                                                              .verticalBlockSize *
                                                          4,
                                                      width: SizeUtils
                                                              .horizontalBlockSize *
                                                          20,
                                                      child: Image.memory(
                                                          festivalController
                                                              .img64,
                                                          fit: BoxFit.cover)),
                                                )
                                              : Positioned(
                                                  top: 6,
                                                  left: 5,
                                                  child: Container(
                                                    //color: Colors.red,
                                                    alignment: Alignment.center,
                                                    height: SizeUtils
                                                            .verticalBlockSize *
                                                        4,
                                                    width: SizeUtils
                                                            .horizontalBlockSize *
                                                        20,
                                                    child: Image.memory(
                                                        festivalController
                                                            .img64,
                                                        fit: BoxFit.cover),
                                                  ),
                                                )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  /* SizedBox(
                    height: SizeUtils.verticalBlockSize * 2,
                  ),*/
                  _commonRow(
                    fOnTap: () {
                      setState(() {
                        festivalController.i.value = 1;
                        print("blanck1");

                        //print("${festivalController.i.value}");
                      });
                    },
                    sOnTap: () {
                      setState(() {
                        festivalController.i.value = 2;
                        print("blanck2");
                        // print("${festivalController.i.value}");
                      });
                    },
                    tOnTap: () {
                      setState(() {
                        festivalController.i.value = 3;
                        print("blanck3");
                      });
                    },
                    foOnTap: () {
                      setState(() {
                        festivalController.i.value = 4;
                        print("blanck4");
                      });
                    },
                    bytes1: festivalController.img64,
                    bytes2: festivalController.img64,
                    bytes3: festivalController.img64,
                    bytes4: festivalController.img64,
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeUtils.verticalBlockSize * 1,
                        horizontal: SizeUtils.horizontalBlockSize * 1),
                    child: InkWell(
                      onTap: () async {
                        final capturedImage =
                            await screenshotController.capture();
                        Navigation.pushNamed(Routes.downloadImage,
                            arg: {"capture": capturedImage});
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
          ),
        ),
      ),
    );
  }
}

_commonRow({
  Uint8List? bytes1,
  Uint8List? bytes2,
  Uint8List? bytes3,
  Uint8List? bytes4,
  final GestureTapCallback? fOnTap,
  final GestureTapCallback? sOnTap,
  final GestureTapCallback? tOnTap,
  final GestureTapCallback? foOnTap,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: SizeUtils.verticalBlockSize * 1,
        horizontal: SizeUtils.horizontalBlockSize * 3),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: fOnTap,
          child: Column(
            children: [
              Container(
                height: SizeUtils.verticalBlockSize * 8,
                width: SizeUtils.horizontalBlockSize * 17,
                // color: Colors.grey.shade400,
                child: Image.memory(
                  bytes1!,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeUtils.verticalBlockSize * 1),
                child: AppText(
                    text: AppString.topLeft, fontSize: SizeUtils.fSize_13()),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: sOnTap,
          child: Column(
            children: [
              Container(
                height: SizeUtils.verticalBlockSize * 8,
                width: SizeUtils.horizontalBlockSize * 17,
                //color: Colors.grey.shade400,
                child: Image.memory(
                  bytes2!,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeUtils.verticalBlockSize * 1),
                child: AppText(
                    text: AppString.bottomLeft, fontSize: SizeUtils.fSize_13()),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: tOnTap,
          child: Column(
            children: [
              Container(
                height: SizeUtils.verticalBlockSize * 8,
                width: SizeUtils.horizontalBlockSize * 17,
                // color: Colors.grey.shade400,
                child: Image.memory(
                  bytes3!,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeUtils.verticalBlockSize * 1),
                child: AppText(
                    text: AppString.topRight, fontSize: SizeUtils.fSize_13()),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: foOnTap,
          child: Column(
            children: [
              Container(
                height: SizeUtils.verticalBlockSize * 8,
                width: SizeUtils.horizontalBlockSize * 17,
                //color: Colors.grey.shade400,
                child: Image.memory(
                  bytes4!,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeUtils.verticalBlockSize * 1),
                child: AppText(
                    text: AppString.bottomRight,
                    fontSize: SizeUtils.fSize_13()),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
