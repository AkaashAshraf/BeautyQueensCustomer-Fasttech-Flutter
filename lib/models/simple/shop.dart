class Shop {
  Shop({
    this.id,
    this.nameEn,
    this.nameAr,
    this.city,
    this.image1,
    this.image2,
    this.image3,
    this.contact,
    this.status,
    this.createdBy,
    this.latitude,
    this.longitude,
    this.b1,
    this.b2,
    this.b3,
    this.b4,
    this.b5,
    this.b6,
    this.b7,
    this.b8,
    this.b9,
    this.b10,
    this.createdAt,
    this.updatedAt,
    this.cityEn,
    this.cityAr,
  });

  int? id;
  String? nameEn;
  String? nameAr;
  int? city;
  String? image1;
  int? image2;
  String? image3;
  String? contact;
  int? status;
  int? createdBy;
  dynamic latitude;
  dynamic longitude;

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

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["id"] ?? "",
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
        city: json["city"] ?? "",
        image1: json["image_1"] ?? "",
        image2: json["image_2"] ?? "",
        image3: json["image_3"] ?? "",
        contact: json["contact"] ?? "",
        status: json["status"] ?? 0,
        createdBy: json["created_by"] ?? 0,
        latitude: json["latitude"] ?? 0,
        longitude: json["longitude"] ?? 0,
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
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "name_en": nameEn ?? "",
        "name_ar": nameAr ?? "",
        "city": city ?? 0,
        "image_1": image1 ?? "",
        "image_2": image2 ?? "",
        "image_3": image3 ?? "",
        "contact": contact ?? "",
        "status": status ?? "",
        "created_by": createdBy ?? "",
        "latitude": latitude ?? 0,
        "longitude": longitude ?? 0,
        "b1": b1 ?? "",
        "b2": b2 ?? "",
        "b3": b3 ?? "",
        "b4": b4 ?? "",
        "b5": b5 ?? "",
        "b6": b6 ?? "",
        "b7": b7 ?? "",
        "b8": b8 ?? "",
        "b9": b9 ?? "",
        "b10": b10 ?? "",
        "created_at": createdAt ?? "",
        "updated_at": updatedAt ?? "",
        "city_en": cityEn ?? "",
        "city_ar": cityAr ?? "",
      };
}
