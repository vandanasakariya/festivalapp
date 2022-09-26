// To parse this JSON data, do
//
//     final holiModal = holiModalFromJson(jsonString);

import 'dart:convert';

HoliModal holiModalFromJson(String str) => HoliModal.fromJson(json.decode(str));

String holiModalToJson(HoliModal data) => json.encode(data.toJson());

class HoliModal {
  HoliModal({
    this.holi,
  });

  List<String>? holi;

  factory HoliModal.fromJson(Map<String, dynamic> json) => HoliModal(
        holi: List<String>.from(json["holi"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "holi": List<dynamic>.from(holi!.map((x) => x)),
      };
}
