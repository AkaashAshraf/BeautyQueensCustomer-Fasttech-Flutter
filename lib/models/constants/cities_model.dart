// To parse this JSON data, do
//
//     final citiesResponse = citiesResponseFromJson(jsonString);

import 'dart:convert';

import 'package:beauty_queens_ustomer/models/simple/city.dart';

CitiesResponse citiesResponseFromJson(String str) =>
    CitiesResponse.fromJson(json.decode(str));

String citiesResponseToJson(CitiesResponse data) => json.encode(data.toJson());

class CitiesResponse {
  CitiesResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<City> data;

  factory CitiesResponse.fromJson(Map<String, dynamic> json) => CitiesResponse(
        status: json["status"],
        message: json["message"],
        data: List<City>.from(json["data"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
