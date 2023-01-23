import 'package:beauty_queens_ustomer/components/common/toasts.dart';
import 'package:beauty_queens_ustomer/config/storages.dart';
import 'package:beauty_queens_ustomer/conrtollers/saloons_controller.dart';
import 'package:beauty_queens_ustomer/http/http.dart';
import 'package:beauty_queens_ustomer/main.dart';
import 'package:beauty_queens_ustomer/models/simple/cart.dart';
import 'package:beauty_queens_ustomer/models/simple/employee.dart';
import 'package:beauty_queens_ustomer/models/simple/saloon.dart';
import 'package:beauty_queens_ustomer/views/home/dashboard.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<CartItem> items = <CartItem>[].obs;
  RxInt selectedEmployee = 0.obs;
  Rx<Saloon> selectedSaloon = Saloon().obs;
  RxInt saloonID = 0.obs;

  RxList<Employee> employeesList = <Employee>[].obs;

  double get totalPrice => items.fold(0, (sum, item) => sum + (item.unitPrice));
  double get totalTime => items.fold(0, (sum, item) => sum + (item.time));

  RxBool loading = false.obs;

  RxBool saloonListLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  fetchEmployees(int id) async {
    employeesList.value =
        await Get.put(SaloonsController()).fetchEmployeesList(id: id);
  }

  emptyCart() {
    items.value = [];
    ToastMessages.showSuccess("Cart has been cleared successfully");
  }

  bool addToCart(CartItem item, Saloon saloon) {
    saloonID.value = item.providerID;
    var contain = items.where((element) => element.productID == item.productID);
    if (contain.isEmpty) {
      items.add(item);
      ToastMessages.showSuccess("Added to cart");
      // if (items.length == 1) {
      selectedSaloon.value = saloon;
      fetchEmployees(selectedSaloon.value.id ?? 0);
      // }

      return true;
    } else {
      return false;
    }
  }

  checkout({required String datetime}) async {
    try {
      loading(true);
      if (datetime.isEmpty) {
        ToastMessages.showError("Please select appointment date time");
        return;
      }
      if (selectedEmployee.value == 0) {
        ToastMessages.showError("Please select employee");
        return;
      }
      if (items.isEmpty) {
        ToastMessages.showError("Please select services");
        return;
      }
      var map = new Map<String, dynamic>();
      var userid = MyApp().storage.read(userIDPath);

      map['user_id'] = userid.toString();
      map['emp_id'] = selectedEmployee.toString();
      map['date'] = datetime;
      map['saloon_id'] = selectedSaloon.value.id.toString();
      // map['service_ids[0]'] = '6';
      for (int i = 0; i < items.length; i++) {
        map['service_ids[${i.toString()}]'] = items[i].productID.toString();
      }
      print(map.toString());
      var res = await post("/client/appointment/add", map);
      // ToastMessages.showError(res.statusCode.toString());
      // print(res.statusCode.toString());
      loading(false);
      if (res?.statusCode == 200) {
        ToastMessages.showSuccess(
            "Your appointment request has been submitted successfully. You will be notified after accept");
        items.value = [];
        Get.offAll(const DashboardView(title: ""));
      } else {
        // ToastMessages.showError("Something went wrong");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      loading(false);
    }
  }
}
