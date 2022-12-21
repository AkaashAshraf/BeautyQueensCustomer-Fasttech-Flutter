class Cart {
  Cart(
      {this.productID = 0,
      this.nameEn = "",
      this.nameAr = "",
      this.qty = 1,
      this.time = "",
      this.unitPrice = 0,
      this.providerID = 0});

  int productID;
  int providerID;

  String nameEn;
  String nameAr;
  int qty;
  double unitPrice;
  String time;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        productID: json["productID"] ?? 0,
        providerID: json["providerID"] ?? 0,
        nameEn: json["name_en"] ?? "",
        nameAr: json["name_ar"] ?? "",
        qty: json["qty"] ?? 0,
        unitPrice: json["unitPrice"] ?? 0,
        time: json["time"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "productID": productID,
        "providerID": providerID,
        "name_en": nameEn,
        "name_ar": nameAr,
        "qty": qty,
        "unitPrice": unitPrice,
        "time": time,
      };
}
