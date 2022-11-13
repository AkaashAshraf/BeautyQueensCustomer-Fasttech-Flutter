import 'package:beauty_queens_ustomer/conrtollers/saloons_controller.dart';
import 'package:beauty_queens_ustomer/http/http.dart';
import 'package:beauty_queens_ustomer/models/response/employee_list.dart';
import 'package:beauty_queens_ustomer/models/response/saloon_list.dart';
import 'package:beauty_queens_ustomer/models/response/service_list.dart';
import 'package:beauty_queens_ustomer/models/simple/saloon.dart';
import 'package:beauty_queens_ustomer/models/simple/service.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<Service> items = <Service>[].obs;
  RxBool loading = false.obs;

  RxBool saloonListLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  bool addToCart(Service service) {
    var contain = items.where(
        (element) => element.serviceAssigneeId == service.serviceAssigneeId);
    if (contain.isEmpty) {
      items.add(service);
      return true;
    } else {
      return false;
    }
  }
}
