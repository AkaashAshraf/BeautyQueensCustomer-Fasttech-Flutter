import 'dart:developer';

import 'package:beauty_queens_ustomer/config/constants.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

Future<dynamic> post(String url, dynamic body) async {
  try {
    var response =
        await http.post(Uri.parse(baseUrl + url), body: body, headers: {
      "Accept": "application/json",
      // "Authorization": "Bearer $token"
    });
    // inspect(response);

    // print("url hitted now  ======>${baseUrl + url}");
    // print(
    //     "response of api-------------------------------------------------start");
    // print(response.body);
    // print(
    //     "response of api-------------------------------------------------end");

    // return response.body;
    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401) {
    } else {
      return response;
    }
  } catch (e) {
    print("----------------------");

    print(e.toString());
    print("-------------ppppppppp---------");
    return e.toString();
  }
}

Future<dynamic> get(String url) async {
  try {
    var response = await http.get(Uri.parse(baseUrl + url), headers: {
      "Accept": "application/json",
      // "Authorization": "Bearer $token"
    });
    // print(response.body);
    // return response.statusCode;
    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401) {
      return null;
    } else {
      return null;
    }
  } catch (e) {
    return e;
  }
}
