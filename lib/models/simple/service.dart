class Service {
  Service(
      {this.serviceAssigneeId,
      this.servicesId,
      this.isActive,
      this.charges,
      this.discount,
      this.assigneeImage,
      this.generalImage,
      this.nameEn,
      this.nameAr,
      this.descriptionEn,
      this.time = 0,
      this.descriptionAr,
      this.isAddedToCart = false});

  int? serviceAssigneeId;
  int? servicesId;
  int? isActive;
  int time;
  bool isAddedToCart;
  String? charges;
  int? discount;
  String? assigneeImage;
  String? generalImage;
  String? nameEn;
  String? nameAr;
  String? descriptionEn;
  String? descriptionAr;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        serviceAssigneeId: json["service_assignee_id"] ?? 0,
        time: json["time"] ?? "",
        servicesId: json["services_id"] ?? 0,
        isActive: json["isActive"] ?? 1,
        charges: json["charges"] ?? "",
        discount: json["discount"] ?? 0,
        assigneeImage: json["assignee_image"] ?? "",
        generalImage: json["general_image"] ?? "",
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
        descriptionEn: json["description_en"] ?? "",
        descriptionAr: json["description_ar"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "service_assignee_id": serviceAssigneeId,
        "services_id": servicesId,
        "time": time,
        "isActive": isActive,
        "charges": charges,
        "discount": discount,
        "assignee_image": assigneeImage,
        "general_image": generalImage,
        "name_en": nameEn,
        "name_ar": nameAr,
        "description_en": descriptionEn,
        "description_ar": descriptionAr,
      };
}
