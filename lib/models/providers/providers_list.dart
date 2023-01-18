// To parse this JSON data, do
//
//     final providers = providersFromJson(jsonString);

import 'dart:convert';

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
  List<Provider>? data;

  factory Providers.fromJson(Map<String, dynamic> json) => Providers(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : json["data"] == null
                ? []
                : List<Provider>.from(
                    json["data"]!.map((x) => Provider.fromJson(x))),
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

class Provider {
  Provider({
    this.id = 0,
    this.nameEn = "",
    this.nameAr = "",
    this.city = 0,
    this.type = 0,
    this.contact = "",
    this.latitude = "",
    this.longitude = "",
    this.descriptionEn = "",
    this.descriptionAr = "",
    this.openTime1 = "",
    this.closeTime1 = "",
    this.openTime2 = "",
    this.closeTime2 = "",
    this.status = 0,
    this.holiday = "",
    this.remainingAppointments = 0,
    this.imagePath = "",
    this.createdAt = "",
    this.updatedAt = "",
    this.cityEn = "",
    this.cityAr = "",
    this.services,
  });

  int? id;
  String? nameEn;
  String? nameAr;
  int? city;
  int? type;
  String? contact;
  String? latitude;
  String? longitude;
  String? descriptionEn;
  String? descriptionAr;
  String? openTime1;
  String? closeTime1;
  String? openTime2;
  String? closeTime2;
  int? status;
  String? holiday;
  int? remainingAppointments;
  String? imagePath;
  String? createdAt;
  String? updatedAt;
  String? cityEn;
  String? cityAr;
  List<Service>? services;

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json["id"] ?? 0,
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
        city: json["city"] ?? 0,
        type: json["type"] ?? 0,
        contact: json["contact"] ?? "",
        latitude: json["latitude"] ?? "",
        longitude: json["longitude"] ?? "",
        descriptionEn: json["description_en"] ?? "",
        descriptionAr: json["description_ar"] ?? "",
        openTime1: json["open_time_1"] ?? "",
        closeTime1: json["close_time_1"] ?? "",
        openTime2: json["open_time_2"] ?? "",
        closeTime2: json["close_time_2"] ?? '',
        status: json["status"] ?? 0,
        holiday: json["holiday"] ?? "",
        remainingAppointments: json["remaining_appointments"] ?? 0,
        imagePath: json["image_path"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        cityEn: json["city_en"] ?? "",
        cityAr: json["city_ar"] ?? "",
        services: json["services"] == null
            ? []
            : json["services"] == null
                ? []
                : List<Service>.from(
                    json["services"]!.map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_ar": nameAr,
        "city": city,
        "type": type,
        "contact": contact,
        "latitude": latitude,
        "longitude": longitude,
        "description_en": descriptionEn,
        "description_ar": descriptionAr,
        "open_time_1": openTime1,
        "close_time_1": closeTime1,
        "open_time_2": openTime2,
        "close_time_2": closeTime2,
        "status": status,
        "holiday": holiday,
        "remaining_appointments": remainingAppointments,
        "image_path": imagePath,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "city_en": cityEn,
        "city_ar": cityAr,
        "services": services == null
            ? []
            : services == null
                ? []
                : List<dynamic>.from(services!.map((x) => x.toJson())),
      };
}

class Service {
  Service({
    this.id = 0,
    this.companyId = 0,
    this.serviceId = 0,
    this.charges = "",
    this.discount = 0,
    this.time = 0,
    this.chargesAfterDiscount = 0,
    this.discountTime = "",
    this.estimatedTime = "",
    this.descriptionEn = "",
    this.descriptionAr = "",
    this.image = "",
    this.generalService,
  });

  int? id;
  int? companyId;
  int? serviceId;
  String? charges;
  int? discount;
  int? time;
  dynamic chargesAfterDiscount;
  String? discountTime;
  dynamic estimatedTime;
  String? descriptionEn;
  String? descriptionAr;
  String? image;
  GeneralService? generalService;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"] ?? 0,
        companyId: json["company_id"] ?? 0,
        serviceId: json["service_id"] ?? 0,
        charges: json["charges"] ?? "",
        discount: json["discount"] ?? 0,
        time: json["time"] ?? 0,
        chargesAfterDiscount: json["charges_after_discount"] ?? 0,
        discountTime: json["discount_time"] ?? "",
        estimatedTime: json["estimated_time"] ?? "",
        descriptionEn: json["description_en"] ?? "",
        descriptionAr: json["description_ar"] ?? "",
        image: json["image"] ?? "",
        generalService: json["general_service"] != null
            ? GeneralService.fromJson(json["general_service"])
            : GeneralService(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_id": companyId,
        "service_id": serviceId,
        "charges": charges,
        "discount": discount,
        "time": time,
        "charges_after_discount": chargesAfterDiscount,
        "discount_time": discountTime,
        "estimated_time": estimatedTime,
        "description_en": descriptionEn,
        "description_ar": descriptionAr,
        "image": image,
        "general_service": generalService,
      };
}

class GeneralService {
  GeneralService({
    this.id = 0,
    this.nameEn = "",
    this.nameAr = "",
    this.image = "",
  });

  int? id;
  String? nameEn;
  String? nameAr;
  String? image;

  factory GeneralService.fromJson(Map<String, dynamic> json) => GeneralService(
        id: json["id"] ?? 0,
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
        image: json["image"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_ar": nameAr,
        "image": image,
      };
}
