// To parse this JSON data, do
//
//     final happyNewYearModal = happyNewYearModalFromJson(jsonString);

import 'dart:convert';

HappyNewYearModal happyNewYearModalFromJson(String str) =>
    HappyNewYearModal.fromJson(json.decode(str));

String happyNewYearModalToJson(HappyNewYearModal data) =>
    json.encode(data.toJson());

class HappyNewYearModal {
  HappyNewYearModal({
    this.happyNewYear,
  });

  List<String>? happyNewYear;

  factory HappyNewYearModal.fromJson(Map<String, dynamic> json) =>
      HappyNewYearModal(
        happyNewYear: List<String>.from(json["Happy_New_Year"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Happy_New_Year": List<dynamic>.from(happyNewYear!.map((x) => x)),
      };
}
