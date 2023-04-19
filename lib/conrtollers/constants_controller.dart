import 'dart:developer';

import 'package:beauty_queens_ustomer/http/http.dart';
import 'package:beauty_queens_ustomer/models/constants/cities_model.dart';
import 'package:beauty_queens_ustomer/models/simple/city.dart';
import 'package:get/state_manager.dart';

class ConstantsController extends GetxController {
  RxList<City> cities = <City>[].obs;

  RxBool loading = false.obs;

  @override
  void onInit() {
    fetchCities();
    super.onInit();
  }

  fetchCities() async {
    try {
      loading(true);
      final result = await get("/common/cities");
      if (result != null) {
        final data = citiesResponseFromJson(result?.body);
        cities([City(nameEn: "All", nameAr: "الجميع", id: 0), ...data.data]);
      }
    } finally {
      loading(false);
    }
  }
}
