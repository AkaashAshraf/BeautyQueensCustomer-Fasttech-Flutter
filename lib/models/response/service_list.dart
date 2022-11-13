// To parse this JSON data, do
//
//     final services = servicesFromJson(jsonString);

import 'dart:convert';

import 'package:beauty_queens_ustomer/models/simple/service.dart';

Services servicesFromJson(String str) => Services.fromJson(json.decode(str));

String servicesToJson(Services data) => json.encode(data.toJson());

class Services {
  Services({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Service>? data;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        status: json["status"] ?? "",
        message: json["message"] ?? "",
        data: json["data"] == null
            ? []
            : List<Service>.from(json["data"].map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status ?? "",
        "message": message ?? "",
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
