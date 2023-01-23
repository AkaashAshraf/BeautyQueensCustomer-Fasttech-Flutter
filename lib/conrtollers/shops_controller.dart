import 'package:beauty_queens_ustomer/http/http.dart';
import 'package:beauty_queens_ustomer/models/shops/shops_listing.dart';
import 'package:beauty_queens_ustomer/models/simple/shop.dart';
import 'package:get/state_manager.dart';

class ShopsController extends GetxController {
  RxList<Shop> shopsList = <Shop>[].obs;

  RxBool loading = false.obs;

  @override
  void onInit() {
    fetchShopsList();
    super.onInit();
  }

  fetchShopsList() async {
    try {
      loading(true);
      final result = await post("/client/shops/list", {});
      // print(result);
      if (result != null) {
        final shops = shopsFromJson(result?.body);

        shopsList(shops?.data ?? []);
      }
    } finally {
      loading(false);
    }
  }
}
