// To parse this JSON data, do
//
//     final festivalModal = festivalModalFromJson(jsonString);

import 'dart:convert';

FestivalModal festivalModalFromJson(String str) =>
    FestivalModal.fromJson(json.decode(str));

String festivalModalToJson(FestivalModal data) => json.encode(data.toJson());

class FestivalModal {
  FestivalModal({
    this.festival,
  });

  List<String>? festival;

  factory FestivalModal.fromJson(Map<String, dynamic> json) => FestivalModal(
        festival: List<String>.from(json["festival"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "festival": List<dynamic>.from(festival!.map((x) => x)),
      };
}
