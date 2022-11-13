// To parse this JSON data, do
//
//     final shopsResponse = shopsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:beauty_queens_ustomer/models/simple/shop.dart';

ShopsResponse shopsResponseFromJson(String str) =>
    ShopsResponse.fromJson(json.decode(str));

String shopsResponseToJson(ShopsResponse data) => json.encode(data.toJson());

class ShopsResponse {
  ShopsResponse({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Shop>? data;

  factory ShopsResponse.fromJson(Map<String, dynamic> json) => ShopsResponse(
        status: json["status"] ?? 0,
        message: json["message"] ?? "",
        data: json["data"] == []
            ? null
            : List<Shop>.from(json["data"].map((x) => Shop.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status ?? 0,
        "message": message ?? "",
        "data": data == []
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
