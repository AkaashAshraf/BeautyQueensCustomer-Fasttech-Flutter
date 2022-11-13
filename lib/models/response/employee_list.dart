// To parse this JSON data, do
//
//     final employees = employeesFromJson(jsonString);

import 'dart:convert';

import 'package:beauty_queens_ustomer/models/simple/employee.dart';

Employees employeesFromJson(String str) => Employees.fromJson(json.decode(str));

String employeesToJson(Employees data) => json.encode(data.toJson());

class Employees {
  Employees({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Employee>? data;

  factory Employees.fromJson(Map<String, dynamic> json) => Employees(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<Employee>.from(
                json["data"].map((x) => Employee.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
