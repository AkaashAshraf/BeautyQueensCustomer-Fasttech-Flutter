import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperController extends GetxController {
  openLocation({
    required dynamic latitude,
    required dynamic longitude,
  }) async {
    final availableMaps = await MapLauncher.installedMaps;

    await availableMaps.first.showMarker(
      coords: Coords(double.tryParse(latitude.toString()) ?? 0.0,
          double.tryParse(longitude.toString()) ?? 0.0),
      title: "",
      description: "",
    );
  }

  String getHolidaysName(int day1, day2) {
    String firstDay = getDayName(day1);
    String secondDay = getDayName(day2);
    return "${firstDay.isNotEmpty ? ('$firstDay,') : ""} $secondDay";
  }

  String getDayName(day) {
    switch (day) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Satureday";
      case 7:
        return "Sunday";

      default:
        return "";
    }
  }

  Widget isProviderOpen(
      {required String open1,
      required String open2,
      required String close1,
      required String close2}) {
    if (open1.isEmpty || open2.isEmpty || close1.isEmpty || close2.isEmpty) {
      return Text(
        "".tr,
        style: const TextStyle(color: Colors.orange, fontFamily: "primary"),
      );
    } else {
      int h1 = 0;
      int h2 = 0;
      int h3 = 0;
      int h4 = 0;
      int m1 = 0;
      int m2 = 0;
      int m3 = 0;
      int m4 = 0;
      int h = DateTime.now().hour;
      int m = DateTime.now().minute;
      var split1 = open1.split(":");
      var split2 = close1.split(":");
      var split3 = open2.split(":");
      var split4 = close2.split(":");
      if (split1.length > 1) {
        h1 = int.tryParse(split1[0]) ?? 0;
        m1 = int.tryParse(split1[1]) ?? 0;
      }
      if (split2.length > 1) {
        h2 = int.tryParse(split2[0]) ?? 0;
        m2 = int.tryParse(split2[1]) ?? 0;
      }
      if (split3.length > 1) {
        h3 = int.tryParse(split3[0]) ?? 0;
        m3 = int.tryParse(split3[1]) ?? 0;
      }
      if (split4.length > 1) {
        h4 = int.tryParse(split4[0]) ?? 0;
        m4 = int.tryParse(split4[1]) ?? 0;
      }
      int time1 = (h1 * 60) + m1;
      int time2 = (h2 * 60) + m2;
      int time3 = (h3 * 60) + m3;
      int time4 = (h4 * 60) + m4;

      int time = (h * 60) + m;

      String text = "Closed Now";
      if (time >= time1 && time <= time2) {
        text = "Open Now ";
      }
      if (time >= time3 && time < time4) {
        text = "Open Now";
      }

      return Text(
        text,
        style: TextStyle(
            color: text == "Closed Now" ? Colors.red : Colors.green,
            fontFamily: "primary"),
      );
    }
  }

  openUrl({required String url}) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri);
  }

  String getStatusMessage(int status) {
    switch (status) {
      case 1:
        return "Pending".tr;
      case 2:
        return "Confirmed".tr;
      case 3:
        return "Availed".tr;
      case 4:
        return "Rejected".tr;
      case 5:
        return "Cancelled".tr;

      default:
        return "Pending".tr;
    }
  }

  Color getStatusColor(int status) {
    switch (status) {
      case 1:
        return Colors.orange;
      case 2:
        return Colors.green;
      case 3:
        return primaryColor;
      case 4:
        return Colors.red;
      case 5:
        return Colors.red;

      default:
        return Colors.orange;
    }
  }
}
