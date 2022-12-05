// To parse this JSON data, do
//
//     final dhanTerasModel = dhanTerasModelFromJson(jsonString);

import 'dart:convert';

DhanTerasModel dhanTerasModelFromJson(String str) => DhanTerasModel.fromJson(json.decode(str));

String dhanTerasModelToJson(DhanTerasModel data) => json.encode(data.toJson());

class DhanTerasModel {
  DhanTerasModel({
    this.dhanTeras,
  });

  List<String> ?dhanTeras;

  factory DhanTerasModel.fromJson(Map<String, dynamic> json) => DhanTerasModel(
    dhanTeras: List<String>.from(json["Dhan-Teras"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Dhan-Teras": List<dynamic>.from(dhanTeras!.map((x) => x)),
  };
}
