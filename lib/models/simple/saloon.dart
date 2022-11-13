class Saloon {
  Saloon({
    this.id,
    this.nameEn,
    this.nameAr,
    this.city,
    this.contact,
    this.latitude,
    this.longitude,
    this.isDeleted,
    this.isBlocked,
    this.remainingAppointments,
    this.password,
    this.imagePath,
    this.deviceId,
    this.createdAt,
    this.updatedAt,
    this.cityEn,
    this.cityAr,
  });

  int? id;
  String? nameEn;
  String? nameAr;
  int? city;
  String? contact;
  String? latitude;
  String? longitude;
  int? isDeleted;
  int? isBlocked;
  int? remainingAppointments;
  String? password;
  String? imagePath;
  dynamic deviceId;
  String? createdAt;
  String? updatedAt;
  String? cityEn;
  String? cityAr;

  factory Saloon.fromJson(Map<String, dynamic> json) => Saloon(
        id: json["id"] ?? 0,
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
        city: json["city"] ?? "",
        contact: json["contact"] ?? "",
        latitude: json["latitude"] ?? "",
        longitude: json["longitude"] ?? "",
        isDeleted: json["isDeleted"] ?? "",
        isBlocked: json["isBlocked"] ?? "",
        remainingAppointments: json["remaining_appointments"] ?? "",
        password: json["password"] ?? "",
        imagePath: json["image_path"] ?? "",
        deviceId: json["device_id"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        cityEn: json["city_en"] ?? "",
        cityAr: json["city_ar"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_ar": nameAr,
        "city": city,
        "contact": contact,
        "latitude": latitude,
        "longitude": longitude,
        "isDeleted": isDeleted,
        "isBlocked": isBlocked,
        "remaining_appointments": remainingAppointments,
        "password": password,
        "image_path": imagePath,
        "device_id": deviceId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "city_en": cityEn,
        "city_ar": cityAr,
      };
}
