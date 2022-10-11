import 'dart:convert';
import 'dart:developer';

import 'package:festivalapp/api/uttrayan_modal.dart';
import 'package:festivalapp/theam/app_string.dart';
import 'package:http/http.dart' as http;
import 'dhanateras_modal.dart';
import 'diwali_modal.dart';
import 'happynewyear_modal.dart';
import 'holi_modal.dart';
import 'janmastami_modal.dart';
import 'modal.dart';

class FestivalService {
  static Future<FestivalModal?> festivalServiceMethod() async {
    const url = "https://myfestivalcard.glitch.me/api/festival/list";
    final response = await http.get(Uri.parse(url));
    return FestivalModal.fromJson(json.decode(response.body));
  }

  static Future<DhanTerasModal> dhanTeras() async {
    log(AppString.dhanTeras);
    const url = AppString.baseUrl + AppString.dhanTeras;
    final response = await http.get(Uri.parse(url));
    return DhanTerasModal.fromJson(json.decode(response.body));
  }

  static Future<DiwaliModal> DiwaliMethod() async {
    const url = AppString.baseUrl + AppString.diwali;
    final response = await http.get(Uri.parse(url));
    return DiwaliModal.fromJson(json.decode(response.body));
  }

  static Future<HappyNewYearModal> getHappyNewYer() async {
    const url = AppString.baseUrl + AppString.happyNewYear;
    final response = await http.get(Uri.parse(url));
    return HappyNewYearModal.fromJson(json.decode(response.body));
  }

  static Future<UttrayanModal> uttrayanMeth() async {
    const url = AppString.baseUrl + AppString.uttrayan;
    final response = await http.get(Uri.parse(url));
    return UttrayanModal.fromJson(json.decode(response.body));
  }

  static Future<HoliModal> holliMeth() async {
    log("mahashivratri---0");

    const url = AppString.baseUrl + AppString.holi;
    final response = await http.get(Uri.parse(url));
    return HoliModal.fromJson(json.decode(response.body));
  }

  static Future<JanmashtamiModal> janmashtamiMeth() async {
    const url = AppString.baseUrl + AppString.mahashivratri;

    final response = await http.get(
        Uri.parse("https://myfestivalcard.glitch.me/api/festival/Janmashtami"));
    print("Janmashtami----");
    return JanmashtamiModal.fromJson(json.decode(response.body));
  }
}
