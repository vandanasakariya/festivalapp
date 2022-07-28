import 'dart:io';

import 'package:festivalapp/home_page/festival_controller.dart';

import 'package:festivalapp/theam/app_string.dart';
import 'package:festivalapp/utils/navigation-utils/navigation.dart';
import 'package:festivalapp/utils/navigation-utils/routes.dart';
import 'package:festivalapp/utils/size_utils.dart';
import 'package:festivalapp/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({Key? key}) : super(key: key);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  FestivalController festivalController = Get.put(FestivalController());
  File? img;
  final ImagePicker picker = ImagePicker();
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
                key: festivalController.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: AppString.pleaseFillSomeDetail,
                      fontWeight: FontWeight.bold,
                    ),
                    AppText(
                      text: AppString.prepareCard,
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeUtils.verticalBlockSize * 2),
                      child: Center(
                        child: Container(
                          child: InkWell(
                            // clipBehavior: Clip.none,
                            onTap: () async {
                              XFile? pickedImage = await picker.pickImage(
                                  source: ImageSource.gallery);
                              setState(() {
                                img = File(pickedImage!.path);
                              });
                            },
                            child: img == null
                                ? Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey.shade200),
                                    alignment: Alignment.center,
                                    height: SizeUtils.verticalBlockSize * 20,
                                    width: SizeUtils.verticalBlockSize * 25,
                                    child: Text("Select From Gallery"),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    height: SizeUtils.verticalBlockSize * 20,
                                    width: SizeUtils.verticalBlockSize * 25,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          img!,
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                          ),
                          height: SizeUtils.verticalBlockSize * 20,
                          width: SizeUtils.horizontalBlockSize * 40,
                          /* decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1)),*/
                          color: Colors.white,
                        ),
                      ),
                    ),

                    /*Center(
                        child: InkWell(
                      onTap: () {
                        //_takePhoto(ImageSource.gallery);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeUtils.verticalBlockSize * 2),
                        child: Container(
                          height: SizeUtils.verticalBlockSize * 20,
                          width: SizeUtils.horizontalBlockSize * 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black, width: 1)),
                        ),
                      ),
                    )),*/
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
                        if (name != null) {
                          return "Enter Company Name";
                        }
                      },
                    ),
                    _commonTextField(
                      labelText: AppString.companyAdd,
                      controller: festivalController.addController,
                      validator: (add) {
                        if (add != null) {
                          return "Enter Company Adress";
                        }
                      },
                    ),
                    _commonTextField(
                      labelText: AppString.city,
                      controller: festivalController.cityController,
                      validator: (city) {
                        if (city != null) {
                          return "Enter City";
                        }
                      },
                    ),
                    _commonTextField(
                      labelText: AppString.mobileNo,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      controller: festivalController.phoneController,
                      validator: (mono) {
                        if (mono != null) {
                          return "Enter Mobile No";
                        }
                      },
                    ),
                    _commonTextField(
                      labelText: AppString.emailadd,
                      controller: festivalController.emailController,
                      validator: (email) {
                        if (email != null) {
                          return "Enter Email";
                        }
                      },
                    ),
                    InkWell(
                      onTap: () {
                        Navigation.pushNamed(Routes.cardsPage);
                        festivalController.nameController.clear();
                        festivalController.addController.clear();
                        festivalController.cityController.clear();
                        festivalController.phoneController.clear();
                        festivalController.emailController.clear();
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
      ),
    );
  }

  /*_takePhoto(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      imageFile = pickedFile!;
    });
  }*/

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
