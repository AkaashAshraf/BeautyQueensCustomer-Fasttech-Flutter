// To parse this JSON data, do
//
//     final saloons = saloonsFromJson(jsonString);

import 'dart:convert';

import 'package:beauty_queens_ustomer/models/simple/saloon.dart';

Saloons saloonsFromJson(String str) => Saloons.fromJson(json.decode(str));

String saloonsToJson(Saloons data) => json.encode(data.toJson());

class Saloons {
  Saloons({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Saloon>? data;

  factory Saloons.fromJson(Map<String, dynamic> json) => Saloons(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<Saloon>.from(json["data"].map((x) => Saloon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
