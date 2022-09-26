// To parse this JSON data, do
//
//     final uttrayanModal = uttrayanModalFromJson(jsonString);

import 'dart:convert';

UttrayanModal uttrayanModalFromJson(String str) =>
    UttrayanModal.fromJson(json.decode(str));

String uttrayanModalToJson(UttrayanModal data) => json.encode(data.toJson());

class UttrayanModal {
  UttrayanModal({
    this.uttrayan,
  });

  List<String>? uttrayan;

  factory UttrayanModal.fromJson(Map<String, dynamic> json) => UttrayanModal(
        uttrayan: List<String>.from(json["uttrayan"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "uttrayan": List<dynamic>.from(uttrayan!.map((x) => x)),
      };
}
