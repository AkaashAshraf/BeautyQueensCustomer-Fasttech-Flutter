// To parse this JSON data, do
//
//     final providers = providersFromJson(jsonString);

import 'dart:convert';

import 'package:beauty_queens_ustomer/models/simple/city.dart';
import 'package:beauty_queens_ustomer/models/simple/saloon.dart';

Providers? providersFromJson(String str) =>
    Providers.fromJson(json.decode(str));

String providersToJson(Providers? data) => json.encode(data!.toJson());

class Providers {
  Providers({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Saloon>? data;

  factory Providers.fromJson(Map<String, dynamic> json) => Providers(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : json["data"] == null
                ? []
                : List<Saloon>.from(
                    json["data"]!.map((x) => Saloon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : data == null
                ? []
                : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
