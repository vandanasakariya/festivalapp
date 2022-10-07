// To parse this JSON data, do
//
//     final dhanTerasModal = dhanTerasModalFromJson(jsonString);

import 'dart:convert';

DhanTerasModal dhanTerasModalFromJson(String str) =>
    DhanTerasModal.fromJson(json.decode(str));

String dhanTerasModalToJson(DhanTerasModal data) => json.encode(data.toJson());

class DhanTerasModal {
  DhanTerasModal({
    this.dhanTeras,
  });

  List<String>? dhanTeras;

  factory DhanTerasModal.fromJson(Map<String, dynamic> json) => DhanTerasModal(
        dhanTeras: List<String>.from(json["Dhan_Teras"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Dhan_Teras": List<dynamic>.from(dhanTeras!.map((x) => x)),
      };
}
