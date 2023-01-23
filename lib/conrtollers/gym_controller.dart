import 'package:beauty_queens_ustomer/http/http.dart';
import 'package:beauty_queens_ustomer/models/shops/shops_listing.dart';
import 'package:beauty_queens_ustomer/models/simple/shop.dart';
import 'package:get/state_manager.dart';

class GYMController extends GetxController {
  RxList<Shop> gymCenterList = <Shop>[].obs;

  RxBool loading = false.obs;

  @override
  void onInit() {
    fetchShopsList();
    super.onInit();
  }

  fetchShopsList() async {
    try {
      loading(true);
      final result = await post("/client/shops/list", {"type": "2"});
      // print(result);
      if (result != null) {
        final shops = shopsFromJson(result?.body);

        print(shops);
        gymCenterList(shops!.data);
      }
    } finally {
      loading(false);
    }
  }
}
