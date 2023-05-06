import 'dart:math';

import 'package:beauty_queens_ustomer/conrtollers/helper_controller.dart';
import 'package:beauty_queens_ustomer/http/http.dart';
import 'package:beauty_queens_ustomer/models/shops/shops_listing.dart';
import 'package:beauty_queens_ustomer/models/simple/shop.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class ShopsController extends GetxController {
  RxList<Shop> shopsList = <Shop>[].obs;
  RxDouble currentLat = 23.6050501.obs;
  RxDouble currentLong = 58.0229838.obs;
  RxBool loading = false.obs;
  HelperController helperController = Get.put(HelperController());

  @override
  void onInit() {
    fetchShopsList();
    super.onInit();
  }

  Future<double> distance(
      double lat1, double lon1, double lat2, double lon2, String unit) async {
    double theta = lon1 - lon2;
    double dist = sin(deg2rad(lat1)) * sin(deg2rad(lat2)) +
        cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * cos(deg2rad(theta));
    dist = acos(dist);
    dist = rad2deg(dist);
    dist = dist * 60 * 1.1515;
    if (unit == 'K') {
      dist = dist * 1.609344;
    } else if (unit == 'N') {
      dist = dist * 0.8684;
    }
    return dist * (1.28);
  }

  double deg2rad(double deg) {
    return (deg * pi / 180.0);
  }

  double rad2deg(double rad) {
    return (rad * 180.0 / pi);
  }

  findDistance() async {
    List<Shop> shops = [];
    for (var element in shopsList) {
      element.distance = await distance(
          currentLat.value,
          currentLong.value,
          double.tryParse(element.latitude ?? "") ?? 0,
          double.tryParse(element.longitude ?? "") ?? 0,
          "K");
      element.isOpen = helperController.isProviderOpenInt(
          open1: element.openTime1 ?? "",
          open2: element.openTime2 ?? "",
          close1: element.closeTime1 ?? "",
          close2: element.closeTime2 ?? "");
      shops.add(element);
    }
    shopsList(shops);
    update();
  }

  sort(
      {required bool topRate,
      required bool mostRate,
      required bool nearBy,
      required bool isOpen}) {
    if (!topRate && !mostRate && !nearBy) {
      shopsList.sort((a, b) => a.id!.compareTo(b.id ?? 0));
    }

    // if (topRate) {
    //   gymCenterList.sort((b, a) => (a.ratters == 0 ? 0 : (a.stars / a.ratters))
    //       .compareTo((b.ratters == 0 ? 0 : (b.stars / b.ratters))));
    // }
    // if (mostRate) {
    //   gymCenterList.sort((b, a) => a.ratters.compareTo(b.ratters));
    // }
    if (nearBy) {
      shopsList.sort((a, b) => a.distance.compareTo(b.distance));
    }
    if (isOpen) {
      shopsList.sort((b, a) => a.isOpen.compareTo(b.isOpen));
    }
  }

  Future<bool> checkLocation() async {
    Location location = Location();

    PermissionStatus permissionGranted;

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
      } else {
        return true;
      }
    } else {
      var position = await location.getLocation();
      currentLat(position.latitude);
      currentLong(position.longitude);

      return true;
    }
    return false;
  }

  fetchShopsList() async {
    try {
      loading(true);
      final result = await post("/client/shops/list", {});
      // print(result);
      if (result != null) {
        final shops = shopsFromJson(result?.body);

        shopsList(shops?.data ?? []);
        findDistance();
      }
    } finally {
      loading(false);
    }
  }
}
