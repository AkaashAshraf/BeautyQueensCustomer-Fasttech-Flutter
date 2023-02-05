// To parse this JSON data, do
//
//     final OfferList = OfferListFromJson(jsonString);

import 'dart:convert';

import 'package:beauty_queens_ustomer/models/simple/saloon.dart';
import 'package:beauty_queens_ustomer/models/simple/shop.dart';

OfferList offerListFromJson(String str) => OfferList.fromJson(json.decode(str));

String offerListToJson(OfferList data) => json.encode(data.toJson());

class OfferList {
  OfferList({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Offer>? data;

  factory OfferList.fromJson(Map<String, dynamic> json) => OfferList(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Offer>.from(json["data"]!.map((x) => Offer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Offer {
  Offer({
    this.id = 0,
    this.companyId = 0,
    this.providerType = 1,
    this.startDate = "",
    this.endDate = "",
    this.duration = 0,
    this.toStamp = "",
    this.fromStamp = "",
    this.discount = 0,
    this.description = "",
    this.descriptionAr = "",
    this.imagePath1 = "",
    this.imagePath2 = "",
    this.imagePath3 = "",
    this.createdAt = "",
    this.updatedAt = "",
    this.saloon,
    this.shop,
  });

  int? id;
  int? companyId;
  int? providerType;

  String? startDate;
  String? endDate;
  int? duration;
  String? toStamp;
  String? fromStamp;
  int? discount;
  String? description;
  String? descriptionAr;

  String? imagePath1;
  String? imagePath2;
  String? imagePath3;
  String? createdAt;
  String? updatedAt;
  Saloon? saloon;
  Shop? shop;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"] ?? 0,
        companyId: json["company_id"] ?? 0,
        providerType: json["provider_type"] ?? 1,
        startDate: json["start_date"] ?? "",
        endDate: json["end_date"] ?? "",
        duration: json["duration"] ?? 0,
        toStamp: json["to_stamp"] ?? "",
        fromStamp: json["from_stamp"] ?? "",
        discount: json["discount"] ?? 0,
        description: json["description"] ?? "",
        descriptionAr: json["description_ar"] ?? "",
        imagePath1: json["image_path1"] ?? "",
        imagePath2: json["image_path2"] ?? "",
        imagePath3: json["image_path3"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        saloon: json["saloon"] == null ? null : Saloon.fromJson(json["saloon"]),
        shop: json["shop"] == null ? null : Shop.fromJson(json["shop"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_id": companyId,
        "provider_type": providerType,
        "start_date": startDate,
        "end_date": endDate,
        "duration": duration,
        "to_stamp": toStamp,
        "from_stamp": fromStamp,
        "discount": discount,
        "description": description,
        "image_path1": imagePath1,
        "image_path2": imagePath2,
        "image_path3": imagePath3,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "saloon": saloon?.toJson(),
        "shop": shop?.toJson(),
      };
}
