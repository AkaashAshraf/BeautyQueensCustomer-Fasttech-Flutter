// To parse this JSON data, do
//
//     final shops = shopsFromJson(jsonString);

import 'dart:convert';

import 'package:beauty_queens_ustomer/models/simple/shop.dart';

Shops? shopsFromJson(String str) => Shops.fromJson(json.decode(str));

String shopsToJson(Shops? data) => json.encode(data!.toJson());

class Shops {
  Shops({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Shop>? data;

  factory Shops.fromJson(Map<String, dynamic> json) => Shops(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : json["data"] == null
                ? []
                : List<Shop>.from(json["data"]!.map((x) => Shop.fromJson(x))),
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
