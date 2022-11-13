import 'package:beauty_queens_ustomer/http/http.dart';
import 'package:beauty_queens_ustomer/models/response/products_list.dart';
import 'package:beauty_queens_ustomer/models/response/shop_list.dart';
import 'package:beauty_queens_ustomer/models/simple/products.dart';
import 'package:beauty_queens_ustomer/models/simple/shop.dart';
import 'package:get/state_manager.dart';

class ShopsController extends GetxController {
  RxList<Shop> shopsList = <Shop>[].obs;
  RxList<Product> productsList = <Product>[].obs;

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
        final shops = shopsResponseFromJson(result?.body);

        print(shops);
        shopsList(shops.data);
      }
    } finally {
      loading(false);
    }
  }

  fetchShopProducts({required int shop}) async {
    try {
      loading(true);
      final result = await post("/client/shops/products", {"shop_id": "$shop"});
      // print("products------------------------");
      // print(result);
      if (result != null) {
        final products = productsResponseFromJson(result?.body);
        // print("products------------------------");
        // print(products.toJson());
        productsList.value = products.data!;
        return products.data;
      }
    } finally {
      loading(false);
    }
  }
}
