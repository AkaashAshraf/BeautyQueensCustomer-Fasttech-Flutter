class Employee {
  Employee({
    this.id = 0,
    this.companyId = 0,
    this.nameEn = "",
    this.nameAr = "",
    this.religion = 0,
    this.contact = "",
    this.country = 0,
    this.experience = "",
    this.image = "",
    this.isDeleted = 0,
    this.isBlocked = 0,
    this.isActive = 1,
    this.createdAt = "",
    this.updatedAt = "",
  });

  int id;
  int companyId;
  String nameEn;
  String nameAr;
  int religion;
  String contact;
  int country;
  String experience;
  String image;
  int isDeleted;
  int isBlocked;
  int isActive;
  String createdAt;
  String updatedAt;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"] ?? 0,
        companyId: json["company_id"] ?? 0,
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
        religion: json["religion"] ?? 0,
        contact: json["contact"] ?? "",
        country: json["country"] ?? 0,
        experience: json["experience"] ?? "",
        image: json["image"] ?? "",
        isDeleted: json["isDeleted"] ?? 0,
        isBlocked: json["isBlocked"] ?? 0,
        isActive: json["isActive"] ?? 1,
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_id": companyId,
        "name_en": nameEn,
        "name_ar": nameAr,
        "religion": religion,
        "contact": contact,
        "country": country,
        "experience": experience,
        "image": image,
        "isDeleted": isDeleted,
        "isBlocked": isBlocked,
        "isActive": isActive,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
