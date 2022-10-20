import 'dart:io';

import 'package:festivalapp/helper/ad_manager/ad_controller.dart';
import 'package:festivalapp/helper/ad_manager/banner_ad.dart';
import 'package:festivalapp/theam/app_string.dart';
import 'package:festivalapp/utils/navigation-utils/navigation.dart';
import 'package:festivalapp/utils/navigation-utils/routes.dart';
import 'package:festivalapp/utils/shardprafrance.dart';
import 'package:festivalapp/utils/size_utils.dart';
import 'package:festivalapp/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'home_page/festival_controller.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({Key? key}) : super(key: key);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  String companyName = "";

  @override
  void initState() {
    companyName = AppPreference.getString("companyname");
    // festivalController.img64 = AppPreference.getString("image");
    //print("${companyName}");
    //print("image${festivalController.img64}");
    super.initState();
  }

  final AdController adController = Get.find();

  FestivalController festivalController = Get.put(FestivalController());
  final formKey = GlobalKey<FormState>();

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
              horizontal: SizeUtils.verticalBlockSize * 3,
              vertical: SizeUtils.horizontalBlockSize * 9,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      text: AppString.pleaseFillSomeDetail,
                      fontWeight: FontWeight.bold,
                    ),
                    const AppText(
                      text: AppString.prepareCard,
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeUtils.verticalBlockSize * 2),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            // festivalController.imageShow();
                            festivalController.pickImage();

                            /*print("on tap--${festivalController.img64}");*/
                            // festivalController.imageShow();
                          },
                          child: Obx(
                            () => Container(
                              height: SizeUtils.verticalBlockSize * 20,
                              width: SizeUtils.verticalBlockSize * 25,
                              child: festivalController
                                          .seletedImagePath.value ==
                                      ""
                                  ? Container(
                                      height: SizeUtils.verticalBlockSize * 20,
                                      width: SizeUtils.verticalBlockSize * 25,
                                      child: const Center(
                                          child: Text("Select From Gallery")))
                                  : Image.file(
                                      File(festivalController
                                          .seletedImagePath.value),
                                      fit: BoxFit.fill,
                                    ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.grey,
                                ),
                                /* borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0)),*/
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: AppText(
                        text: AppString.companyLogo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: SizeUtils.verticalBlockSize * 2,
                    ),
                    _commonTextField(
                      labelText: AppString.companyName,
                      controller: festivalController.nameController,
                      validator: (name) {
                        if (name == null) {
                          return "Enter Company Name";
                        }
                      },
                    ),
                    _commonTextField(
                      labelText: AppString.companyAdd,
                      controller: festivalController.addController,
                      validator: (add) {
                        if (add == null) {
                          return "Enter Company Adress";
                        }
                      },
                    ),
                    _commonTextField(
                      labelText: AppString.city,
                      controller: festivalController.cityController,
                      validator: (city) {
                        if (city == null) {
                          return "Enter City";
                        }
                      },
                    ),
                    _commonTextField(
                      labelText: AppString.insta,
                      controller: festivalController.instaController,
                      validator: (insta) {
                        if (insta == null) {
                          return "Enter Instagram Id";
                        }
                      },
                    ),
                    _commonTextField(
                      labelText: AppString.fb,
                      controller: festivalController.fbController,
                      validator: (fb) {
                        if (fb == null) {
                          return "Enter Facebook Id";
                        }
                      },
                    ),
                    _commonTextField(
                      labelText: AppString.mobileNo,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      controller: festivalController.phoneController,
                      validator: (mono) {
                        if (mono == null) {
                          return "Enter Mobile No";
                        } else if (mono.length <= 9) {
                          return "Enter valid number";
                        }
                      },
                    ),
                    _commonTextField(
                      labelText: AppString.emailadd,
                      controller: festivalController.emailController,
                      validator: (email) {
                        if (email == null) {
                          return "Enter Email";
                        }
                      },
                    ),
                    InkWell(
                      onTap: () async {
                        BannerAds();
                        festivalController.userLogin.value = true;
                        try {
                          AppPreference.setString("companyname",
                              festivalController.nameController.text);
                          AppPreference.setString("companyadd",
                              festivalController.addController.text);
                          AppPreference.setString(
                              "city", festivalController.cityController.text);
                          AppPreference.setString("phoneno",
                              festivalController.phoneController.text);
                          AppPreference.setString(
                              "email", festivalController.emailController.text);
                          AppPreference.setString(
                              "insta", festivalController.instaController.text);
                          AppPreference.setString(
                              "fb", festivalController.fbController.text);

                          AppPreference.setBoolean(
                              "user", festivalController.userLogin.value);
                          AppPreference.getString(
                            "storeimage",
                          );
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (formKey.currentState!.validate()) {
                            Navigation.pushNamed(Routes.cardsPage);
                        // Navigation.pushNamed(Routes.homePage);
                            print("aaa--");
                          }
                        } catch (e) {
                          print("error---->$e");
                        }
                        /* festivalController.nameController.clear();
                        festivalController.addController.clear();
                        festivalController.cityController.clear();
                        festivalController.phoneController.clear();
                        festivalController.emailController.clear();*/
                      },
                      child: Center(
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: AppText(text: AppString.next)),
                    ),
                    SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          child: BannerAds(),
        ),
      ),
    );
  }

  /*late Future<int> storagePermissionChecker;
  Future<int> checkStoragePermission() async {final result=await PermissionHandler().checkPermissionStatus()}*/
  _commonTextField({
    final String? hintText,
    final FormFieldValidator<String>? validator,
    final TextEditingController? controller,
    final List<TextInputFormatter>? inputFormatters,
    final GestureTapCallback? onTap,
    final TextInputType? keyboardType,
    final String? labelText,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeUtils.verticalBlockSize * 2),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
        validator: validator,
        controller: controller,
        inputFormatters: inputFormatters,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: labelText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
