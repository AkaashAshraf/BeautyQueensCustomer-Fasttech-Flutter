// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"] ?? "",
        message: json["message"] ?? "",
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status ?? "",
        "message": message ?? "",
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.user,
    this.token,
  });

  User? user;
  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user!.toJson(),
        "token": token ?? "",
      };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.contact,
    this.isBlocked,
    this.isActive,
    this.deviceId,
    this.totalBooking,
    this.password,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? email;
  String? contact;
  int? isBlocked;
  int? isActive;
  dynamic deviceId;
  int? totalBooking;
  String? password;
  String? createdAt;
  String? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        contact: json["contact"] ?? "",
        isBlocked: json["isBlocked"] ?? 0,
        isActive: json["isActive"] ?? 1,
        deviceId: json["device_id"],
        totalBooking: json["total_booking"] ?? 0,
        password: json["password"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "name": name ?? "",
        "email": email ?? "",
        "contact": contact ?? "",
        "isBlocked": isBlocked ?? 0,
        "isActive": isActive ?? 1,
        "device_id": deviceId,
        "total_booking": totalBooking ?? 0,
        "password": password ?? "",
        "created_at": createdAt ?? "",
        "updated_at": updatedAt ?? "",
      };
}
