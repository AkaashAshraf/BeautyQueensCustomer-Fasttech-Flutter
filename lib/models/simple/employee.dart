class Employee {
  Employee({
    this.empId,
    this.exp,
    this.nameEn,
    this.nameAr,
    this.image,
    this.isActive,
    this.isDeleted,
    this.religionEn,
    this.religionAr,
    this.countryEn,
    this.holiday1 = 0,
    this.holiday2 = 0,
    this.countryAr,
  });

  int? empId;
  String? exp;
  String? nameEn;
  String? nameAr;
  String? image;
  int? isActive;

  int holiday1;
  int holiday2;
  int? isDeleted;
  String? religionEn;
  String? religionAr;
  String? countryEn;
  String? countryAr;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        empId: json["emp_id"] ?? "",
        exp: json["exp"] ?? "",
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
        image: json["image"] ?? "",
        holiday1: json["holiday_1"] ?? 0,
        holiday2: json["holiday_2"] ?? 0,
        isActive: json["isActive"] ?? "",
        isDeleted: json["isDeleted"] ?? "",
        religionEn: json["religion_en"] ?? "",
        religionAr: json["religion_ar"] ?? "",
        countryEn: json["country_en"] ?? "",
        countryAr: json["country_ar"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "emp_id": empId,
        "exp": exp,
        "name_en": nameEn,
        "name_ar": nameAr,
        "image": image,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "religion_en": religionEn,
        "religion_ar": religionAr,
        "country_en": countryEn,
        "country_ar": countryAr,
      };
}
