class Product {
  Product({
    this.id,
    this.shopId,
    this.brandId,
    this.image1,
    this.image2,
    this.image3,
    this.price,
    this.status,
    this.nameEn,
    this.nameAr,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.brandEn,
    this.brandAr,
    this.brandImage,
    this.ratting,
    this.ratters,
  });

  int? id;
  int? shopId;
  int? brandId;
  String? image1;
  String? image2;
  String? image3;
  dynamic price;
  int? status;
  String? nameEn;
  String? nameAr;
  int? createdBy;
  String? createdAt;
  String? updatedAt;
  String? brandEn;
  String? brandAr;
  String? brandImage;
  int? ratting;
  int? ratters;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] ?? 0,
        shopId: json["shop_id"] ?? 0,
        brandId: json["brand_id"] ?? 0,
        image1: json["image_1"] ?? "",
        image2: json["image_2"] ?? "",
        image3: json["image_3"] ?? "",
        price: json["price"] ?? 0,
        status: json["status"] ?? 0,
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
        createdBy: json["created_by"] ?? 0,
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        brandEn: json["brand_en"] ?? "",
        brandAr: json["brand_ar"] ?? "",
        brandImage: json["brand_image"] ?? "",
        ratting: json["ratting"] ?? 0,
        ratters: json["ratters"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "shop_id": shopId ?? 0,
        "brand_id": brandId ?? 0,
        "image_1": image1 ?? "",
        "image_2": image2 ?? "",
        "image_3": image3 ?? "",
        "price": price ?? 0,
        "status": status ?? 0,
        "name_en": nameEn ?? "",
        "name_ar": nameAr ?? "",
        "created_by": createdBy ?? 0,
        "created_at": createdAt ?? "",
        "updated_at": updatedAt ?? "",
        "brand_en": brandEn ?? "",
        "brand_ar": brandAr ?? "",
        "brand_image": brandImage ?? "",
        "ratting": ratting ?? 0,
        "ratters": ratters ?? 0,
      };
}
