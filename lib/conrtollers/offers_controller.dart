import 'dart:developer';

import 'package:beauty_queens_ustomer/http/http.dart';
import 'package:beauty_queens_ustomer/models/offers/offers_list.dart';
import 'package:get/state_manager.dart';

class OffersController extends GetxController {
  RxList<Offer> offersList = <Offer>[].obs;

  RxBool loading = false.obs;

  @override
  void onInit() {
    fetchOffersList();
    super.onInit();
  }

  fetchOffersList() async {
    try {
      loading(true);
      final result = await post("/client/offers/list", {});
      if (result != null) {
        final data = offerListFromJson(result?.body);
        inspect(data);
        offersList(data.data!);
      }
    } finally {
      loading(false);
    }
  }
}
