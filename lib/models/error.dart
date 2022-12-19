// To parse this JSON data, do
//
//     final error = errorFromJson(jsonString);

import 'dart:convert';

Error errorFromJson(String str) => Error.fromJson(json.decode(str));

String errorToJson(Error data) => json.encode(data.toJson());

class Error {
  Error({
    this.status,
    this.errors,
  });

  String? status;
  String? errors;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        status: json["status"] ?? "",
        errors: json["errors"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "status": status ?? "",
        "errors": errors ?? "",
      };
}
