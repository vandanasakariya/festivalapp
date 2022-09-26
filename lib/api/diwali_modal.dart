// To parse this JSON data, do
//
//     final diwaliModal = diwaliModalFromJson(jsonString);

import 'dart:convert';

DiwaliModal diwaliModalFromJson(String str) =>
    DiwaliModal.fromJson(json.decode(str));

String diwaliModalToJson(DiwaliModal data) => json.encode(data.toJson());

class DiwaliModal {
  DiwaliModal({
    this.diwali,
  });

  List<String>? diwali;

  factory DiwaliModal.fromJson(Map<String, dynamic> json) => DiwaliModal(
        diwali: List<String>.from(json["diwali"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "diwali": List<dynamic>.from(diwali!.map((x) => x)),
      };
}
