import 'package:beauty_queens_ustomer/models/simple/cart.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<Cart> items = <Cart>[].obs;
  RxBool loading = false.obs;

  RxBool saloonListLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  bool addToCart(Cart item) {
    var contain =
        items.where((element) => element.providerID == item.providerID);
    if (contain.isEmpty) {
      items.add(item);
      return true;
    } else {
      return false;
    }
  }
}
