import 'package:beauty_queens_ustomer/models/simple/requested_service.dart';

class Appointment {
  Appointment({
    this.id = 0,
    this.saloonId = 0,
    this.customerId = 0,
    this.employeeId = 0,
    this.status = 0,
    this.totalAmount = 0,
    this.totalServices = 0,
    this.discount = 0,
    this.priceAfterDiscount = 0,
    this.discountDescription = "",
    this.respondBy,
    this.appointmentDateTime = "",
    this.createdAt = '',
    this.updatedAt = '',
    this.timeElapsed = 0,
    required this.requestedServices,
  });

  int id;
  int saloonId;
  int customerId;
  int employeeId;
  int status;
  double totalAmount;
  int totalServices;
  int discount;
  double priceAfterDiscount;
  String discountDescription;
  dynamic respondBy;
  String appointmentDateTime;
  String createdAt;
  String updatedAt;
  int timeElapsed;
  List<RequestedService> requestedServices;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json["id"] ?? 0,
        saloonId: json["saloon_id"] ?? 0,
        customerId: json["customer_id"] ?? 0,
        employeeId: json["employee_id"] ?? 0,
        status: json["status"] ?? 0,
        totalAmount: json["total_amount"] ?? 0,
        totalServices: json["total_services"] ?? 0,
        discount: json["discount"] ?? 0,
        priceAfterDiscount: json["price_after_discount"] ?? 0,
        discountDescription: json["discount_description"] ?? "",
        respondBy: json["respond_by"],
        appointmentDateTime: json["appointment_date_time"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        timeElapsed: json["time_elapsed"] ?? 0,
        requestedServices: List<RequestedService>.from(
            json["requested_services"]
                .map((x) => RequestedService.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "saloon_id": saloonId,
        "customer_id": customerId,
        "employee_id": employeeId,
        "status": status,
        "total_amount": totalAmount,
        "total_services": totalServices,
        "discount": discount,
        "price_after_discount": priceAfterDiscount,
        "discount_description": discountDescription,
        "respond_by": respondBy,
        "appointment_date_time": appointmentDateTime,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "time_elapsed": timeElapsed,
        "requested_services":
            List<dynamic>.from(requestedServices.map((x) => x.toJson())),
      };
}
