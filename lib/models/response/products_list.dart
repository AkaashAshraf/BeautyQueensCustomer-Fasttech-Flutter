// To parse this JSON data, do
//
//     final productsResponse = productsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:beauty_queens_ustomer/models/simple/products.dart';

ProductsResponse productsResponseFromJson(String str) =>
    ProductsResponse.fromJson(json.decode(str));

String productsResponseToJson(ProductsResponse data) =>
    json.encode(data.toJson());

class ProductsResponse {
  ProductsResponse({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Product>? data;

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      ProductsResponse(
        status: json["status"] ?? 0,
        message: json["message"] ?? "",
        data: json["data"] == null
            ? []
            : List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status ?? 0,
        "message": message ?? "",
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
