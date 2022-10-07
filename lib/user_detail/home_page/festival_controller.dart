import 'dart:convert';

import 'dart:io' as Io;

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../api/dhanateras_modal.dart';
import '../../api/diwali_modal.dart';
import '../../api/happynewyear_modal.dart';
import '../../api/holi_modal.dart';
import '../../api/janmastami_modal.dart';
import '../../api/modal.dart';
import '../../api/service.dart';
import '../../api/uttrayan_modal.dart';
import '../../utils/shardprafrance.dart';

class FestivalController extends GetxController {
  RxString imageChange = "".obs;
  RxInt i = 0.obs;

  RxInt isCheckApi = 0.obs;
  RxString city = "".obs;
  RxString insta = "".obs;
  RxString fb = "".obs;
  RxString phoneNo = "".obs;
  RxString companyAdd = "".obs;
  RxBool userLogin = false.obs;
  RxBool loding = false.obs;
  final nameController =
      TextEditingController(text: AppPreference.getString("companyname"));
  final addController =
      TextEditingController(text: AppPreference.getString("companyadd"));
  final cityController =
      TextEditingController(text: AppPreference.getString("city"));
  final phoneController =
      TextEditingController(text: AppPreference.getString("phoneno"));
  final emailController =
      TextEditingController(text: AppPreference.getString("email"));
  final fbController =
      TextEditingController(text: AppPreference.getString("fb"));
  final instaController =
      TextEditingController(text: AppPreference.getString("insta"));

  var img64;

  @override
  void onInit() {
    getFestivalMethod();
    getMahashivratriMeth();
    super.onInit();
  }

  Rx<FestivalModal> festivalModal = FestivalModal().obs;
  Future<void> getFestivalMethod() async {
    loding.value = true;
    final result = await FestivalService.festivalServiceMethod();
    if (result != null) {
      festivalModal.value = result;

      // print("asas---${festivalModal.value.festival}");
    }
    loding.value = false;
  }

  Rx<DhanTerasModal> dhanteras = DhanTerasModal().obs;
  Future<void> getDhanTeras() async {
    loding.value = true;
    final result = await FestivalService.dhanTeras();
    if (result != null) {
      dhanteras.value = result;
      print("dhanteras---${dhanteras.value.dhanTeras}");
    }
    loding.value = false;
  }

  Rx<DiwaliModal> diwaliModal = DiwaliModal().obs;
  Future<void> getDiwaliMeth() async {
    loding.value = true;
    final result = await FestivalService.DiwaliMethod();
    if (result != null) {
      diwaliModal.value = result;
      print("uttrayan---${diwaliModal.value.diwali}");
    }
    loding.value = false;
  }

  Rx<HappyNewYearModal> happyNewYear = HappyNewYearModal().obs;
  Future<void> getHappyNewYearMeth() async {
    loding.value = true;
    final result = await FestivalService.getHappyNewYer();
    if (result != null) {
      happyNewYear.value = result;
      print("happyNewYear---${happyNewYear.value.happyNewYear}");
    }
    loding.value = false;
  }

  Rx<UttrayanModal> uttrayanModal = UttrayanModal().obs;
  Future<void> getUttrayanMeth() async {
    loding.value = true;
    final result = await FestivalService.uttrayanMeth();
    if (result != null) {
      uttrayanModal.value = result;
      print("uttrayan---${uttrayanModal.value.uttrayan}");
    }
    loding.value = false;
  }

  Rx<HoliModal> holiModal = HoliModal().obs;
  Future<void> getHoliMeth() async {
    loding.value = true;
    final result = await FestivalService.holliMeth();
    if (result != null) {
      holiModal.value = result;
      print("uttrayan---${holiModal.value.holi}");
    }
    loding.value = false;
  }

  Rx<JanmashtamiModal> janmashtamiModal = JanmashtamiModal().obs;
  Future<void> getMahashivratriMeth() async {
    loding.value = true;
    print("mahashivratri---4");
    final result = await FestivalService.janmashtamiMeth();
    print("mahashivratri---5");

    if (result != null) {
      janmashtamiModal.value = result;
      print("mahashivratri---6");
    }
    loding.value = false;
  }

  void company() {
    companyAdd.value = AppPreference.getString("companyadd");
    city.value = AppPreference.getString("city");
    insta.value = AppPreference.getString("insta");
    fb.value = AppPreference.getString("fb");
    phoneNo.value = AppPreference.getString("phoneno");
  }

  void imageShow() {
    img64 = base64Decode(
      AppPreference.getString("image"),
    );
  }

  var seletedImagePath = ''.obs;

  void pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      seletedImagePath.value = pickedImage.path;
      final bytes = Io.File(seletedImagePath.value).readAsBytesSync();
      String img64 = base64Encode(bytes);
      AppPreference.setString("image", img64);
    }

    update();
  }
}
