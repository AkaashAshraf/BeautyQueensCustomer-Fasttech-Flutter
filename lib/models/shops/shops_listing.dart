// To parse this JSON data, do
//
//     final shops = shopsFromJson(jsonString);

import 'dart:convert';

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

class Shop {
  Shop({
    this.id = 0,
    this.nameEn = "",
    this.nameAr = "",
    this.city = 0,
    this.image1 = "",
    this.image2 = 0,
    this.image3 = "",
    this.contact = "",
    this.type = 0,
    this.status = 0,
    this.createdBy = 0,
    this.b1 = "",
    this.b2 = "",
    this.b3 = "",
    this.b4 = "",
    this.b5 = "",
    this.b6 = "",
    this.b7 = "",
    this.b8 = "",
    this.b9 = "",
    this.b10 = "",
    this.createdAt = "",
    this.updatedAt = "",
    this.cityEn = "",
    this.cityAr = "",
    this.products,
    this.gymPackages,
  });

  int? id;
  String? nameEn;
  String? nameAr;
  int? city;
  String? image1;
  int? image2;
  dynamic image3;
  String? contact;
  int? type;
  int? status;
  int? createdBy;
  String? b1;
  String? b2;
  String? b3;
  String? b4;
  String? b5;
  String? b6;
  String? b7;
  String? b8;
  String? b9;
  String? b10;
  String? createdAt;
  String? updatedAt;
  String? cityEn;
  String? cityAr;
  List<Product?>? products;
  List<GymPackage?>? gymPackages;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["id"] ?? 0,
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
        city: json["city"] ?? 0,
        image1: json["image_1"] ?? "",
        image2: json["image_2"] ?? 0,
        image3: json["image_3"] ?? "",
        contact: json["contact"] ?? "",
        type: json["type"] ?? 0,
        status: json["status"] ?? 0,
        createdBy: json["created_by"] ?? 0,
        b1: json["b1"] ?? "",
        b2: json["b2"] ?? "",
        b3: json["b3"] ?? "",
        b4: json["b4"] ?? "",
        b5: json["b5"] ?? "",
        b6: json["b6"] ?? "",
        b7: json["b7"] ?? "",
        b8: json["b8"] ?? "",
        b9: json["b9"] ?? "",
        b10: json["b10"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        cityEn: json["city_en"] ?? "",
        cityAr: json["city_ar"] ?? "",
        products: json["products"] == null
            ? []
            : json["products"] == null
                ? []
                : List<Product?>.from(
                    json["products"]!.map((x) => Product.fromJson(x))),
        gymPackages: json["gym_packages"] == null
            ? []
            : json["gym_packages"] == null
                ? []
                : List<GymPackage?>.from(
                    json["gym_packages"]!.map((x) => GymPackage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_ar": nameAr,
        "city": city,
        "image_1": image1,
        "image_2": image2,
        "image_3": image3,
        "contact": contact,
        "type": type,
        "status": status,
        "created_by": createdBy,
        "b1": b1,
        "b2": b2,
        "b3": b3,
        "b4": b4,
        "b5": b5,
        "b6": b6,
        "b7": b7,
        "b8": b8,
        "b9": b9,
        "b10": b10,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "city_en": cityEn,
        "city_ar": cityAr,
        "products": products == null
            ? []
            : products == null
                ? []
                : List<dynamic>.from(products!.map((x) => x!.toJson())),
        "gym_packages": gymPackages == null
            ? []
            : gymPackages == null
                ? []
                : List<dynamic>.from(gymPackages!.map((x) => x!.toJson())),
      };
}

class GymPackage {
  GymPackage({
    this.id = 0,
    this.shopId = 0,
    this.nameEn = "",
    this.nameAr = "",
    this.image = "",
    this.price = 0,
    this.duration = "",
    this.description = "",
    this.createdAt = "",
    this.updatedAt = "",
  });

  int? id;
  int? shopId;
  String? nameEn;
  String? nameAr;
  String? image;
  double? price;
  String? duration;
  String? description;
  String? createdAt;
  String? updatedAt;

  factory GymPackage.fromJson(Map<String, dynamic> json) => GymPackage(
        id: json["id"] ?? 0,
        shopId: json["shop_id"] ?? 0,
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
        image: json["image"] ?? "",
        price: double.tryParse(json["price"].toString()),
        duration: json["duration"] ?? "",
        description: json["description"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "name_en": nameEn,
        "name_ar": nameAr,
        "image": image,
        "price": price,
        "duration": duration,
        "description": description,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Product {
  Product({
    this.id = 0,
    this.shopId = 0,
    this.brandId = 0,
    this.image1 = '',
    this.image2 = "",
    this.image3 = "",
    this.price = 0,
    this.status = 0,
    this.nameEn = "",
    this.nameAr = "",
    this.createdAt = "",
    this.updatedAt = "",
    this.brand,
  });

  int? id;
  int? shopId;
  int? brandId;
  String? image1;
  String? image2;
  String? image3;
  double? price;
  int? status;
  String? nameEn;
  String? nameAr;
  String? createdAt;
  String? updatedAt;
  Brand? brand;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] ?? 0,
        shopId: json["shop_id"] ?? 0,
        brandId: json["brand_id"] ?? 0,
        image1: json["image_1"] ?? "",
        image2: json["image_2"] ?? "",
        image3: json["image_3"] ?? "",
        price: double.tryParse(json["price"].toString()),
        status: json["status"] ?? 0,
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        brand: json["brand"] != null ? Brand.fromJson(json["brand"]) : Brand(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "brand_id": brandId,
        "image_1": image1,
        "image_2": image2,
        "image_3": image3,
        "price": price,
        "status": status,
        "name_en": nameEn,
        "name_ar": nameAr,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "brand": brand,
      };
}

class Brand {
  Brand({
    this.id = 0,
    this.nameEn = "",
    this.nameAr = "",
  });

  int? id;
  String? nameEn;
  String? nameAr;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"] ?? 0,
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_ar": nameAr,
      };
}
