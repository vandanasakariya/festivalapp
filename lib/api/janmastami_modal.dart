// To parse this JSON data, do
//
//     final janmashtamiModal = janmashtamiModalFromJson(jsonString);

import 'dart:convert';

JanmashtamiModal janmashtamiModalFromJson(String str) =>
    JanmashtamiModal.fromJson(json.decode(str));

String janmashtamiModalToJson(JanmashtamiModal data) =>
    json.encode(data.toJson());

class JanmashtamiModal {
  JanmashtamiModal({
    this.janmashtami,
  });

  List<String>? janmashtami;

  factory JanmashtamiModal.fromJson(Map<String, dynamic> json) =>
      JanmashtamiModal(
        janmashtami: List<String>.from(json["Janmashtami"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Janmashtami": List<dynamic>.from(janmashtami!.map((x) => x)),
      };
}
